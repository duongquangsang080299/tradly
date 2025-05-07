import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tradly_app/core/api/api_client.dart';
import 'package:tradly_app/core/env/env.dart';
import 'package:tradly_app/data/repositories/auth_repo.dart';
import 'package:tradly_app/data/repositories/home_repo.dart';
import 'package:tradly_app/data/repositories/product_repo.dart';
import 'package:tradly_app/data/repositories/store_repo.dart.dart';
import 'package:tradly_app/presentations/pages/auth/sign_in/states/sign_in_bloc.dart';
import 'package:tradly_app/presentations/pages/auth/sign_up/states/sign_up_bloc.dart';

class TAProvider extends StatelessWidget {
  const TAProvider({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TradlyApiClient>(
          create: (context) => TradlyApiClient(
            baseUrl: Env.endPoint,
          ),
        ),
        RepositoryProvider(
          create: (context) => SignInBloc(
            authRepository: AuthRepositoryImplement(
              Supabase.instance.client,
            ),
          ),
        ),
        RepositoryProvider(
          create: (context) => SignUpBloc(
            authRepository: AuthRepositoryImplement(
              Supabase.instance.client,
            ),
          ),
        ),
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepositoryImpl(
            apiClient: TradlyApiClient(
              baseUrl: Env.endPoint,
            ),
          ),
        ),
        RepositoryProvider<ProductRepository>(
          create: (context) => ProductRepositoryImpl(
            apiClient: TradlyApiClient(
              baseUrl: Env.endPoint,
            ),
          ),
        ),
        RepositoryProvider<StoreRepository>(
          create: (context) => StoreRepositoryImpl(
            apiClient: TradlyApiClient(
              baseUrl: Env.endPoint,
            ),
          ),
        ),
      ],
      child: child,
    );
  }
}
