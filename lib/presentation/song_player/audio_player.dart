import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class Song {
  final String title;
  final String artist;
  final String url;
  final String releaseDate;
  final Duration duration;
  final String coverUrl;  // Added coverUrl field

  Song({
    required this.title,
    required this.artist,
    required this.url,
    required this.releaseDate,
    required this.duration,
    required this.coverUrl,  // Added to constructor
  });

  factory Song.fromMap(Map<String, dynamic> map) {
    int durationInSeconds;
    if (map['duration'] is double) {
      durationInSeconds = (map['duration'] as double).round();
    } else if (map['duration'] is int) {
      durationInSeconds = map['duration'];
    } else {
      durationInSeconds = 0;
    }

    return Song(
      title: map['title'] ?? 'Unknown Title',
      artist: map['artist'] ?? 'Unknown Artist',
      url: map['url'] ?? '',
      releaseDate: map['releaseDate'] ?? '',
      duration: Duration(seconds: durationInSeconds),
      coverUrl: map['coverUrl'] ?? '',  // Added coverUrl mapping
    );
  }
}

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> with SingleTickerProviderStateMixin {
  late AudioPlayer _audioPlayer;
  List<Song> _songs = [];
  int _currentIndex = 0;
  Duration _position = Duration.zero;
  bool _isRepeatOn = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _setupAudioPlayer();
    _fetchSongs();
    
    // Setup animation controller for rotating album art
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
  }

    String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }


  void _setupAudioPlayer() {
    _audioPlayer.positionStream.listen((position) {
      setState(() => _position = position);
    });

    // Handle song completion
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        if (_isRepeatOn) {
          _audioPlayer.seek(Duration.zero);
          _audioPlayer.play();
        } else {
          _nextSong();
        }
      }
    });
  }

  Future<void> _fetchSongs() async {
    try {
      final List<Map<String, dynamic>> data = await Supabase.instance.client
          .from('Songs')
          .select('title, artist, url, releaseDate, duration, coverUrl')
          .order('title')
          as List<Map<String, dynamic>>;

      setState(() {
        _songs = data.map((song) => Song.fromMap(song)).toList();
      });

      if (_songs.isNotEmpty) {
        await _audioPlayer.setUrl(_songs[_currentIndex].url);
      }
    } catch (error) {
      print('Error fetching songs: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load songs: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentSong = _songs.isNotEmpty ? _songs[_currentIndex] : null;
    
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Now Playing', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: currentSong == null 
      ? Center(child: CircularProgressIndicator(color: Colors.white))
      : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Album Art with Animation
            AnimatedBuilder(
              animation: _animationController,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _audioPlayer.playing ? _animationController.value * 0 * 3.14159 : 0,
                  child: child,
                );
              },
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(150),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.network(
                    currentSong.coverUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.music_note, size: 100, color: Colors.white54);
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / 
                                loadingProgress.expectedTotalBytes!
                              : null,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            
            // Song Info
            Column(
              children: [
                Text(
                  currentSong.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  currentSong.artist,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  'Released: ${currentSong.releaseDate}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            
            // Progress Bar
            Column(
              children: [
                StreamBuilder<Duration>(
                  stream: _audioPlayer.positionStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data ?? Duration.zero;
                    return Slider(
                      value: position.inSeconds.toDouble(),
                      min: 0,
                      max: currentSong.duration.inSeconds.toDouble(),
                      onChanged: (value) {
                        _audioPlayer.seek(Duration(seconds: value.toInt()));
                      },
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey[800],
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: StreamBuilder<Duration>(
                    stream: _audioPlayer.positionStream,
                    builder: (context, snapshot) {
                      final position = snapshot.data ?? Duration.zero;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_formatDuration(position),
                            style: TextStyle(color: Colors.grey[400])),
                          Text(_formatDuration(currentSong.duration),
                            style: TextStyle(color: Colors.grey[400])),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            
            // Control Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.shuffle, 
                    color: Colors.grey[400],
                  ),
                  onPressed: _shuffleSongs,
                  iconSize: 32,
                ),
                IconButton(
                  icon: Icon(Icons.skip_previous, color: Colors.white),
                  onPressed: _previousSong,
                  iconSize: 42,
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: StreamBuilder<bool>(
                    stream: _audioPlayer.playingStream,
                    builder: (context, snapshot) {
                      final isPlaying = snapshot.data ?? false;
                      return IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.grey[900],
                        ),
                        onPressed: _playPause,
                        iconSize: 42,
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, color: Colors.white),
                  onPressed: _nextSong,
                  iconSize: 42,
                ),
                IconButton(
                  icon: Icon(
                    Icons.repeat,
                    color: _isRepeatOn ? Colors.white : Colors.grey[400],
                  ),
                  onPressed: () {
                    setState(() => _isRepeatOn = !_isRepeatOn);
                  },
                  iconSize: 32,
                ),
              ],
            ),
            
            // Volume Control
            Row(
              children: [
                Icon(Icons.volume_down, color: Colors.grey[400]),
                Expanded(
                  child: StreamBuilder<double>(
                    stream: _audioPlayer.volumeStream,
                    builder: (context, snapshot) {
                      final volume = snapshot.data ?? 1.0;
                      return Slider(
                        value: volume,
                        onChanged: (value) {
                          _audioPlayer.setVolume(value);
                        },
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey[800],
                      );
                    },
                  ),
                ),
                Icon(Icons.volume_up, color: Colors.grey[400]),
              ],
            ),
          ],
        ),
      ),
    );
  }


  void _playPause() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  void _nextSong() {
    if (_songs.isEmpty) return;
    setState(() {
      if (_currentIndex < _songs.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _audioPlayer.setUrl(_songs[_currentIndex].url);
      _audioPlayer.play();
    });
  }

  void _previousSong() {
    if (_songs.isEmpty) return;
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      } else {
        _currentIndex = _songs.length - 1;
      }
      _audioPlayer.setUrl(_songs[_currentIndex].url);
      _audioPlayer.play();
    });
  }

  void _shuffleSongs() {
    if (_songs.isEmpty) return;
    setState(() {
      final currentSong = _songs[_currentIndex];
      _songs.shuffle();
      _currentIndex = _songs.indexOf(currentSong);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}