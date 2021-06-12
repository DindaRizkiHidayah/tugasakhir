import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login_page.dart';

class EntryFormPen extends StatefulWidget {
  final String nama;
  final String kodebarang;
  final int jumlahjual;
  final String id;

  EntryFormPen(this.nama, this.kodebarang,this.jumlahjual, this.id,);
  @override
  EntryFormState createState() => EntryFormState();
}

//class controller
class EntryFormState extends State<EntryFormPen> {
   final TextEditingController namaController = TextEditingController();
  final TextEditingController kodebarangController = TextEditingController();
  final TextEditingController jumlahjualController = TextEditingController();
  CollectionReference _penjualan = FirebaseFirestore.instance.collection('penjualan');

  void clearInputText() {
    namaController.text = "";
    kodebarangController.text = "";
    jumlahjualController.text = "";
  }

  @override
  Widget build(BuildContext context) {
//rubah
    namaController.text = widget.nama;
    kodebarangController.text = widget.kodebarang;
    jumlahjualController.text = widget.jumlahjual.toString();
    return Scaffold(
        appBar: AppBar(
          title: Text('Data Stock Frozen food'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
// nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: namaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
// merk
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: kodebarangController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Kode Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
//harga
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: jumlahjualController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Jumlah Jual',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
// tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
// tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () async {
                          // TODO 1 ADD DATA HERE
                          String id = widget.id;
                          await _penjualan.doc(id).update({
                            "nama": namaController.text,
                            "kode barang": kodebarangController.text,
                            "jumlah jual": int.tryParse(jumlahjualController.text),
                            "user" : username,
                          });
                          Navigator.pop(context, _penjualan);
                          clearInputText();
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
// tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
