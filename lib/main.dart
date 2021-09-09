import 'package:flutter/material.dart';
import 'package:musify/screens/player.dart';
import 'package:musify/services/playlistdataservice.dart';
import 'package:musify/services/playlistservice.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musify',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Provider<PlayListServices>(
          create: (_) {
            return HardcodedPlaylistsService();
          },
          child: Player()),
    );
  }
}
