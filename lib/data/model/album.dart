import 'package:spotify_clone/data/model/album_track.dart';

class Album {
  String albumName;
  String year;
  String singerName;
  String albumImage;
  List<AlbumTrack> trackList;

  Album(this.albumImage, this.albumName, this.singerName, this.trackList,
      this.year);
}
