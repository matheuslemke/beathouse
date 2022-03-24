import 'package:beathouse/model/song.dart';
import 'package:beathouse/pages/add_song.dart';
import 'package:beathouse/providers/page_provider.dart';
import 'package:beathouse/providers/song_list_provider.dart';
import 'package:beathouse/services/song_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SongListProvider songListProvider = context.read<SongListProvider>();
    return Scaffold(
      body: FutureBuilder(
        future: context.watch<SongListProvider>().songs,
        builder: (builderContext, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return const Text('No results found.');
            }
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
                          onPressed: () async {
                            await goToAddEditSong(listContext, songs[index]);
                            songListProvider.refetch();
                          },
                          child: const Icon(Icons.edit),
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder()),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            removeSong(songs[index]);
                            songListProvider.refetch();
                          },
                          child: const Icon(Icons.delete),
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
        onPressed: () async {
          await goToAddEditSong(context, null);
          songListProvider.refetch();
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

  void removeSong(Song song) {
    SongService().remove(song);
  }
}
