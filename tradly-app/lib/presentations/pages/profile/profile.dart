import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/assets_generated/assets.gen.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/core/routes/app_router.dart';
import 'package:tradly_app/data/models/user_model.dart';
import 'package:tradly_app/presentations/layouts/app_bar.dart';
import 'package:tradly_app/presentations/widgets/assets.dart';
import 'package:tradly_app/presentations/widgets/images.dart';
import 'package:tradly_app/presentations/widgets/text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    this.user,
  });

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.inversePrimary,
      appBar: TaAppBar(
        centerTitle: false,
        toolbarHeight: TaAppBarSize.small,
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: TaDisplaySmallText(
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
      body: Stack(
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
                    TaTitleLargeText(
                      text: user?.userName ?? '',
                      color: context.colorScheme.onPrimary,
                    ),
                    SizedBox(height: 4),
                    TaTitleLargeText(
                      text: user?.phoneNumber ?? '',
                      color: context.colorScheme.onPrimary,
                    ),
                    SizedBox(height: 2),
                    TaTitleLargeText(
                      text: user?.email ?? '',
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
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.remove('session_token');
                        if (context.mounted) {
                          context.go(TAPaths.onboarding.path);
                        }
                      }),
                ],
              ),
            ),
          ),
        ],
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
        child: TaTitleLargeText(
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
