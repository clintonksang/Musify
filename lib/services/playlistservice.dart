import 'package:musify/models/playlist_item.dart';
import 'package:musify/models/Author.dart';
abstract class  PlayListServices {
  List <PlaylistItem> get allItems;
  Map <Author, List<PlaylistItem>> get itemsByAuthor;
  
}