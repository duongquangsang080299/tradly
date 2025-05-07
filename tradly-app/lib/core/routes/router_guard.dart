import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradly_app/core/routes/app_router.dart';

class RouterGuard {
  static Future<String?> authGuard(
    BuildContext context,
    GoRouterState state,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final sessionToken = prefs.getString('session_token');
    final isLoggedIn = sessionToken != null;

    if (isLoggedIn &&
        (state.uri.toString() == TAPaths.onboarding.path ||
            state.uri.toString() == TAPaths.signIn.path)) {
      return TAPaths.home.path;
    }

    if (!isLoggedIn &&
        state.uri.toString() != TAPaths.onboarding.path &&
        state.uri.toString() != TAPaths.signIn.path &&
        state.uri.toString() != TAPaths.signUp.path) {
      return TAPaths.onboarding.path;
    }

    return null;
  }
}

class UserSession {
  final String? sessionToken;

  UserSession({this.sessionToken});
}
