import 'package:spotify_clone/data/model/playlist.dart';
import 'package:spotify_clone/data/model/playlist_track.dart';

abstract class PlaylistDatasource {
  Future<Playlist> trackList(String mix);
}

class PLaylistLocalDatasource extends PlaylistDatasource {
  @override
  Future<Playlist> trackList(String mix) async {
    if (mix == "Drake mix") {
      return Playlist(
        "55 min",
        [
          PLaylistTrack("drake mix/One-Dance.jpg", "Drake ", "One Dance"),
          PLaylistTrack(
              "drake mix/Money-Trees.jpg", "Kendrick Lamar", "Money Trees"),
          PLaylistTrack("drake mix/God's-Plan.jpg", "Drake ", "God's Plan"),
          PLaylistTrack("drake mix/Low-Life-(feat. The Weeknd).jpg",
              "Future, The Weekend", "Low Life (feat. The Weeknd)"),
          PLaylistTrack("drake mix/WAIT-FOR-U-(feat. Drake).jpg",
              "Future, Drake, Tmes", "WAIT FOR U (feat. Drake & Tems)"),
          PLaylistTrack("drake mix/Break-from-Toronto.jpg", "PARTYNEXTDOOR ",
              "Break from Toronto"),
          PLaylistTrack(
              "drake mix/In-My-Feelings.jpg", "Drake ", "In My Feelings"),
          PLaylistTrack(
              "drake mix/Ric-Flair-Drip-(with Metro Boomin).jpg",
              "drake mix/Offset, Metro Boomin",
              "Ric Flair Drip (with Metro Boomin)"),
          PLaylistTrack(
              "drake mix/Nice-For-What.jpg", "Drake ", "Nice For What"),
          PLaylistTrack(
              "drake mix/Lovin-On-Me.jpg", "Jack Harlow", "Lovin On Me"),
          PLaylistTrack(
              "drake mix/Best-I-Ever-Had.jpg", "Drake ", "Best I Ever Had"),
          PLaylistTrack("drake mix/redrum.jpg", "21 Savage", "redrum"),
          PLaylistTrack("drake mix/Trophies.jpg", "Young Money", "Trophies"),
          PLaylistTrack(
              "drake mix/Surround-Sound-(feat. 21 Savage).jpg",
              "JID, 21 Savage, Baby Tate",
              "Surround Sound (feat. 21 Savage & Baby Tate)"),
          PLaylistTrack("drake mix/IDGAF-(feat. Yeat).jpg", "Drake, Yeat",
              "IDGAF (feat. Yeat)"),
        ],
      );
    } else if (mix == "Upbeat") {
      return Playlist(
        "35 min",
        [
          PLaylistTrack("upbeat/Calm-Down-(with Selena Gomez).jpg",
              "Rema, Selena Gomez ", "Calm Down (with Selena Gomez)"),
          PLaylistTrack("upbeat/Feather.jpg", "Sabrina Carpenter", "Feather"),
          PLaylistTrack(
              "upbeat/I'm-Good-(Blue).jpg", "David Guetta", "I'm Good (Blue)"),
          PLaylistTrack("upbeat/Uptown-Funk-(feat. Bruno Mars).jpg",
              "Mark Ronson, Bruno Mars", "Uptown Funk (feat. Bruno Mars)"),
          PLaylistTrack(
              "upbeat/High-Hopes.jpg", "Panic! At The Disco", "High Hopes"),
          PLaylistTrack(
              "upbeat/Cake-By-The-Ocean.jpg", "DNCE", "Cake By The Ocean"),
          PLaylistTrack("upbeat/Better-When-I'm-Dancin'.jpg", "Meghan Trainor",
              "Better When I'm Dancin'"),
          PLaylistTrack("upbeat/What-You-Know.jpg", "Two Door Cinema Club",
              "What You Know"),
          PLaylistTrack("upbeat/Walking-On-Sunshine.jpg", "Katrina & The Waves",
              "Walking On Sunshine"),
          PLaylistTrack("upbeat/Shut-Up-and-Dance.jpg", "WALK THE MOON",
              "Shut Up and Dance"),
          PLaylistTrack("upbeat/Feliz,-Alegre-e-Forte.jpg", "Marisa Monte",
              "Feliz, Alegre e Forte"),
          PLaylistTrack(
              "upbeat/Lil-Boo-Thang.jpg", "Paul Russell", "Lil Boo Thang"),
          PLaylistTrack("upbeat/Classic.jpg", "MKTO ", "Classic"),
          PLaylistTrack("upbeat/Me-Levanté.jpg", "Dave Bolaño", "Me Levanté"),
          PLaylistTrack(
              "upbeat/Feel-It-Still.jpg", "Portugal. The Man", "Feel It Still"),
        ],
      );
    } else if (mix == "Chill") {
      return Playlist(
        "45 min",
        [
          PLaylistTrack(
              "chill/Shut-up.jpg", "Hotel Ugly ", "Shut up My Moms Calling"),
          PLaylistTrack("chill/Stick-Season.jpg", "Noah Kahan", "Stick Season"),
          PLaylistTrack("chill/Dark-Red.jpg", "Steve Lacy", "Dark Red"),
          PLaylistTrack(
              "chill/Sunset-Lover.jpg", "Petit Biscuit", "Sunset Lover"),
          PLaylistTrack("chill/Hex.jpg", "80purppp", "Hex"),
          PLaylistTrack(
              "chill/Japanese-Denim.jpg", "Daniel Caesar", "Japanese Denim"),
          PLaylistTrack(
              "chill/Yebba’s-Heartbreak.jpg", "Drake ", "Yebba’s Heartbreak"),
          PLaylistTrack("chill/Location.jpg", "Khalid ", "Location"),
          PLaylistTrack("chill/Ivy.jpg", "Frank Ocean", "Ivy"),
          PLaylistTrack("chill/act-ii_date.jpg", "4batz ", "act ii: date @ 8"),
          PLaylistTrack("chill/Get-You-(feat. Kali Uchis).jpg", "Daniel Caesar",
              "chill/Get You (feat. Kali Uchis)"),
          PLaylistTrack("chill/comethru.jpg", "Jeremy Zucker", "comethru"),
          PLaylistTrack("chill/Come-Back-to-Earth.jpg", "Mac Miller",
              "Come Back to Earth"),
          PLaylistTrack("chill/Some.jpg", "Steve Lacy", "Some"),
        ],
      );
    } else if (mix == "2010") {
      return Playlist(
        "1h 2min",
        [
          PLaylistTrack("2010/I-Love-You-So.jpg", "The Walters", "Love You So"),
          PLaylistTrack("2010/See-You-Again-(feat. Kali Uchis).jpg",
              "Tyler, The Creator", "See You Again (feat. Kali Uchis)"),
          PLaylistTrack(
              "2010/Sunflower - Spider-Man_ Into-the-Spider-Verse.jpg",
              "Post Malone",
              "Sunflower - Spider-Man: Into the Spider-Verse"),
          PLaylistTrack(
              "2010/Cruel-Summer.jpg", "Taylor Swift", "Cruel Summer"),
          PLaylistTrack(
              "2010/The-Night-We-Met.jpg", "Lord Huron", "The Night We Met"),
          PLaylistTrack("2010/Starboy.jpg", "The Weeknd", "Starboy"),
          PLaylistTrack("2010/No-Role-Modelz.jpg", "J. Cole", "No Role Modelz"),
          PLaylistTrack("2010/One-Dance.jpg", "Drake", "One Dance"),
          PLaylistTrack("2010/Pink-White.jpg", "Frank Ocean", "Pink + White"),
          PLaylistTrack("2010/Lover.jpg", "Taylor Swift", "Lover"),
          PLaylistTrack("2010/Perfect.jpg", "Ed Sheeran", "Perfect"),
          PLaylistTrack("2010/Dandelions.jpg", "Ruth B.", "Dandelions"),
          PLaylistTrack("2010/Dark-Red.jpg", "Steve Lacy", "Dark Red"),
          PLaylistTrack("2010/Not-Allowed.jpg", "TV Girl", "Not Allowed"),
          PLaylistTrack("2010/Evergreen.jpg", "Richy Mitch & The Coal Miners",
              "Evergreen"),
        ],
      );
    } else {
      return Playlist(
        "NULL",
        [],
      );
    }
  }
}
