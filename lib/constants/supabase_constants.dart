import "package:doza_pet/env/env.dart";

abstract class SupabaseConstants {
  static const String url = Env.supabaseUrl;
  static const String anonKey = Env.supabaseAnonKey;
}
