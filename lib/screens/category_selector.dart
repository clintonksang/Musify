import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musify/screens/player.dart';
import 'package:provider/provider.dart';
import 'package:musify/services/playlistservice.dart';
import 'commons/player_buttons.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SafeArea(
          child: Consumer<PlayListServices>(
            builder: (__, value, _) {
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text("All items"),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    Player(_audioPlayer, value.allItems),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<bool>(
                      stream: _audioPlayer.playingStream,
                      builder: (context, snapshot) {
                        // If we are not playing, do not show the player buttons
                        if (snapshot.hasData && (snapshot.data ?? false))
                          return PlayerButtons(_audioPlayer);
                        else
                          return Container();
                      }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}