import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tugasakhir/model/itemcard.dart';
import 'package:tugasakhir/model/sign_in.dart';
import 'package:tugasakhir/pages/login_page.dart';

class EntryFormStock extends StatefulWidget {
  final String nama;
  final String merk;
  final double harga;
  final int stock;
  final String kodebarang;
  final int expired;
  final String id;

  EntryFormStock(this.nama, this.merk, this.harga, this.stock, this.kodebarang,
      this.expired, this.id,);
  @override
  EntryFormState createState() => EntryFormState();
}

//class controller
class EntryFormState extends State<EntryFormStock> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController merkController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController kodebarangController = TextEditingController();
  final TextEditingController expiredController = TextEditingController();
  CollectionReference _item = FirebaseFirestore.instance.collection('item');

  void clearInputText() {
    namaController.text = "";
    merkController.text = "";
    hargaController.text = "";
    stockController.text = "";
    kodebarangController.text = "";
    expiredController.text = "";
  }

  @override
  Widget build(BuildContext context) {
//rubah
    namaController.text = widget.nama;
    merkController.text = widget.merk;
    hargaController.text = widget.harga.toString();
    stockController.text = widget.stock.toString();
    kodebarangController.text = widget.kodebarang;
    expiredController.text = widget.expired.toString();
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
                  controller: merkController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Merk Barang',
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
                  controller: hargaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Harga Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
//stock
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: stockController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Stock Barang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
//kode barang
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
//expired
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: expiredController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Expired Barang',
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
                          await _item.doc(id).update({
                            "nama": namaController.text,
                            "merk": merkController.text,
                            "harga": double.tryParse(hargaController.text),
                            "stock": int.tryParse(stockController.text),
                            "kode barang": kodebarangController.text,
                            "expired": int.tryParse(expiredController.text),
                            "user" : username,
                          });
                          Navigator.pop(context, _item);
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
