import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(
  path: './.env',
)
abstract class Env {
  @EnviedField(varName: 'SUPABASE_URL')
  static String supabaseUrl = _Env.supabaseUrl;

  @EnviedField(varName: 'SUPABASE_KEY')
  static String supabaseKey = _Env.supabaseKey;

  @EnviedField(varName: 'SUPABASE_ENDPOINT')
  static String endPoint = _Env.endPoint;
}
