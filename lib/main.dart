import 'package:kamus_bahasa_melayu/pages/beranda.dart';
import 'package:kamus_bahasa_melayu/pages/detail_idiom.dart';
import 'package:kamus_bahasa_melayu/pages/detail_index.dart';
import 'package:kamus_bahasa_melayu/pages/detail_kosakata.dart';
import 'package:kamus_bahasa_melayu/pages/idiom.dart';
import 'package:kamus_bahasa_melayu/pages/index.dart';
import 'package:kamus_bahasa_melayu/pages/kosakata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
          name: '/beranda',
          page: () => const Beranda(),
        ),
        GetPage(
          name: '/index',
          page: () => const IndexPage(),
        ),
        GetPage(
          name: '/kosakata',
          page: () => const KosaKata(),
        ),
        GetPage(
          name: '/idiom',
          page: () => const IdiomPage(),
        ),
        GetPage(
          name: '/detailindex',
          page: () => const DetailIndex(),
        ),
        GetPage(
          name: '/detailkosakata',
          page: () => const DetailKosakata(),
        ),
        GetPage(
          name: '/detailidiom',
          page: () => const DetailIdiom(),
        ),
        // GetPage(
        //   name: '/idiom',
        //   page: () => const Idiom(),
        // ),
      ],
      title: "Kamus Bahasa Melayu Ketapang",
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Navbar(),
      body: Beranda(),
    );
  }
}

class Navbar extends StatefulWidget {
  const Navbar({key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Kamus Bahasa Melayu Ketapang"),
            accountEmail: const Text("v.1.0"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logo-kbmk-low.png', //ini link buat kau masukkan foto dibagian bulat
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.orange,
              image: DecorationImage(
                image: NetworkImage(
                  '', //ini bise buat cantumkan gambar di kotak navbar yang besar tu
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          buildNavbarItem(Icons.home, "Beranda", '/beranda'),
          const Divider(),
          buildNavbarItem(Icons.sort_by_alpha_outlined, "Index", '/index'),
          buildNavbarItem(Icons.book_outlined, "Kosakata", '/kosakata'),
          buildNavbarItem(Icons.speaker_group_outlined, "Idiom", '/idiom'),
        ],
      ),
    );
  }

  Widget buildNavbarItem(IconData icon, String text, String routeName) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        setState(() {
          Get.toNamed(routeName);
        });
      },
    );
  }
}
