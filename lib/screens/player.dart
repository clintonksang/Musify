/*
 * File: player.dart
 * Project: Flutter music player
 * Created Date: Wednesday February 17th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musify/models/AudioMetadata.dart';
import 'package:musify/models/playlist_item.dart';
import 'package:musify/services/playlistservice.dart';
import 'package:provider/provider.dart';

import 'commons/player_buttons.dart';
import 'commons/playlist.dart';



class Player extends StatelessWidget {
  final AudioPlayer _audioPlayer;
  final List<PlaylistItem> _playlist;

  Player(this._audioPlayer, this._playlist, {Key? key}) : super(key: key) {
    if (!_audioPlayer.playing) _loadAudioSources(_playlist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(child: Playlist(_audioPlayer)),
              PlayerButtons(_audioPlayer),
            ],
          ),
        ),
      ),
    );
  }

  // TODO we should keep track of what we are playing
  void _loadAudioSources(List<PlaylistItem> playlist) {
    _audioPlayer
        .setAudioSource(
      ConcatenatingAudioSource(
        children: playlist
            .map(
              (item) => AudioSource.uri(
                item.itemLocation,
                tag: AudioMetadata(
                    title: item.title, artwork: item.artworkUri.toString()),
              ),
            )
            .toList(),
      ),
    )
        .catchError((error) {
      // catch load errors: 404, invalid url ...
      print("An error occured $error");
    });
  }
}
