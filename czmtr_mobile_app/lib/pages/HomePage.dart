import 'package:flutter/material.dart';
import 'package:czmtr_mobile_app/core/theme/app_theme.dart';
import 'package:czmtr_mobile_app/model/Song.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:czmtr_mobile_app/navigation/bloc/navigation_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> categories = ['All', 'Life', 'Comedy', 'Tech'];
  int selectedCategory = 0;

  final List<Song> trendingSongs = [
    Song(
      id: 1,
      title: 'The missing 99 percent of the universe',
      artist: 'Chris Martin',
      imagePath: 'assets/images/group_1092.png',
    ),

    Song(
      id: 2,
      title: 'How Daily Parton led me to an epiphany',
      artist: 'Alexandra Joy',
      imagePath: 'assets/images/album_Art.png',
    ),
    Song(
      id: 3,
      title: 'The missing 96 percent of the universe',
      artist: 'Tim McGraw',
      imagePath: 'assets/images/album_Art1.png',
    ),
    Song(
      id: 4,
      title: 'Ngobam with Danny Caknan',
      artist: 'Danny Caknan',
      imagePath: 'assets/images/album_Art2.png',
    ),
    Song(
      id: 5,
      title: 'The missing 99 percent of the universe',
      artist: 'Chris Martin',
      imagePath: 'assets/images/group_1092.png',
    ),
    Song(
      id: 6,
      title: 'How Daily Parton led me to an epiphany',
      artist: 'Alexandra Joy',
      imagePath: 'assets/images/album_Art.png',
    ),
    Song(
      id: 7,
      title: 'The missing 96 percent of the universe',
      artist: 'Tim McGraw',
      imagePath: 'assets/images/album_Art1.png',
    ),
    Song(
      id: 8,
      title: 'Ngobam with Danny Caknan',
      artist: 'Danny Caknan',
      imagePath: 'assets/images/album_Art2.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int selectedCategory = this.selectedCategory;
    final width = MediaQuery.of(context).size.width;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final isTablet = width > 600;
    int crossAxisCount = 2;
    double childAspectRatio = 0.75;
    if (isTablet && isLandscape) {
      crossAxisCount = 4;
      childAspectRatio = 0.8;
    } else if (isTablet) {
      crossAxisCount = 3;
      childAspectRatio = 0.78;
    } else if (isLandscape) {
      crossAxisCount = 3;
      childAspectRatio = 1.0;
    }
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? 24.0 : 23.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/group_1030.png',
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                          const Text(
                            'Podkes',
                            style: AppTheme.appTitleStyle,
                          ),
                          Image.asset(
                            'assets/images/Notification.png',
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Search Bar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppTheme.searchBarBgColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: AppTheme.searchBarStyle,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            contentPadding: const EdgeInsets.symmetric(vertical: 12),
                            hintStyle: AppTheme.searchBarHintStyle,
                            prefixIcon: null,
                            suffixIcon: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
                              child: ImageIcon(
                                AssetImage('assets/images/Search.png'),
                                color: AppTheme.searchBarHintColor,
                                size: 20,
                              ),
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isTablet ? 24.0 : 23.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          // Categories
                          Center(
                            child: SizedBox(
                              height: 40,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  final isSelected = selectedCategory == index;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedCategory = index;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 6),
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: isSelected ? AppTheme.categorySelectedBgColor : AppTheme.categoryContainerBgColor,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: isSelected ? Colors.white : AppTheme.categoryBorderColor,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          categories[index],
                                          style: AppTheme.categoryTextStyle,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Trending Text
                          const Text(
                            'Trending',
                            style: AppTheme.trendingTitleStyle,
                          ),
                          const SizedBox(height: 16),
                          // Grid
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              childAspectRatio: childAspectRatio,
                              crossAxisSpacing: isTablet ? 24 : 16,
                              mainAxisSpacing: isTablet ? 24 : 16,
                            ),
                            itemCount: trendingSongs.length,
                            itemBuilder: (context, index) {
                              final song = trendingSongs[index];
                              return InkWell(
                                onTap: () {
                                  context.read<NavigationBloc>().add(NavigationToPlaySongEvent(song: song));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppTheme.backgroundColor,
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                                          child: Image.asset(
                                            song.imagePath,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: isLandscape ? 4 : 8,
                                            right: isLandscape ? 4 : 8,
                                            bottom: isLandscape ? 4 : 8,
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  song.title,
                                                  style: AppTheme.podcastTitleStyle,
                                                  maxLines: 2,
                                                ),
                                              ),
                                              Text(
                                                song.artist,
                                                style: AppTheme.podcastAuthorStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

}
