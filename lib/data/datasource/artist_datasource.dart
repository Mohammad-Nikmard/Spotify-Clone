import 'package:spotify_clone/data/model/artist.dart';

abstract class ArtistDatasource {
  Future<List<Artist>> getArtistList();
}

class ArtistLocalDatasource extends ArtistDatasource {
  @override
  Future<List<Artist>> getArtistList() async {
    return [
      Artist(
        "21-Savage.jpg",
        "21 Savage",
      ),
      Artist(
        "Adele.jpg",
        "Adele",
      ),
      Artist(
        "Cardi-B.jpg",
        "Cardi B",
      ),
      Artist(
        "DaBaby.jpg",
        "DaBaby",
      ),
      Artist(
        "Doja-Cat.jpg",
        "Doja Cat",
      ),
      Artist(
        "Drake.jpg",
        "Drake",
      ),
      Artist(
        "Eminem.jpg",
        "Eminem",
      ),
      Artist(
        "Future.jpg",
        "Future",
      ),
      Artist(
        "J-Cole.jpg",
        "J Cole",
      ),
      Artist(
        "Ice-Cube.jpg",
        "Ice Cube",
      ),
      Artist(
        "JAY-Z.jpg",
        "Jay z",
      ),
      Artist(
        "JID.jpg",
        "JID",
      ),
      Artist(
        "Kanye-West.jpg",
        "Kanye West",
      ),
      Artist(
        "Kendrick-Lamar.jpg",
        "Kenderick Lamar",
      ),
      Artist(
        "Lil Baby.jpg",
        "Lil Baby",
      ),
      Artist(
        "Lil-Wayne.jpg",
        "Lil Wayne",
      ),
      Artist(
        "Megan-Thee-Stallion.jpg",
        "Megan Thee Stallion",
      ),
      Artist(
        "Metro-Boomin.jpg",
        "Metro Boomin",
      ),
      Artist(
        "Nicki-Minaj.jpg",
        "Nicki Minaj",
      ),
      Artist(
        "Post-Malone.jpg",
        "Post Malone",
      ),
      Artist(
        "Selena-Gomez.jpg",
        "Selena Gomez",
      ),
      Artist(
        "Snoop Dogg.jpg",
        "Snoop Dogg",
      ),
      Artist(
        "Taylor-Swift.jpg",
        "Taylor Swift",
      ),
      Artist(
        "Travis-Scott.jpg",
        "Travis Scott",
      ),
      Artist(
        "Tyler-The-Creator.jpg",
        "Tyler The Creator",
      ),
    ];
  }
}
