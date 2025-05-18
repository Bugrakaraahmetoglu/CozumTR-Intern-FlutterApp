import 'package:czmtr_mobile_app/navigation/bloc/navigation_bloc.dart';
import 'package:czmtr_mobile_app/pages/HomePage.dart';
import 'package:czmtr_mobile_app/pages/LibraryPage.dart';
import 'package:czmtr_mobile_app/pages/PlaySong.dart';
import 'package:czmtr_mobile_app/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:czmtr_mobile_app/core/theme/app_theme.dart';

class FancyNavBar extends StatefulWidget {
  const FancyNavBar({super.key});

  @override
  State<FancyNavBar> createState() => _FancyNavBarState();
}

class _FancyNavBarState extends State<FancyNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc()..add(NavigationToHomeEvent()),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          Widget currentPage;
          if (state is NavigationHomeState) {
            currentPage = const Homepage();
          } else if (state is NavigationLibraryState) {
            currentPage =LibraryPage();
          } else if (state is NavigationProfileState) {
            currentPage = const Profilepage();
          } else if (state is NavigationPlaySongState) {
            currentPage = PlaySong(song: state.song);
          } else {
            currentPage = Homepage(); // fallback
          }

          return Scaffold(
            body: currentPage,
            bottomNavigationBar: BottomAppBar(
              color: AppTheme.bottomNavColor,
              shape: const CircularNotchedRectangle(),
              notchMargin: 8,
              child: SafeArea(
                minimum: EdgeInsets.only(bottom: 0),
                child: Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => context.read<NavigationBloc>().add(NavigationToHomeEvent()),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home,
                                color: state is NavigationHomeState
                                    ? Colors.white
                                    : AppTheme.unselectedOnboardingColor,
                                size: 26,
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Discover',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: state is NavigationHomeState
                                      ? Colors.white
                                      : AppTheme.unselectedOnboardingColor,
                                  fontWeight: state is NavigationHomeState ? FontWeight.bold : FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => context.read<NavigationBloc>().add(NavigationToLibraryEvent()),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/Library.png', width: 26, height: 26),
                              SizedBox(height: 2),
                              Text(
                                'Library',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: state is NavigationLibraryState
                                      ? Colors.white
                                      : AppTheme.unselectedOnboardingColor,
                                  fontWeight: state is NavigationLibraryState ? FontWeight.bold : FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => context.read<NavigationBloc>().add(NavigationToProfileEvent()),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                color: state is NavigationProfileState
                                    ? Colors.white
                                    : AppTheme.unselectedOnboardingColor,
                                size: 26,
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Profile',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: state is NavigationProfileState
                                      ? Colors.white
                                      : AppTheme.unselectedOnboardingColor,
                                  fontWeight: state is NavigationProfileState ? FontWeight.bold : FontWeight.normal,
                                  fontSize: 12,
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
          );
        },
      ),
    );
  }
}
