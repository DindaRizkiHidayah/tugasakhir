import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir/model/itemcard.dart';
import 'package:tugasakhir/model/sign_in.dart';
import 'package:tugasakhir/pages/entryform.dart'; //pendukung program asinkron

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  CollectionReference _item = FirebaseFirestore.instance.collection('item');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Daftar Stock Frozen Food')),
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
                stream: _item.snapshots(),
                builder: (buildContext, snapshot) {
                  //  if(snapshot.data == null ) return CircularProgressIndicator();
                  return Column(
                    children: snapshot.data.docs
                        .map((e) => ItemCard(
                              e.data()['nama'],
                              e.data()['merk'],
                              e.data()['harga'],
                              e.data()['stock'],
                              e.data()['kode barang'],
                              e.data()['expired'],
                              e.data()['user'],
                              e.id,
                              // onUpdate: () {
                              //   _item
                              //       .doc(e.id)
                              //       .update({"stock": e.data()['stock'] + 1});
                              // },
                              onDelete: () {
                                _item.doc(e.id).delete();
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
                            var itemcard =
                                await navigateToEntryForm(context, null);
                          })))
            ])));
  }
}

Future<ItemCard> navigateToEntryForm(
    BuildContext context, ItemCard itemcard) async {
  var result = await Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return EntryForm(itemcard);
  }));
  return result;
}
