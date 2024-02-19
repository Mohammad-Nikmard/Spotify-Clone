import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/bloc/artist/artist_event.dart';
import 'package:spotify_clone/bloc/artist/artist_state.dart';
import 'package:spotify_clone/data/repository/artist_repository.dart';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  final ArtistRepository _artistRepository;
  ArtistBloc(this._artistRepository) : super(ArtistInitState()) {
    on<ArtistListEvent>((event, emit) async {
      var artitstList = await _artistRepository.artistList();
      emit(ArtistListState(artitstList));
    });
  }
}
