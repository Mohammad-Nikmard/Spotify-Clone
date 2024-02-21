import 'dart:ui';

import 'package:spotify_clone/data/model/album.dart';
import 'package:spotify_clone/data/model/album_track.dart';

abstract class AlbumDatasource {
  Future<Album> albumList(String singer);
}

class AlbumLocalDatasource extends AlbumDatasource {
  @override
  Future<Album> albumList(String singer) async {
    if (singer == "Drake") {
      return Album(
        'For-All-The-Dogs.jpg',
        "For All The Dogs",
        "Drake",
        [
          AlbumTrack("Virginia Beach", "Drake"),
          AlbumTrack("Amen(feat. Teezo Touchdown)", "Drake, Teezo Touchdown"),
          AlbumTrack("Calling For You", "Drake, 21 Savage"),
          AlbumTrack("Fear Of Heights", "Drake"),
          AlbumTrack("Daylight", "Drake"),
          AlbumTrack("First Person Shooter(feat. J.Cole)", "Drake, J.Cole"),
          AlbumTrack("IDGAF", "Drake, Yeat"),
          AlbumTrack("7969 Santa", "Drake"),
          AlbumTrack("Slime You Out(feat. SZA)", "Drake, SZA"),
          AlbumTrack("Bahamas Promises", "Drake"),
          AlbumTrack("Tired Our Best", "Drake"),
          AlbumTrack("Screw The World - Interlude", "Drake"),
          AlbumTrack("Drew A Picasso", "Drake"),
          AlbumTrack(
              "Members Only(feat. PARTYNESTDOOR)", "Drake, PARTYNEXTDOOR"),
          AlbumTrack("What Would Pluto Do", "Drake"),
          AlbumTrack("All The Parties(feat. Chief Keef)", "Drake, Chief Keef"),
          AlbumTrack("8am in Charlotte", "Drake"),
          AlbumTrack("BBL Love", "Drake"),
          AlbumTrack("Gently(feat. Bad Bunny)", "Drake, Bad Bunny"),
          AlbumTrack(
              "Rich Baby Daddy(feat. Sexy Red & SZA)", "Drake, Sexy Red, SZA"),
          AlbumTrack(
              "Another Late Night(feat. Lil Youghty)", "Drake, Lil Youghty"),
          AlbumTrack("Away From Home", "Drake"),
          AlbumTrack("Polar Opposites", "Drake"),
        ],
        "2023",
        "Drake.jpg",
        [
          const Color(0xff7c837b),
          const Color(0xff313330),
          const Color(0xff151515)
        ],
      );
    } else if (singer == "Travis Scott") {
      return Album(
        'UTOPIA.jpg',
        "UTOPIA",
        "Travis Scott",
        [
          AlbumTrack("HYENA", "Travis Scott"),
          AlbumTrack("THANK GOD", "Travis Scott"),
          AlbumTrack('MODERN JAM', "Travis Scott"),
          AlbumTrack('MY EYES', "Travis Scott"),
          AlbumTrack("GOD'S COUNTRY", "Travis Scott"),
          AlbumTrack('SIRENS', "Travis Scott"),
          AlbumTrack("MELTDOWN (feat. Drake)", "Travis Scott, Drake"),
          AlbumTrack(
              'FE!N (feat. Playboi Carti)', "Travis Scott, Playboi Cart"),
          AlbumTrack(
              'DELESTO (ECHOES) (feat Beyonce)', "Travis Scott, Beyonce"),
          AlbumTrack("I KNOW ?", "Travis Scott"),
          AlbumTrack('TOPIA TWINS (feat. Rob49 & 21 Savage)',
              "Travis Scott, Rob 49, 21 Savage"),
          AlbumTrack('CIRCUS MAXIMUS (feat. The Weekend & Swea Lee)',
              "Travis Scott, The Weekend, Swea Lee"),
          AlbumTrack("PARASAIL (feat. Young Lean, Dave Chappelle)",
              "Young Lean, Dave Chappelle"),
          AlbumTrack("SKITZO (feat. Young Thug)", "Travis Scott, Young Thug"),
          AlbumTrack("LOST FOREVER (feat. Westside Gunn)",
              "Travis Scott, Westside Gunn"),
          AlbumTrack('LOOVE (feat. Kid Cudi)', "Travis Scott, Kid Cudi"),
          AlbumTrack("K-POP (feat. Bad Bunny & The Weekend)",
              "Travis Scott, Bad Bunny, The Weekend"),
          AlbumTrack(
              "TELEKIESIS (feat. SZA & Future)", "Travis Scott, SZA, Future"),
          AlbumTrack('TIL FUTURE NOTICE (feat. James Blake & 21 Savage)',
              "Travis Scott, James Blake, 21 Savage"),
        ],
        "2023",
        "Travis-Scott.jpg",
        [
          const Color(0xff544444),
          const Color(0xff252120),
          const Color(0xff131313)
        ],
      );
    } else if (singer == "Post Malone") {
      return Album(
        'AUSTIN.jpg',
        "AUSTIN",
        "Post Malone",
        [
          AlbumTrack("Don't Understand", "Post Malone"),
          AlbumTrack("Something Real", "Post Malone"),
          AlbumTrack("Chemical", "Post Malone"),
          AlbumTrack("Novacandy", "Post Malone"),
          AlbumTrack("Mourning", "Post Malone"),
          AlbumTrack("Too Cool To Die", "Post Malone"),
          AlbumTrack("Sign Me Up", "Post Malone"),
          AlbumTrack("Socialite", "Post Malone"),
          AlbumTrack("Overdrive", "Post Malone"),
          AlbumTrack("Speedometer", "Post Malone"),
          AlbumTrack("Hold My Breath", "Post Malone"),
          AlbumTrack("Enough Is Enough", "Post Malone"),
          AlbumTrack("Texas Tea", "Post Malone"),
          AlbumTrack("Buyer Beware", "Post Malone"),
          AlbumTrack("Landmine", "Post Malone"),
          AlbumTrack("Green Thumb", "Post Malone"),
          AlbumTrack("Laught It Off", "Post Malone"),
        ],
        "2023",
        "Post-Malone.jpg",
        [
          const Color(0xff8b9a63),
          const Color(0xff363a2b),
          const Color(0xff151513)
        ],
      );
    } else if (singer == "21 Savage") {
      return Album(
        'american-dream.jpg',
        "american dream",
        "21 Savage",
        [
          AlbumTrack("american dream", "21 Savage"),
          AlbumTrack("all of me", "21 Savage"),
          AlbumTrack("redrum", "21 Savage"),
          AlbumTrack("n.h.i.e", "21 Savage, Doja Cat"),
          AlbumTrack("sneaky", "21 Savage"),
          AlbumTrack("pop ur shit", "21 Savage, Young Thug, Metro Boomin"),
          AlbumTrack("letter to my brudda", "21 Savage"),
          AlbumTrack("dangerous", "21 Savage, Lil Durk, Metro Boomin"),
          AlbumTrack("nee-nah", "21 Savage, Travis Scott, Metro Bommin"),
          AlbumTrack("see the real", "21 Savage"),
          AlbumTrack("prove it", "21 Savage, Summer Walker"),
          AlbumTrack("sould've wore a bonnet", "21 Savage, Brent Fiyaz"),
          AlbumTrack("just like me", "21 Savage, Burna Boy, Metro Boomin"),
          AlbumTrack("red sky", "21 Savage, Tommy Newport, Milkky Ekko"),
          AlbumTrack("dark days", "21 Savage, Mariah the Scientist"),
        ],
        "2023",
        "21-Savage.jpg",
        [
          const Color(0xff747474),
          const Color(0xff343434),
          const Color(0xff121212)
        ],
      );
    } else {
      return Album("", "", "", [], "", "", []);
    }
  }
}
