import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir/model/PenjualanCard.dart';

import 'entryformPenjualan.dart'; //pendukung program asinkron

class HomePenjualan extends StatefulWidget {
  @override
  HomePenjualanState createState() => HomePenjualanState();
}

class HomePenjualanState extends State<HomePenjualan> {
  CollectionReference _penjualan = FirebaseFirestore.instance.collection('penjualan');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Daftar Penjualan Frozen Food')),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue[100], Colors.blueGrey[100]],
              ),
            ),
            child: ListView(children: [
              StreamBuilder<QuerySnapshot>(
                stream: _penjualan.orderBy('nama', descending: true).snapshots(),
                builder: (buildContext, snapshot) {
                  //  if(snapshot.data == null ) return CircularProgressIndicator();
                  return Column(
                    children: snapshot.data.docs
                        .map((e) => PenjualanCard(
                              e.data()['nama'],
                              e.data()['kodebarang'],
                              e.data()['jumlahjual'],
                              onUpdate: () {
                                _penjualan
                                    .doc(e.id)
                                    .update({"jumlahjual": e.data()['jumlahjual'] + 1});
                              },
                              onDelete: () {
                                _penjualan.doc(e.id).delete();
                              },
                            ))
                        .toList(),
                  );
                },
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                          child: Text("Tambah Barang"),
                          onPressed: () async {
                            var penjualancard =
                                await navigateToEntryForm(context, null);
                          })))
            ])));
  }
}

Future<PenjualanCard> navigateToEntryForm(
    BuildContext context, PenjualanCard penjualancard) async {
  var result = await Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return EntryFormPenjualan(penjualancard);
  }));
  return result;
}
