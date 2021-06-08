import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tugasakhir/model/PenjualanCard.dart';
import 'package:tugasakhir/model/itemcard.dart';

class EntryFormPenjualan extends StatefulWidget {
    final PenjualanCard penjualanCard;
  EntryFormPenjualan(this.penjualanCard);
  @override
  EntryFormPenjualanState createState() => EntryFormPenjualanState();
}

//class controller
class EntryFormPenjualanState extends State<EntryFormPenjualan> {
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Data Penjualan Frozen food'),
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
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: kodebarangController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'kode Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: jumlahjualController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Jumlah jual',
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
                          await _penjualan.add({
                            "nama": namaController.text,
                            "kode barang": kodebarangController.text,
                            "jumlah jual": int.tryParse(jumlahjualController.text)
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
