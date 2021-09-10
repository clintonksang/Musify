// hardcoded_playlists_service.dart


import 'playlistservice.dart';
import 'package:musify/models/playlist_item.dart';
import 'package:musify/models/Author.dart';


class HardcodedPlaylistsService implements PlayListServices {
  final _gameSongs = [
    PlaylistItem(
        author: Author("Blizzard North", null),
        title: "Tristram",
        artworkLocation:
            "https://upload.wikimedia.org/wikipedia/en/3/3a/Diablo_Coverart.png",
        itemLocation: Uri.parse(
            "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3")),
    PlaylistItem(
        author: Author("Game Freak", null),
        title: "Cerulean City",
        artworkLocation:
            "https://upload.wikimedia.org/wikipedia/en/f/f1/Bulbasaur_pokemon_red.png",
        itemLocation: Uri.parse(
            "https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3")),
    PlaylistItem(
        author: Author("Lucasfilm Games", null),
        title: "The secret of Monkey Island - Introduction",
        artworkLocation:
            "https://upload.wikimedia.org/wikipedia/en/a/a8/The_Secret_of_Monkey_Island_artwork.jpg",
        itemLocation: Uri.parse(
            "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3")),
  ];

  final _inessential = [
    PlaylistItem(
        author: Author("Brent Simmons", null),
        title: "Slow House",
        itemLocation: Uri.parse("asset:///assets/audio/SlowHouse.mp3")),
    PlaylistItem(
        author: Author("Jhene Aiko", null),
        title: "Spotless Mind",
        itemLocation: Uri.parse("asset:///assets/audio/jhene_aiko_spotless_mind_mp3_24554.mp3")),
    PlaylistItem(
        author: Author("Jhene Aiko", null),
        title: "The Worst",
        itemLocation: Uri.parse("asset:///assets/audio/jhene_aiko_the_worst_explicit_mp3_24604.mp3")),
  ];

  @override
  // TODO: implement allItems
   List<PlaylistItem> get allItems {
    return []..addAll(_gameSongs)..addAll(_inessential);
  }

  @override
  Map<String, List<PlaylistItem>> get playlists {
    return {'Online': _gameSongs, "Pop Music": _inessential};
  }


  @override
  // TODO: implement playlists
  // TODO: implement itemsByAuthor
  Map<Author, List<PlaylistItem>> get itemsByAuthor =>
      throw UnimplementedError();

}