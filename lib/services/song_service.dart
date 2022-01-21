import 'package:beathouse/model/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SongService {
  save(Song song) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    db.collection('songs').doc(song.id).set(song.toMap());
  }
}
