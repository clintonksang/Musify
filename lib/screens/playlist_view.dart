import 'package:flutter/material.dart';
import 'package:musify/models/playlist_item.dart';
import 'package:musify/services/audio_player_service.dart';
import 'package:provider/provider.dart';
class PlaylistView extends StatelessWidget {
  final List<PlaylistItem> _playlist;

  PlaylistView(this._playlist, {Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i = 0; i < _playlist.length; i++)
          ListTile(
            // selected: i == state.currentIndex, // TODO only if this is the loaded playlist
            leading: Image.network(_playlist[i].artworkLocation),
            title: Text(_playlist[i].title),
            onTap: () {
              final player =
                  Provider.of<AudioPlayerService>(context, listen: false);

              player
                  .loadPlaylist(_playlist)
                  .then((_) => player.seekToIndex(i))
                  .then((_) => player.play());
            },
          ),
      ],
    );
  }
}    