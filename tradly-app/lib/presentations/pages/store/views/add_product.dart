import 'package:flutter/material.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/presentations/widgets/icons.dart';
import 'package:tradly_app/presentations/widgets/text.dart';

class AddProductCard extends StatelessWidget {
  final VoidCallback onTap;

  const AddProductCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colorScheme.onSecondary,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TAIcons.add(size: 40),
            const SizedBox(height: 8),
            TAHeadlineMediumText(
              text: S.current.storeAddProductButton,
              color: context.colorScheme.outline,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
