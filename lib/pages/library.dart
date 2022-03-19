import 'package:beathouse/model/song.dart';
import 'package:beathouse/pages/add_song.dart';
import 'package:beathouse/providers/page_provider.dart';
import 'package:beathouse/services/song_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SongService().list(),
        builder: (builderContext, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Song> songs = (snapshot.data as List<Song>);
            //TODO: change to ExpansionPanel
            return ListView.separated(
              itemBuilder: (listContext, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(songs[index].name.toString()),
                    Row(
                      children: [
                        Text(songs[index].rate.toString()),
                        ElevatedButton(
                          onPressed: () {
                            goToAddEditSong(listContext, songs[index]);
                            //TODO: refetch data
                          },
                          child: const Icon(Icons.edit),
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder()),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            playSong(context, songs[index]);
                          },
                          child: const Icon(Icons.play_arrow),
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder()),
                        )
                      ],
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: songs.length,
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          goToAddEditSong(context, null);
        },
      ),
    );
  }

  Future<dynamic> goToAddEditSong(BuildContext context, Song? song) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddSong(song: song)));
  }

  void playSong(BuildContext context, Song song) {
    context.read<PageProvider>().toPlayer(context, song);
  }
}
