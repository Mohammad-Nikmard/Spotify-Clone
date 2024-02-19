import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/datasource/artist_datasource.dart';
import 'package:spotify_clone/data/repository/artist_repository.dart';

var locator = GetIt.instance;

void initServiceLocator() {
  locator.registerSingleton<ArtistDatasource>(ArtistLocalDatasource());

  locator.registerSingleton<ArtistRepository>(ArtistLocalRepository());
}
