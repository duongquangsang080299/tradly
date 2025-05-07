import 'package:flutter/material.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/presentations/widgets/text.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
    this.onTap,
    this.textColor,
    this.buttonColor,
    this.buttonText,
    this.buttonTextColor,
  });
  final String title;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TAHeadlineMediumText(
            text: title,
            fontWeight: FontWeight.w700,
            color: textColor ?? context.colorScheme.outline,
          ),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 25),
              backgroundColor: buttonColor ?? context.colorScheme.primary,
            ),
            child: TATitleMediumText(
              text: buttonText ?? S.current.homeSeeAllButton,
              color: buttonTextColor ?? context.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
