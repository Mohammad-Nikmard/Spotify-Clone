import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/bloc/album/album_event.dart';
import 'package:spotify_clone/bloc/album/album_state.dart';
import 'package:spotify_clone/data/repository/album_repository.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository _albumRepository;
  AlbumBloc(this._albumRepository) : super(AlbumInitState()) {
    on<AlbumListEvent>(
      (event, emit) async {
        var album = await _albumRepository.albumList(event.singer);
        emit(AlbumListResponseState(album));
      },
    );
  }
}
