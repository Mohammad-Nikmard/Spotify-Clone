import 'package:spotify_clone/data/model/artist.dart';

abstract class ArtistState {}

class ArtistInitState extends ArtistState {}

class ArtistListState extends ArtistState {
  List<Artist> artistList;

  ArtistListState(this.artistList);
}
