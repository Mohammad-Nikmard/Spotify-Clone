import 'package:spotify_clone/DI/service_locator.dart';
import 'package:spotify_clone/data/datasource/artist_datasource.dart';
import 'package:spotify_clone/data/model/artist.dart';

abstract class ArtistRepository {
  Future<List<Artist>> artistList();
}

class ArtistLocalRepository extends ArtistRepository {
  final ArtistDatasource _datasource = locator.get();
  @override
  Future<List<Artist>> artistList() async {
    return await _datasource.getArtistList();
  }
}
