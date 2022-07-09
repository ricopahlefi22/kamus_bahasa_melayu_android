// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailIndex extends StatefulWidget {
  const DetailIndex({Key? key}) : super(key: key);

  @override
  _DetailIndexState createState() => _DetailIndexState();
}

class _DetailIndexState extends State<DetailIndex> {
  AudioPlayer audioPlayer = AudioPlayer();
  String url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3';

  @override
  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {});
    });

    audioPlayer.setSourceUrl(url);
  }

  playMusic() async {
    await audioPlayer.play(UrlSource(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    (Get.arguments[0].toString()),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/volume.png',
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              (Get.arguments[1].toString()),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    'kategori : ' + (Get.arguments[3].toString()),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    (Get.arguments[2].toString()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
