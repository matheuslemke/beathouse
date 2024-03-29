import 'package:beathouse/model/song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SongService {
  void save(Song song) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection('songs').doc(song.id).set(song.toMap());
  }

  void remove(Song song) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection('songs').doc(song.id).delete();
  }

  Future<List<Song>> list() async {
    List<Song> songs = [];
    FirebaseFirestore db = FirebaseFirestore.instance;

    List docs = (await db
            .collection('songs')
            .where('visibility', isEqualTo: 'public')
            .get())
        .docs;

    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in docs) {
      songs.add(Song.fromMap(doc.data()));
    }

    return songs;
  }
}
