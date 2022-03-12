import 'package:beathouse/model/folder.dart';
import 'package:beathouse/model/song.dart';
import 'package:beathouse/services/song_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class AddingSongProvider extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();

  void saveSong() async {
    String name = _nameController.text.toString();
    int rate = int.parse(_rateController.text.toString());
    Song song = Song(const Uuid().v4(), name, rate, 'artist', Folder('folder'));
    SongService().save(song);
  }

  get nameController => _nameController;

  get rateController => _rateController;
}
