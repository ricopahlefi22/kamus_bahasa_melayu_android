import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailKosakata extends StatefulWidget {
  const DetailKosakata({Key? key}) : super(key: key);

  @override
  _DetailKosakataState createState() => _DetailKosakataState();
}

class _DetailKosakataState extends State<DetailKosakata> {
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
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  (Get.arguments[0].toString()),
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    (Get.arguments[1].toString()),
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
