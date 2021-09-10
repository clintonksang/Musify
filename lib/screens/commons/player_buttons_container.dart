
import 'package:flutter/material.dart';
import 'package:musify/models/playlist_item.dart';
import 'package:musify/screens/commons/player_buttons.dart';
import 'package:musify/services/audio_player_service.dart';
import 'package:provider/provider.dart';

class PlayerButtonsContainer extends StatelessWidget {
  final Widget child;

  PlayerButtonsContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        Consumer<AudioPlayerService>(
          builder: (context, player, _) {
            return StreamBuilder<bool>(
              stream: player.audioProcessingState
                  .map((state) => state != AudioProcessingState.idle),
              builder: (context, snapshot) {
                // If no audio is loaded, do not show the controllers.
                if (snapshot.data ?? false)
                  return PlayerButtons();
                else
                  return Container();
              },
            );
          },
        ),
      ],
    );
  }
}
