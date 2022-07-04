// source sumber
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamus_bahasa_melayu/Model/index.dart';
import 'package:kamus_bahasa_melayu/Services/api_static.dart';
import 'package:kamus_bahasa_melayu/main.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  TextEditingController searchController = TextEditingController();
  Icon appBarIcon = const Icon(Icons.search);
  Widget appBarTitle = const Text("Index");

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
                  appBarTitle = const Text("Index");
                }
              });
            },
            icon: appBarIcon,
          )
        ],
      ),
      drawer: const Navbar(),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Index>>(
        future: ApiIndexStatic.getIndex(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Index> listIndex;
            if (searchController.text.isEmpty) {
              listIndex = snapshot.data!;
            } else {
              listIndex = snapshot.data!
                  .where((element) => element.namaKata
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase()))
                  .toList();
            }
            return Container(
              padding: const EdgeInsets.all(5),
              child: ListView.builder(
                  itemCount: listIndex.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.book_online_outlined),
                            ),
                            title: Text(listIndex[index].namaKata),
                            // subtitle: Text(listIndex[index].deskripsi),
                            onTap: () {
                              Get.toNamed('/detailindex', arguments: [
                                listIndex[index].namaKata,
                                listIndex[index].deskripsi,
                                listIndex[index].namaKategori,
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
