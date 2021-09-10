

import 'package:flutter/material.dart';
import 'package:musify/models/playlist_item.dart';
import 'package:musify/screens/playlist_view.dart';

import 'commons/player_buttons_container.dart';
import 'commons/playlist.dart';

class PlaylistScreen extends StatelessWidget {
  final List<PlaylistItem> _playlist;

  PlaylistScreen(this._playlist, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SafeArea(
          child: PlayerButtonsContainer(
            child: PlaylistView(_playlist),
          ),
        ),
      ),
    );
  }
}
