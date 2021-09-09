// playlist.dart

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

/// A list of tiles showing all the audio sources added to the audio player.
///
/// Audio sources are displayed with a `ListTile` with a leading image (the
/// artwork), and the title of the audio source.
class Playlist extends StatelessWidget {
  const Playlist(this._audioPlayer, {Key? key}) : super(key: key);

  final AudioPlayer _audioPlayer;

  Widget build(BuildContext context) {
    return StreamBuilder<SequenceState?>( // this was changed
      stream: _audioPlayer.sequenceStateStream,
      builder: (context, snapshot) {
        final state = snapshot.data;
        if (state == null) return CircularProgressIndicator(); // this was added
        final sequence = state.sequence; // this was changed
        return ListView(
          children: [
          for (var i = 0; i < sequence.length; i++)


            ListTile(
              selected: i == state.currentIndex,
              leading: Image.network(sequence[i].tag.artwork),
              title: Text(sequence[i].tag.title),
              onTap: () {
                _audioPlayer.seek(Duration.zero, index: i);
                
              },
            ),
        ],
        
        );
  });
  }
}