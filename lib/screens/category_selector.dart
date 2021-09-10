import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musify/screens/player.dart';
import 'package:musify/screens/playlist_screen.dart';
import 'package:provider/provider.dart';
import 'package:musify/services/playlistservice.dart';
import 'commons/player_buttons.dart';
import 'commons/player_buttons_container.dart';

class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SafeArea(
          child: PlayerButtonsContainer(
            child: Consumer<PlayListServices>(
              builder: (__, value, _) {
                return 
                Column(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          title: Text("All items"),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PlaylistScreen(value.allItems),
                              ),
                            );
                          },
                        ),
                      ]..addAll(
                          value.playlists.keys.map((playlistName) {
                            return ListTile(
                              title: Text(playlistName),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PlaylistScreen(
                                        value.playlists[playlistName]!),
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
