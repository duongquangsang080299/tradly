import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/core/routes/app_router.dart';
import 'package:tradly_app/presentations/layouts/scaffold.dart';
import 'package:tradly_app/presentations/widgets/assets.dart';
import 'package:tradly_app/presentations/widgets/button.dart';
import 'package:tradly_app/presentations/widgets/text.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  final int numPages = 3;
  int currentPage = 0;

  final List<OnboardingItem> onboardingData = [
    OnboardingItem(
      image: TAAssets.onboardingBusiness(),
      description: S.current.onBoardingBusinessDescription,
    ),
    OnboardingItem(
      image: TAAssets.onboardingSocial(),
      description: S.current.onBoardingSocialDescription,
    ),
    OnboardingItem(
      image: TAAssets.onboardingSupport(),
      description: S.current.onBoardingsupportDescription,
    ),
  ];

  List<Widget> _buildPageIndicator() => List.generate(
        numPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            color: currentPage == index
                ? context.colorScheme.primary
                : context.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentPage == numPages - 1;

    return TAScaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 358,
                color: context.colorScheme.primary,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) => setState(() => currentPage = index),
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    final item = onboardingData[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 334,
                          width: 304,
                          decoration: BoxDecoration(
                            color: context.colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: item.image,
                        ),
                        const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 46),
                          child: TAHeadlineLargeText(
                            text: item.description,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: TAElevatedButton(
          fontWeight: FontWeight.w600,
          text: isLastPage
              ? S.current.onBoardingFinishButton
              : S.current.onBoardingNextButton,
          backgroundColor: context.colorScheme.primary,
          onPressed: () {
            if (isLastPage) {
              context.pushNamed(TAPaths.signIn.name);
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          },
        ),
      ),
    );
  }
}

class OnboardingItem {
  final Widget image;
  final String description;

  OnboardingItem({
    required this.image,
    required this.description,
  });
}
