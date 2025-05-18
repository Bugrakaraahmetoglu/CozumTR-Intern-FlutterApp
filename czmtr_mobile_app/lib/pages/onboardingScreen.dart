import 'package:czmtr_mobile_app/navigation/FancyNavBar.dart';
import 'package:czmtr_mobile_app/navigation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 1;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/group_1090.png',
      'title': 'Podkes',
      'desc': 'OnBoarding1',
    },
    {
      'image': 'assets/images/group_1090.png',
      'title': 'Podkes',
      'desc': 'A podcast is an episodic series of spoken word digital audio files that a user can download to a personal device for easy listening.',
    },
    {
      'image': 'assets/images/group_1090.png',
      'title': 'Discover',
      'desc': 'Onboarding 3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.shortestSide >= 600;
    final isPortrait = size.height > size.width;

    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        if (state is NavigationHomeState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const FancyNavBar()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxWidth = constraints.maxWidth;

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 48 : 24,
                      vertical: isPortrait ? 16 : 8,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2),
                        SizedBox(
                          height: isPortrait ? size.height * 0.3 : size.height * 0.5,
                          child: Image.asset(
                            onboardingData[currentIndex]['image']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          onboardingData[currentIndex]['title']!,
                          style: TextStyle(
                            color: AppTheme.textColor,
                            fontSize: isTablet ? 36 : 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          onboardingData[currentIndex]['desc']!,
                          style: TextStyle(
                            color: AppTheme.textColor.withOpacity(0.7),
                            fontSize: isTablet ? 18 : 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardingData.length,
                                (index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: _buildDot(index == currentIndex),
                            ),
                          ),
                        ),
                        const Spacer(flex: 2),
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              setState(() {
                                if (currentIndex < onboardingData.length - 1) {
                                  currentIndex++;
                                } else {
                                  context.read<NavigationBloc>().add(NavigationToHomeEvent());
                                }
                              });
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              color: AppTheme.selectedOnboardingColor,
                              size: 32,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDot(bool selected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: selected ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: selected
            ? AppTheme.selectedOnboardingColor
            : AppTheme.unselectedOnboardingColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
