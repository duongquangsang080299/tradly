import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tradly_app/presentations/layouts/scaffold.dart';
import 'package:tradly_app/presentations/pages/profile/states/profile_bloc.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/assets_generated/assets.gen.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/core/routes/app_router.dart';
import 'package:tradly_app/data/repositories/auth_repo.dart';
import 'package:tradly_app/presentations/layouts/app_bar.dart';
import 'package:tradly_app/presentations/pages/profile/states/profile_event.dart';
import 'package:tradly_app/presentations/pages/profile/states/profile_state.dart';
import 'package:tradly_app/presentations/widgets/assets.dart';
import 'package:tradly_app/presentations/widgets/images.dart';
import 'package:tradly_app/presentations/widgets/not_found.dart';
import 'package:tradly_app/presentations/widgets/text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        repo: AuthRepositoryImplement(Supabase.instance.client),
      )..add(FetchProfileEvt()),
      child: TAScaffold(
        appBar: TaAppBar(
          centerTitle: false,
          toolbarHeight: TaAppBarSize.small,
          title: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: TADisplaySmallText(
              text: S.current.profileTitle,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: context.colorScheme.primary,
          trailing: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
                ),
                IconButton(
                  icon: TAAssets.cart(),
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove('session_token');
                    if (context.mounted) {
                      context.go(TAPaths.onboarding.path);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.status is ProfileStatusLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status is ProfileStatusSuccess) {
              final user = state.user;
              return Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 251,
                    color: context.colorScheme.primary,
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TAImageCircle(
                          radius: 32,
                          Assets.images.imgTradly.path,
                          boxFit: BoxFit.cover,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TATitleLargeText(
                              text: user?.userName ?? '',
                              color: context.colorScheme.onPrimary,
                            ),
                            const SizedBox(height: 4),
                            TATitleLargeText(
                              text: user?.email ?? '',
                              color: context.colorScheme.onPrimary,
                            ),
                            const SizedBox(height: 2),
                            TATitleLargeText(
                              text: user?.phoneNumber ?? '',
                              color: context.colorScheme.onPrimary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 110,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 32,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: context.colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _menuItem(
                            title: S.current.profileEditTitle,
                            onTap: () {},
                          ),
                          _menuItem(
                            title: S.current.profileLanguageCurrencyTitle,
                            onTap: () {},
                          ),
                          _divider(),
                          _menuItem(
                            title: S.current.profileFeedbackTitle,
                            onTap: () {},
                          ),
                          _divider(),
                          _menuItem(
                            title: S.current.profileReferFriendTitle,
                            onTap: () {},
                          ),
                          _divider(),
                          _menuItem(
                            title: S.current.profileTermsAndConditionsTitle,
                            onTap: () {},
                          ),
                          _divider(),
                          _menuItem(
                            title: S.current.profileLogoutTitle,
                            textColor: context.colorScheme.primary,
                            onTap: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.remove('session_token');
                              if (context.mounted) {
                                context.go(TAPaths.onboarding.path);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (state.status is ProfileStatusFailure) {
              return NotFoundScreen();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _menuItem({
    required String title,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: TATitleLargeText(
          text: title,
          fontWeight: FontWeight.w500,
          color: textColor ?? Colors.black87,
        ),
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      height: 1,
      thickness: 1,
      indent: 16,
      endIndent: 16,
      color: Color(0xFFEEEEEE),
    );
  }
}
