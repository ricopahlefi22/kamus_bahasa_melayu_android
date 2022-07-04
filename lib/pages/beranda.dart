import 'package:kamus_bahasa_melayu/main.dart';
import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  const Beranda({key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Navbar(),
      body: Stack(
        // struktur body berubah jadi gini pak ade widget stacknye
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                const Text(
                  "SELAMAT DATANG DI",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/images/logo-kbmk-low.png',
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
