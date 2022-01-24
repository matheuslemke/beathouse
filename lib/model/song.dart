import 'package:beathouse/model/folder.dart';

class Song {
  final String id;
  final String name;
  final int rate;
  final String artist;
  final Folder folder;

  Song(this.id, this.name, this.rate, this.artist, this.folder);

  /// TODO: make to map be dynamic
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'rate': rate,
      'artist': artist,
      'folder': folder.toMap(),
    };
  }
}