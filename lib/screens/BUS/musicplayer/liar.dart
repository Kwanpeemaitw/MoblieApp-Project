import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:musicapp_final/constants/strings.dart';
import 'package:musicapp_final/models/music.dart';
import 'package:musicapp_final/screens/BUS/musicplayer/brotherzone_music.dart';
import 'package:musicapp_final/screens/BUS/musicplayer/nomatterwhat_music.dart';
import 'package:musicapp_final/screens/BUS/musicplayer/widget/art_work_images.dart';
import 'package:musicapp_final/screens/BUS/playlists/sadsong_screen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spotify/spotify.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class LiarMusic extends StatefulWidget {
  const LiarMusic({super.key});

  @override
  State<LiarMusic> createState() => _LiarMusicState();
}

class _LiarMusicState extends State<LiarMusic> {
  final player = AudioPlayer();
  Music music = Music(trackId: '5dpJemvWkTEM3qIKSbKB82');
  bool isLoading = true; // Add loading state

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Spotify credentials
    final credentials = SpotifyApiCredentials(
        CustomStrings.clientId, CustomStrings.clientSecret);
    final spotify = SpotifyApi(credentials);

    // Fetching track information
    spotify.tracks.get(music.trackId).then((track) async {
      String? tempSongName = track.name;
      if (tempSongName != null) {
        music.songName = tempSongName;
        music.artistName = track.artists?.first.name ?? "";
        String? image = track.album?.images?.first.url;
        if (image != null) {
          music.songImage = image;
          final tempSongColor = await getImagePalette(NetworkImage(image));
          if (tempSongColor != null) {
            music.songColor = tempSongColor;
          }
        }
        music.artistImage = track.artists?.first.images?.first.url;

        // Handle audio streaming
        try {
          var yt = YoutubeExplode();
          final video = (await yt.search
                  .search("$tempSongName ${music.artistName ?? ""}"))
              .first;
          music.duration = video.duration;

          await player.setSource(UrlSource(
              'https://firebasestorage.googleapis.com/v0/b/musicapp-19ecb.appspot.com/o/liar.mp3?alt=media&token=e39c728b-700c-464b-9c72-edd2f7d0a338')); // Set audio source
          await player.resume(); // Start playback
        } catch (e) {
          print("Error: $e");
        }

        setState(() {
          isLoading = false; // Update loading state
        });
      }
    });
  }

  Future<Color?> getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor?.color;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (isLoading) {
      // Check loading state
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(
              color: Colors.black), // Show loading indicator
        ),
      );
    }

    return Scaffold(
      backgroundColor: music.songColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SadsongScreen()),
                        (route) => false, // Remove all previous routes
                      );
                    },
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Singing Now',
                        style:
                            textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: music.artistImage != null
                                ? NetworkImage(music.artistImage!)
                                : null,
                            radius: 10,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            music.artistName ?? '-',
                            style: textTheme.bodyLarge
                                ?.copyWith(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                  const Icon(Icons.close, color: Colors.transparent),
                ],
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: ArtWorkImage(image: music.songImage),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                music.songName ?? '',
                                style: textTheme.titleLarge
                                    ?.copyWith(color: Colors.white),
                                maxLines: 2, // Limit to 2 lines
                                overflow: TextOverflow
                                    .ellipsis, // Add ellipsis if the song name is too long
                              ),
                              Text(
                                music.artistName ?? '-',
                                style: textTheme.titleMedium
                                    ?.copyWith(color: Colors.white60),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    StreamBuilder<Duration>(
                      stream: player.onPositionChanged,
                      builder: (context, data) {
                        return ProgressBar(
                          progress: data.data ?? const Duration(seconds: 0),
                          total: music.duration ?? const Duration(minutes: 4),
                          bufferedBarColor: Colors.white38,
                          baseBarColor: Colors.white10,
                          thumbColor: Colors.white,
                          timeLabelTextStyle:
                              const TextStyle(color: Colors.white),
                          progressBarColor: Colors.white,
                          onSeek: (duration) {
                            player.seek(duration);
                          },
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center buttons
                      children: [
                        IconButton(
                          onPressed: () async {
                            await player.stop();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NoMatterWhatMusic(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (player.state == PlayerState.playing) {
                              await player.pause();
                            } else {
                              await player.resume();
                            }
                            setState(() {});
                          },
                          icon: Icon(
                            player.state == PlayerState.playing
                                ? Icons.pause
                                : Icons.play_circle,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await player.stop(); 

                            Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => const BrotherZoneMusic(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.skip_next,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
