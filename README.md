# SpotifyClone 
![mockup](assets/mockup.png)


## Overview 
This is an enormous spotify application ui that has been written with dart. Supports `4 albums`, `4 playlists`, `An snippet of track screen with a dynamic video and animation to the lyrics section`,` with all the sign up section pages and choosing artists and podcasts` and Even an `scanner to scan spotify barcodes`. The local data has been implemented in a way that works with bloc state management to keep the project clean and maintainable.  

## Features 
 - **Main Activity** : The ui is just like Spotify application. Lists playlists, musics, albums and more.
 - **Song Detail** : One song has a detail with a video, singer, album name and lyrics.
 - **Album Detail** : 4 albums has been implemented in the application with bloc state management wich each of the songs and even the album could be routed to share screen with their own unique album name and singer.
 - **Playlist Detail** : 4 playlists has been implemented with a massive datasource working in the background with bloc and each contains 15 songs with singer and song name.
 - **Scanner** : As an additional feature an scanner has been handled and added to the ui to make the project even more near to reality.
 - **Other Features** : user can route to setting, library and profile screen.


## Project Structure 
The project follows bloc architecture for the separation of layers to keep everything clean:

 - BLoC : To handle the logic and send different states for the unique event being received.
 - Data : To handle 3 important layers when working with local data :
    - Model : which is the entity of the app.
    - DataSource : To keep a list of local data (works just like usecases).
    - Repositoy : To get data from datasource and handle whether an error occurred or the list has been taken (similar to adapter layer).
 - UI : Infrastructure layer that is aware of the bloc and can send certain events to it.


## Dependancies 
  - auto_size_text (for the dynamic text size)
  - animations (for switching smothly beetween pages)
  - flutter_barcode_scanner (for scanner)
  - video_player (to handle background video of track screen)


## Project Setup 
To run the application do the following :

 1. Clone the repository or download it.
 2. Open the project in Android Studio / VScode.
 3. Build and run the app on an Android emulator or physical device by your choice.
