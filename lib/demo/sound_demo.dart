import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

class AudioMetadata {
  Color color;
  AudioMetadata({this.color}) {}
}

class SoundDemo extends StatefulWidget {
  @override
  _SoundDemoState createState() => _SoundDemoState();
}

class _SoundDemoState extends State<SoundDemo> {
  AudioPlayer _player;
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<SequenceState>(
        stream: _player.sequenceStateStream,
        builder: (context, snapshot) {
          final state = snapshot.data;
          final sequence = state?.sequence ?? [];
          return ListView.builder(
            itemCount: sequence.length,
            itemBuilder: (context, index) => Material(
              color: index == state.currentIndex ? Colors.grey.shade300 : null,
              child: FlatButton(
                color: sequence[index].tag.color,
                child: null,
                // color: sequence[index].tag.color,
                onPressed: () async {
                  await playSound(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  Expanded musicButton({Color color, int index}) {
    return Expanded(
        child: FlatButton(
      child: null,
      color: color,
      onPressed: () {
        playSound(index);
      },
    ));
  }

  Future<void> playSound(int index) async {
    await _player.stop();
    _player.seek(Duration.zero, index: index);
    _player.play();
    new Timer(_player.duration, () async => {await _player.stop()});
  }

  _init() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());

    ConcatenatingAudioSource _playlist = ConcatenatingAudioSource(children: [
      AudioSource.uri(Uri.parse('asset:///assets/note1.wav'),
          tag: AudioMetadata(color: Colors.red)),
      AudioSource.uri(Uri.parse('asset:///assets/note2.wav'),
          tag: AudioMetadata(color: Colors.yellow)),
      AudioSource.uri(Uri.parse('asset:///assets/note3.wav'),
          tag: AudioMetadata(color: Colors.teal)),
      AudioSource.uri(Uri.parse('asset:///assets/note4.wav'),
          tag: AudioMetadata(color: Colors.blue)),
      AudioSource.uri(Uri.parse('asset:///assets/note5.wav'),
          tag: AudioMetadata(color: Colors.orange)),
      AudioSource.uri(Uri.parse('asset:///assets/note6.wav'),
          tag: AudioMetadata(color: Colors.pink)),
      AudioSource.uri(Uri.parse('asset:///assets/note7.wav'),
          tag: AudioMetadata(color: Colors.indigo)),
    ]);
    try {
      await _player.load(_playlist);
    } catch (e) {
      // catch load errors: 404, invalid url ...
      print("An error occured $e");
    }
    _player.setLoopMode(LoopMode.off);
  }
}
