import 'package:flutter/material.dart';
import 'package:musify/screens/category_selector.dart';
import 'package:musify/screens/player.dart';
import 'package:musify/services/audio_player_service.dart';
import 'package:musify/services/just_audio.dart';
import 'package:musify/services/playlistdataservice.dart';
import 'package:musify/services/playlistservice.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PlayListServices>(
          create: (_) => HardcodedPlaylistsService(),
        ),
        Provider<AudioPlayerService>(
          create: (_) => JustAudioPlayer(),
          dispose: (_, value) {
            (value as JustAudioPlayer).dispose();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CategorySelector(),
      ),
    );
  }
}
