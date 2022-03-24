import 'package:beathouse/model/song.dart';
import 'package:beathouse/services/song_service.dart';
import 'package:flutter/material.dart';

class SongListProvider extends ChangeNotifier {
  late Future<List<Song>> songs = SongService().list();

  refetch() {
    songs = SongService().list();
    notifyListeners();
  }
}
