import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/core/routes/app_router.dart';
import 'package:tradly_app/presentations/layouts/scaffold.dart';
import 'package:tradly_app/presentations/pages/auth/sign_in/states/sign_in_bloc.dart';
import 'package:tradly_app/presentations/pages/auth/sign_in/states/sign_in_event.dart';
import 'package:tradly_app/presentations/pages/auth/sign_in/states/sign_in_state.dart';
import 'package:tradly_app/core/utils/enumeration.dart';
import 'package:tradly_app/core/utils/validators.dart';
import 'package:tradly_app/presentations/widgets/button.dart';
import 'package:tradly_app/presentations/widgets/form.dart';
import 'package:tradly_app/presentations/widgets/indicator.dart';
import 'package:tradly_app/presentations/widgets/text_field.dart';
import 'package:tradly_app/presentations/widgets/snackbar.dart';
import 'package:tradly_app/presentations/widgets/text.dart';
import 'package:tradly_app/data/repositories/auth_repo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _authRepository = AuthRepositoryImplement(Supabase.instance.client);
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocProvider(
        create: (context) => SignInBloc(
          authRepository: _authRepository,
        ),
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) async {
            if (state.viewState == SubmissionStatus.loading) {
              TALoadingIndicator.show(context);
            } else if (state.viewState == SubmissionStatus.successful) {
              TALoadingIndicator.hide(context);
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('session_token', state.sessionToken ?? '');
              if (context.mounted) {
                await context.pushNamed(TAPaths.home.name);
              }
            } else if (state.viewState == SubmissionStatus.failed) {
              TALoadingIndicator.hide(context);
              TASnackBar.buildErrorSnackbar(
                context,
                state.errorMessage ?? '',
              );
            }
          },
          child: TAScaffold(
            backgroundColor: context.colorScheme.primary,
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TADisplaySmallText(
                      text: S.current.signInWelcomeTitle,
                    ),
                    const SizedBox(height: 66),
                    TAHeadlineSmallText(
                      text: S.current.signInLoginPrompt,
                    ),
                    const SizedBox(height: 25),
                    BlocBuilder<SignInBloc, SignInState>(
                      buildWhen: (previous, current) =>
                          previous.viewState != current.viewState,
                      builder: (context, state) => TAForm(
                        isValidated: (valid) => context.read<SignInBloc>().add(
                              SignInFormValidateChangedEvt(
                                isValidate: valid,
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            ),
                        spaceBetweenRow: 20,
                        textFields: [
                          TATextField(
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            label: S.current.signInEmailOrMobileLabel,
                            useMaterialStyle: false,
                            labelStyle:
                                TextStyle(color: context.colorScheme.onPrimary),
                            validator: (value) =>
                                InputValidationMixin.validEmailOrPhone(
                                    value ?? ''),
                          ),
                          TATextField(
                            controller: _passwordController,
                            label: S.current.signInPasswordLabel,
                            labelStyle:
                                TextStyle(color: context.colorScheme.onPrimary),
                            useMaterialStyle: false,
                            isPassword: true,
                            validator: (value) =>
                                InputValidationMixin.validPassword(value ?? ''),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 38),
                    BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) => TAElevatedButton(
                        isDisabled: !state.isFormValid,
                        fontWeight: FontWeight.w500,
                        text: S.current.signInLoginButton,
                        textSize: 16,
                        textColor: context.colorScheme.primary,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            context
                                .read<SignInBloc>()
                                .add(SignInButtonPressedEvt());
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {},
                      child: TAHeadlineMediumText(
                        text: S.current.signInForgotPassword,
                      ),
                    ),
                    const SizedBox(height: 45),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(TAPaths.signUp.name);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: S.current.signInSignUpPrompt,
                          style: context.textTheme.headlineMedium?.copyWith(
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: S.current.signUpButton,
                              style: context.textTheme.headlineMedium?.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
