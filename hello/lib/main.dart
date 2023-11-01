import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Multiple Audio Player'),
        ),
        body: AudioPlayerScreen(),
      ),
    );
  }
}

class AudioPlayerScreen extends StatefulWidget {
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  List<String> audioUrls = [
    'assets/audio/Dream English Traditional ABC01 (1).mp3',
    'assets/audio/Dream English Traditional ABC01 (1).mp3',
    "assets/audio/25711986_abc-song-funny-cartoon-comedy_by_m3m_preview.mp3",
  ];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerCompletion.listen((event) {
      playNextAudio();
    });
  }

  void playNextAudio() {
    if (currentIndex < audioUrls.length) {
      audioPlayer.play(audioUrls[currentIndex], isLocal: false);
      currentIndex++;
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset("assets/images/kaka.jpeg"),


          ElevatedButton(
            onPressed: () {
              playNextAudio();
            },
            child: Text('Play Next Audio'),
          ),
        ],
      ),
    );
  }
}
