abstract class PlaylistEvent {}

class PlaylistFetchEvent extends PlaylistEvent {
  String mix;

  PlaylistFetchEvent(this.mix);
}
