import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamus_bahasa_melayu/Model/idiom.dart';
import 'package:kamus_bahasa_melayu/Services/apiIdiomStatic.dart';
import 'package:kamus_bahasa_melayu/main.dart';

class IdiomPage extends StatelessWidget {
  const IdiomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Padding(
          padding: EdgeInsets.only(left: 0),
          child: Text(
            'Idiom',
          ),
        ),
      ),
      drawer: const Navbar(),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Idiom>>(
        future: ApiIdiomStatic.getIdiom(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Idiom> listIdiom = snapshot.data!;
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
                                title: Text(listIdiom[index].namaKata),
                                // subtitle: Text(listIdiom[index].deskripsi),
                                onTap: () {
                                  Get.toNamed('/detailidiom', arguments: [
                                    listIdiom[index].namaKata,
                                    listIdiom[index].deskripsi
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
