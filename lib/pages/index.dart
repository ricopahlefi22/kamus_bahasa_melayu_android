import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamus_bahasa_melayu/Model/index.dart';
import 'package:kamus_bahasa_melayu/Services/apiStatic.dart';
import 'package:kamus_bahasa_melayu/main.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Padding(
          padding: EdgeInsets.only(left: 0),
          child: Text(
            'Index',
          ),
        ),
      ),
      drawer: const Navbar(),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Index>>(
        future: ApiIndexStatic.getIndex(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Index> listIndex = snapshot.data!;
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
                                title: Text(listIndex[index].namaKata),
                                // subtitle: Text(listIndex[index].deskripsi),
                                onTap: () {
                                  Get.toNamed('/detailindex', arguments: [
                                    listIndex[index].namaKata,
                                    listIndex[index].deskripsi,
                                    listIndex[index].namaKategori,
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
