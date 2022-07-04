// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamus_bahasa_melayu/Model/idiom.dart';
import 'package:kamus_bahasa_melayu/Services/api_idiom_static.dart';
import 'package:kamus_bahasa_melayu/main.dart';

class IdiomPage extends StatefulWidget {
  const IdiomPage({Key? key}) : super(key: key);

  @override
  State<IdiomPage> createState() => _IdiomPageState();
}

class _IdiomPageState extends State<IdiomPage> {
  TextEditingController searchController = TextEditingController();
  Icon appBarIcon = const Icon(Icons.search);
  Widget appBarTitle = const Text("Idiom");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (appBarIcon.icon == Icons.search) {
                  appBarIcon = const Icon(Icons.cancel_outlined);
                  appBarTitle = TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Telusuri Kata...",
                    ),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  );
                } else {
                  appBarIcon = const Icon(Icons.search);
                  appBarTitle = const Text("Idiom");
                }
              });
            },
            icon: appBarIcon,
          )
        ],
      ),
      drawer: const Navbar(),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Idiom>>(
        future: ApiIdiomStatic.getIdiom(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Idiom> listIdiom;
            if(searchController.text.isEmpty) {
            listIdiom = snapshot.data!;
            } else {
            listIdiom = snapshot.data!
                .where((element) => element.namaKata
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase()))
                .toList();
            }
            return Container(
              padding: const EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: listIdiom.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.book_online_outlined),
                            ),
                            title: Text(listIdiom[index].namaKata),
                            // subtitle: Text(listIdiom[index].deskripsi),
                            onTap: () {
                              Get.toNamed('/detailidiom', arguments: [
                                listIdiom[index].namaKata,
                                listIdiom[index].deskripsi
                              ]);
                            },
                          ),
                        ],
                      ),
                    );
                  }),
            );
          }
        },
      ),
    );
  }
}
