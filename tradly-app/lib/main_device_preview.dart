import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tradly_app/core/env/env.dart';
import 'package:tradly_app/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseKey,
  );
  runApp(
    DevicePreview(
      builder: (context) => const TradlyShopApp(),
    ),
  );
}
