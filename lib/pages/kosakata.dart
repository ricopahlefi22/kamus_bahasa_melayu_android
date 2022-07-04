// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamus_bahasa_melayu/Model/kata.dart';
import 'package:kamus_bahasa_melayu/Services/api_kata_static.dart';
import 'package:kamus_bahasa_melayu/main.dart';

class KosaKata extends StatefulWidget {
  const KosaKata({Key? key}) : super(key: key);

  @override
  State<KosaKata> createState() => _KosaKataState();
}

class _KosaKataState extends State<KosaKata> {
  TextEditingController searchController = TextEditingController();
  Icon appBarIcon = const Icon(Icons.search);
  Widget appBarTitle = const Text("KosaKata");
  
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
                  appBarTitle = const Text("Kosakata");
                }
              });
            },
            icon: appBarIcon,
          )
        ],
      ),
      drawer: const Navbar(),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Kata>>(
        future: ApiKataStatic.getKata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Kata> listKata;
            if(searchController.text.isEmpty) {
            listKata = snapshot.data!;
            } else {
            listKata = snapshot.data!
                .where((element) => element.namaKata
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase()))
                .toList();
            }
            return Container(
              padding: const EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: listKata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      // ignore: avoid_unnecessary_containers
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.book_online_outlined),
                              ),
                              title: Text(listKata[index].namaKata),
                              // subtitle: Text(listKata[index].deskripsi),
                              onTap: () {
                                Get.toNamed('/detailkosakata', arguments: [
                                  listKata[index].namaKata,
                                  listKata[index].deskripsi
                                ]);
                              },
                            ),
                          ],
                        ),
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
