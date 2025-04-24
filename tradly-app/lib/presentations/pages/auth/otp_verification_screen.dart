import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/core/routes/app_router.dart';
import 'package:tradly_app/presentations/widgets/button.dart';
import 'package:tradly_app/presentations/layouts/app_bar.dart';
import 'package:tradly_app/presentations/widgets/text.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                text: S.current.otpVerificationTitle,
              ),
              SizedBox(height: 25),
              TaHeadlineSmallText(
                text: S.current.otpVerificationDescription,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 75),
              OtpInput(
                length: 6,
                onChanged: (value) {},
              ),
              SizedBox(height: 90),
              TaHeadlineMediumText(
                text: S.current.otpVerificationReceivedCodeTitle,
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: TaHeadlineMediumText(
                  text: S.current.otpVerificationResentCodeTitle,
                ),
              ),
              SizedBox(height: 57),
              TAElevatedButton(
                fontWeight: FontWeight.w500,
                text: S.current.otpVerificationButton,
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

class OtpInput extends StatelessWidget {
  const OtpInput({
    super.key,
    required this.length,
    this.onChanged,
  });

  final int length;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(length, (index) {
        return SizedBox(
          width: 40,
          child: TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onPrimary,
            ),
            decoration: InputDecoration(
              isDense: true,
              counterText: '',
              hintText: '-',
              hintStyle: TextStyle(
                fontSize: 30,
                color: context.colorScheme.onPrimary,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
              ),
              filled: true,
              fillColor: context.colorScheme.primary,
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < length - 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
              if (onChanged != null) {
                onChanged!(value);
              }
            },
          ),
        );
      }),
    );
  }
}
