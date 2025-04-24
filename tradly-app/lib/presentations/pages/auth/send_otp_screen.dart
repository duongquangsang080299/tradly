import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/core/routes/app_router.dart';
import 'package:tradly_app/presentations/widgets/button.dart';
import 'package:tradly_app/presentations/widgets/text_field.dart';
import 'package:tradly_app/presentations/layouts/app_bar.dart';
import 'package:tradly_app/presentations/widgets/text.dart';
import 'package:tradly_app/presentations/widgets/form.dart';

class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: context.colorScheme.primary,
        appBar: TaAppBar(
          toolbarHeight: TaAppBarSize.small,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TaDisplaySmallText(
                text: S.current.sendOtpTitle,
              ),
              SizedBox(height: 29),
              TaHeadlineSmallText(
                text: S.current.sendOtpDescription,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              TAForm(
                textFields: [
                  TATextField(
                    label: S.current.sendOtpPhoneNumberTitle,
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    dropdownItems: [
                      DropdownMenuItem(
                        value: '+1',
                        child: Text('+1'),
                      ),
                      DropdownMenuItem(
                        value: '+44',
                        child: Text('+44'),
                      ),
                      DropdownMenuItem(
                        value: '+91',
                        child: Text('+91'),
                      ),
                    ],
                    onDropdownChanged: (value) {},
                  ),
                ],
                isValidated: (isValid) {},
              ),
              SizedBox(height: 104),
              TextButton(
                onPressed: () {},
                child: TaHeadlineMediumText(
                  text: S.current.sendOtpLoginSocialNetWorkTitle,
                ),
              ),
              SizedBox(height: 16),
              TAElevatedButton(
                fontWeight: FontWeight.w500,
                text: S.current.sendOtpNextButton,
                textSize: 16,
                textColor: context.colorScheme.primary,
                backgroundColor: context.colorScheme.onPrimary,
                onPressed: () {
                  context.pushNamed(TAPaths.otpVerification.name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
