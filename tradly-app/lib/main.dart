import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tradly_app/app_provider.dart';
import 'package:tradly_app/core/api/api_client.dart';
import 'package:tradly_app/core/env/env.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/core/routes/app_router.dart';
import 'package:tradly_app/core/themes/app_theme.dart';
import 'package:tradly_app/data/repositories/auth_repo.dart';
import 'package:tradly_app/data/repositories/product_repo.dart';
import 'package:tradly_app/data/repositories/store_repo.dart.dart';
import 'package:tradly_app/firebase_options.dart';
import 'package:tradly_app/presentations/pages/auth/sign_in/states/sign_in_bloc.dart';
import 'package:tradly_app/presentations/pages/product_detail/states/product_detail_bloc.dart';
import 'package:tradly_app/presentations/pages/store/states/store_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseKey,
  );

  runApp(const TradlyShopApp());
}

class TradlyShopApp extends StatefulWidget {
  const TradlyShopApp({super.key});

  @override
  State<TradlyShopApp> createState() => _TradlyShopAppState();
}

class _TradlyShopAppState extends State<TradlyShopApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.inactive) {
      if ((FocusManager.instance.primaryFocus?.hasFocus ?? false) &&
          Platform.isAndroid) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(
            authRepository: AuthRepositoryImplement(Supabase.instance.client),
          ),
        ),
        BlocProvider(
          create: (context) => ProductDetailBloc(
            repo: ProductRepositoryImpl(
              apiClient: TradlyApiClient(
                baseUrl: Env.endPoint,
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => StoreBloc(
            repo: StoreRepositoryImpl(
              apiClient: TradlyApiClient(
                baseUrl: Env.endPoint,
              ),
            ),
          ),
        ),
      ],
      child: TAProvider(
        child: MaterialApp.router(
          theme: TATheme.light,
          darkTheme: TATheme.dark,
          debugShowCheckedModeBanner: false,
          locale: const Locale('en', 'US'),
          localizationsDelegates: const [
            S.delegate,
          ],
          supportedLocales: [
            ...S.delegate.supportedLocales,
            const Locale('en', ''),
          ],
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.noScaling),
              child: child!,
            ),
            breakpoints: [
              /// Mobile sizes (Pixel 4a, Galaxy S20, iPhones, most Android
              /// devices)
              const Breakpoint(
                start: 0,
                end: 800,
                name: MOBILE,
              ),

              /// Tablets (iPad, Galaxy Tab)
              const Breakpoint(
                start: 769,
                end: 1024,
                name: TABLET,
              ),
            ],
          ),
          routeInformationProvider: TARouter.router.routeInformationProvider,
          routeInformationParser: TARouter.router.routeInformationParser,
          routerDelegate: TARouter.router.routerDelegate,
        ),
      ),
    );
  }
}
