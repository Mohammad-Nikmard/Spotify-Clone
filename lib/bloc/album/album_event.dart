abstract class AlbumEvent {}

class AlbumListEvent extends AlbumEvent {
  String singer;

  AlbumListEvent(this.singer);
}
