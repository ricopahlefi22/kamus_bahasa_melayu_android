import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamus_bahasa_melayu/Model/kata.dart';
import 'package:kamus_bahasa_melayu/Services/apiKataStatic.dart';
import 'package:kamus_bahasa_melayu/main.dart';

class KosaKata extends StatelessWidget {
  const KosaKata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Padding(
          padding: EdgeInsets.only(left: 0),
          child: Text(
            'Kosakata',
          ),
        ),
      ),
      drawer: const Navbar(),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Kata>>(
        future: ApiKataStatic.getKata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Kata> listKata = snapshot.data!;
            return Container(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
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
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (
                                  //     BuildContext contex,
                                  //   ) =>
                                  //       DetailAnggotaPage(
                                  //           anggota: listAnggota[index]),
                                  // ));
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            );
          }
        },
      ),
    );
  }
}
