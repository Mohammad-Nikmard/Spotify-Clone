import 'package:spotify_clone/data/model/playlist.dart';

abstract class PlaylistState {}

class PlaylistInitState extends PlaylistState {}

class PlaylistResponseState extends PlaylistState {
  Playlist playlist;

  PlaylistResponseState(this.playlist);
}
