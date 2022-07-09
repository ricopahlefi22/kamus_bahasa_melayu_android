// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailIdiom extends StatefulWidget {
  const DetailIdiom({Key? key}) : super(key: key);

  @override
  _DetailIdiomState createState() => _DetailIdiomState();
}

class _DetailIdiomState extends State<DetailIdiom> {
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
