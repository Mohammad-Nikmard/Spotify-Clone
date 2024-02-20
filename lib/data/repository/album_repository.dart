import 'package:spotify_clone/DI/service_locator.dart';
import 'package:spotify_clone/data/datasource/album_datasource.dart';
import 'package:spotify_clone/data/model/album.dart';

abstract class AlbumRepository {
  Future<Album> albumList(String singer);
}

class AlbumLocalRepository extends AlbumRepository {
  final AlbumDatasource _albumLocalDatasource = locator.get();
  @override
  Future<Album> albumList(String singer) async {
    return await _albumLocalDatasource.albumList(singer);
  }
}
