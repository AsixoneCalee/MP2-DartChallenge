
// Class to represent a song with a title, artist, and duration
class Song {
  String title;
  String artist;
  int duration; // Duration in seconds

  Song(this.title, this.artist, this.duration);

  // Convert duration from seconds to MM:SS format
  String get formattedDuration {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  String toString() {
    return '$title by $artist (${formattedDuration})';
  }
}

// Class to represent a playlist containing multiple songs
class Playlist {
  String name;
  List<Song> songs = [];

  Playlist(this.name);

  // Add a song to the playlist
  void addSong(Song song) {
    songs.add(song);
  }

  // Remove a song from the playlist
  void removeSong(Song song) {
    songs.remove(song);
  }

  // List all songs in the playlist
  void listSongs() {
    print('Playlist: $name');
    for (var song in songs) {
      print(song);
    }
  }

  // Sort songs by artist and list them
  void listSongsSortedByArtist() {
    songs.sort((a, b) => a.artist.compareTo(b.artist));
    listSongs();
  }

  // Calculate total duration of all songs in the playlist
  int get totalDuration {
    return songs.fold(0, (total, song) => total + song.duration);
  }
}

// Class to represent a music festival with multiple playlists (stages)
class MusicFestival {
  String name;
  List<Playlist> playlists = [];

  MusicFestival(this.name);

  // Add a playlist to the festival
  void addPlaylist(Playlist playlist) {
    playlists.add(playlist);
  }

  // Remove a playlist from the festival
  void removePlaylist(Playlist playlist) {
    playlists.remove(playlist);
  }

  // List all playlists and their songs in the festival
  void listPlaylists() {
    print('Music Festival: $name');
    for (var playlist in playlists) {
      playlist.listSongs();
      print(''); // Add a blank line for separation
    }
  }

  // Calculate the total duration of all songs in all playlists
  int get totalDuration {
    return playlists.fold(0, (total, playlist) => total + playlist.totalDuration);
  }

  // Convert total duration to seconds and minutes
  String get formattedTotalDuration {
    final totalSeconds = totalDuration;
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // List random songs (for demonstration)
  void listRandomSongs() {
    print('RANDOM SONGS:');

    var randomSongs = [
      Song('Double Take', 'Dhruv', 220), // 3:40
      Song('My Favourite Clothes', 'Rini', 210), // 3:30 
      Song('Its You', 'Sezairi', 230) // 3:50
    ];

    var randomStages = [
      'Main Stage',
      'Indie Stage',
      'Electronic Stage'
    ];

    for (int i = 0; i < randomSongs.length; i++) {
      print('${randomStages[i]}: ${randomSongs[i]}');
    }
  }
}

void main() {
  // Create songs with correct durations
  var song1 = Song('BMD', 'Cueshe', 213); // 3:33
  var song2 = Song('Wonderful Tonight', 'Eric Clapton', 288); // 4:48
  var song3 = Song('Fly Me to the Moon', 'Frank Sinatra', 185); // 3:05
  var song4 = Song('The Reason', 'Hoobastank', 305); // 5:05
  var song5 = Song('Rainbow', 'South Border', 224); // 3:44

  // Create playlists (stages) for the festival
  var playlist1 = Playlist('Main Stage');
  var playlist2 = Playlist('Indie Stage');
  var playlist3 = Playlist('Electronic Stage');

  // Add songs to Main Stage playlist
  playlist1.addSong(song1);
  playlist1.addSong(song2);
  playlist1.addSong(song3);
  playlist1.addSong(song4);
  playlist1.addSong(song5);

  // Add songs to Indie Stage playlist (only the first 3 songs for variety)
  playlist2.addSong(song1);
  playlist2.addSong(song2);
  playlist2.addSong(song3);

  // Add songs to Electronic Stage playlist (the rest of the songs)
  playlist3.addSong(song4);
  playlist3.addSong(song5);

  // Create a music festival and add playlists to it
  var festival = MusicFestival('Summer Music Festival');
  print('                                               SUMMER MUSIC FESTIVAL\n');
  festival.addPlaylist(playlist1);
  festival.addPlaylist(playlist2);
  festival.addPlaylist(playlist3);

  // Print total festival duration in seconds
  print('TOTAL FESTIVAL DURATION: ${festival.totalDuration} seconds\n');

  // List random songs
  festival.listRandomSongs();
  print('');

  // List Main Stage playlist sorted by artist
  print('MAIN STAGE PLAYLIST SORTED BY ARTIST:');
  playlist1.listSongsSortedByArtist();
}
