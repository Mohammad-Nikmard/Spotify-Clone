import 'package:spotify_clone/data/model/podcast.dart';

abstract class PodcastDatasource {
  Future<List<Podcast>> getPodcastList();
}

class PodcastLocalDatasource extends PodcastDatasource {
  @override
  Future<List<Podcast>> getPodcastList() async {
    return [
      Podcast(
        "The-Joe-Rogan-Experience.jpg",
        "The Joe Rogan Experience",
      ),
      Podcast(
        "The-Iced-coffe-hour.jpg",
        "The Iced Coffe Hour",
      ),
      Podcast(
        "Startalk.jpg",
        "StarTalk Radio",
      ),
      Podcast(
        "shxts-ngigs.jpg",
        "ShxtsNGigs",
      ),
      Podcast(
        "podcast-p.jpg",
        "Podcast P",
      ),
      Podcast(
        "NFR-Podcast.jpg",
        "NFR Podcast",
      ),
      Podcast(
        "Modern-Wisdom.jpg",
        "Modern Wisdom",
      ),
      Podcast(
        "Huberman-Lab.jpg",
        "Huberman Lab",
      ),
      Podcast(
        "Fresh&Fit.jpg",
        "Fresh&Fit Podcast",
      ),
      Podcast(
        "Distractible.jpg",
        "Distractible",
      ),
      Podcast(
        "JordanB.Peterson-Podcast.jpg",
        "The Jordan B. Peterson Podcast",
      ),
      Podcast(
        "American-English.jpg",
        "American English Podcast",
      ),
      Podcast(
        "Comedy-is-joke.jpg",
        "COMEDY IS JOKE",
      ),
      Podcast(
        "Bad-Friends.jpg",
        "Bad Friends Podcast",
      ),
      Podcast(
        "HotBoxIn.jpg",
        "Hotboxin",
      ),
    ];
  }
}
