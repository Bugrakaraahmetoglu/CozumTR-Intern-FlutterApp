import 'package:czmtr_mobile_app/navigation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:czmtr_mobile_app/core/theme/app_theme.dart';
import 'package:czmtr_mobile_app/model/Song.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaySong extends StatelessWidget {
  final Song song;

  const PlaySong({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.read<NavigationBloc>().add(NavigationToHomeEvent());
          },
        ),
        centerTitle: true,
        title: const Text(
          'Now Playing',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          // Küp bir çerçeve için en küçük boyutu seç
          double imageSize = (screenWidth < screenHeight
              ? screenWidth
              : screenHeight) * 0.6;

          return Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                // maksimum genişlik limiti
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          song.imagePath,
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        song.title,
                        style: AppTheme.podcastTitleStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        song.artist,
                        style: AppTheme.podcastAuthorStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),

                      AudioWaveformBar(progress: 0.72),
                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("24:32", style: TextStyle(color: Colors.white)),
                          Text("34:00", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      const SizedBox(height: 32),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                              Icons.fast_rewind, color: Colors.white, size: 36),
                          SizedBox(width: 40),
                          Icon(Icons.play_circle_fill, color: Colors.white,
                              size: 64),
                          SizedBox(width: 40),
                          Icon(Icons.fast_forward, color: Colors.white,
                              size: 36),
                        ],
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

  class AudioWaveformBar extends StatelessWidget {
  final double progress; // 0.0 - 1.0

  const AudioWaveformBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final List<double> waveformData = [
      10, 14, 20, 24, 18, 28, 30, 18, 10, 8,
      6, 8, 12, 16, 22, 20, 16, 14, 18, 22,
      24, 26, 28, 30, 28, 26, 22, 20, 18, 16,
    ]; // Yaklaşık 30 bar - görseldeki gibi

    final int totalBars = waveformData.length;

    return Center(
      child: SizedBox(
        width: 300, // 👈 Görseldeki gibi genişlik sınırlı
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalBars, (index) {
            final isPlayed = index < (progress * totalBars);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                width: 6, // 👈 Geniş barlar
                height: waveformData[index],
                decoration: BoxDecoration(
                  color: isPlayed ? Colors.white : Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

