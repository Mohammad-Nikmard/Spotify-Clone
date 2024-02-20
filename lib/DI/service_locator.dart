import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/datasource/album_datasource.dart';
import 'package:spotify_clone/data/datasource/artist_datasource.dart';
import 'package:spotify_clone/data/datasource/podcast_datasource.dart';
import 'package:spotify_clone/data/repository/album_repository.dart';
import 'package:spotify_clone/data/repository/artist_repository.dart';
import 'package:spotify_clone/data/repository/podcast_repository.dart';

var locator = GetIt.instance;

void initServiceLocator() {
  locator.registerSingleton<ArtistDatasource>(ArtistLocalDatasource());
  locator.registerSingleton<PodcastDatasource>(PodcastLocalDatasource());
  locator.registerSingleton<AlbumDatasource>(AlbumLocalDatasource());

  locator.registerSingleton<ArtistRepository>(ArtistLocalRepository());
  locator.registerSingleton<PodcastRepository>(PodcastLocalRepository());
  locator.registerSingleton<AlbumRepository>(AlbumLocalRepository());
}
