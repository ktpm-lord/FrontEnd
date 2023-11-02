import 'package:collection/collection.dart';
import 'package:fit_life/app_coordinator.dart';
import 'package:fit_life/core/components/widgets/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:fit_life/core/components/extensions/context_extensions.dart';
import 'package:fit_life/generated/l10n.dart';
import 'package:fit_life/mvvm/ui/onboarding/views/step/fill_your_profile_screen.dart';
import 'package:fit_life/mvvm/ui/onboarding/views/step/get_height_screen.dart';
import 'package:fit_life/mvvm/ui/onboarding/views/step/get_old_screen.dart';
import 'package:fit_life/mvvm/ui/onboarding/views/step/get_weight_screen.dart';
import 'package:fit_life/mvvm/ui/onboarding/views/step/get_weight_target_screen.dart';
import 'package:fit_life/mvvm/ui/onboarding/views/step/select_duration_screen.dart';
import 'package:fit_life/mvvm/ui/onboarding/views/step/select_gender_screen.dart';
import 'package:fit_life/routes/routes.dart';
import 'package:im_stepper/stepper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int activeStep = 0;

  int upperBound = 6;

  @override
  Widget build(BuildContext context) {
    final body = [
      const FillYourProfileScreen(),
      const SelectGenderScreen(),
      const GetOldStep(),
      const GetHeightStep(),
      const GetWeightScreen(),
      const SelectDurationScreen(),
      const GetWeightTargetScreen(),
    ];
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ButtonCustom(
          height: 45.0,
          radius: 5.0,
          onPress: () {
            if (activeStep < upperBound) {
              setState(() {
                activeStep++;
              });
            } else {
              context.openListPageWithRoute(Routes.dashboard);
            }
          },
          child: Text(
            S.of(context).next,
            style: context.titleMedium
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(top: kToolbarHeight),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 75.0,
                      child: IconStepper(
                        direction: Axis.horizontal,
                        icons: [
                          Icons.cake,
                          Icons.scale,
                          Icons.login,
                          Icons.height,
                          Icons.person,
                          Icons.timer_outlined,
                          Icons.golf_course_sharp,
                        ].mapIndexed((index, e) {
                          final color = (index == activeStep)
                              ? Colors.white
                              : context.titleLarge.color;
                          return Icon(e, size: 12.0, color: color);
                        }).toList(),
                        stepColor: Theme.of(context).scaffoldBackgroundColor,
                        activeStep: activeStep,
                        activeStepColor: context.primaryColor,
                        enableNextPreviousButtons: false,
                        lineColor: Theme.of(context).primaryColor,
                        stepReachedAnimationEffect: Curves.easeInOutCubic,
                        onStepReached: (index) {
                          setState(() {
                            activeStep = index;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    body[activeStep],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
