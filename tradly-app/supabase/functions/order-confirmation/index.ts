import { createClient } from 'npm:@supabase/supabase-js@2';
import { JWT } from 'npm:google-auth-library@9';

interface Order {
  id: string;
  profile_id: string;
  title: string;
  price: string;
  newPrice: string;
  user_id: string;
  imageUrl: string;
}

interface WebhookPayload {
  type: 'INSERT';
  table: string;
  record: Order;
  schema: 'public';
  old_record: null | Order;
}

const supabase = createClient(
  Deno.env.get('SUPABASE_URL') ?? '',
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
);

Deno.serve(async (req) => {
  const payload: WebhookPayload = await req.json();

  // Fetch the FCM token
  const { data, error } = await supabase
    .from('profiles')
    .select('fcm_token')
    .eq('id', payload.record.user_id)
    .single();

  if (error || !data) {
    return new Response("FCM token not found", { status: 404 });
  }

  const fcmToken = data.fcm_token as string;
  const { default: serviceAccount } = await import('../service-account.json', {
    with: { type: 'json' },
  });

  const accessToken = await getAccessToken({
    clientEmail: serviceAccount.client_email,
    privateKey: serviceAccount.private_key,
  });

  const res = await fetch(
    `https://fcm.googleapis.com/v1/projects/${serviceAccount.project_id}/messages:send`,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${accessToken}`,
      },
      body: JSON.stringify({
        message: {
          token: fcmToken,
          notification: {
            title: `Order confirmation`,
            body: `${payload.record.title} checkout ${payload.record.price}`,
          },
        },
      }),
    }
  );

  const resData = await res.json();
  if (res.status < 200 || res.status >= 300) {
    return new Response(JSON.stringify(resData), { status: res.status });
  }

  return new Response(JSON.stringify(resData), {
    headers: { 'Content-Type': 'application/json' },
  });
});

const getAccessToken = (
  { clientEmail, privateKey }: { clientEmail: string; privateKey: string }
): Promise<string> => {
  return new Promise((resolve, reject) => {
    const jwtClient = new JWT({
      email: clientEmail,
      key: privateKey,
      scopes: ['https://www.googleapis.com/auth/firebase.messaging'],
    });
    jwtClient.authorize((err, tokens) => {
      if (err) {
        reject(err);
      } else {
        resolve(tokens!.access_token!);
      }
    });
  });
};