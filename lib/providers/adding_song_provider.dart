import 'package:beathouse/model/folder.dart';
import 'package:beathouse/model/song.dart';
import 'package:beathouse/services/song_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class AddingSongProvider extends ChangeNotifier {
  final Song? song;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();

  AddingSongProvider(this.song) {
    if (song != null) {
      _nameController.text = song!.name;
      _rateController.text = song!.rate.toString();
    }
  }

  void saveSong() async {
    String id = song != null ? song!.id : const Uuid().v4();
    String name = _nameController.text.toString();
    int rate = int.parse(_rateController.text.toString());
    Song newSong = Song(id, name, rate, 'artist', Folder('folder'));
    SongService().save(newSong);
  }

  get nameController => _nameController;

  get rateController => _rateController;
}
