import 'package:flutter/material.dart';
import 'package:tugasakhir/pages/EntryFormPen.dart';

class PenjualanCard extends StatelessWidget {
  final String nama;
  final String kodebarang;
  final int jumlahjual;
  final String user;
  final String id;
  //// Pointer to Update Function
  // final Function onUpdate;
  //// Pointer to Delete Function
  final Function onDelete;

  PenjualanCard(this.nama, this.kodebarang,this.jumlahjual,this.user,this.id,
      {this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue.shade900)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Nama : " + nama,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.5,
                 Text(
                  "Kode Barang : " + kodebarang,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              // ),
              Text(
                'Jumlah Jual : $jumlahjual',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              Text(
                'user : ' + user,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                child: RaisedButton(
                    shape: CircleBorder(),
                    color: Colors.green[900],
                    child: Center(
                        child: Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    )),
                    onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EntryFormPen(
                     this.nama,
                     this.kodebarang,
                     this.jumlahjual,
                     this.id,
                  ),
                ),
              ),),
              ),
              SizedBox(
                height: 40,
                width: 60,
                child: RaisedButton(
                    shape: CircleBorder(),
                    color: Colors.red[900],
                    child: Center(
                        child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      // if (onDelete != null) onDelete!();
                      onDelete();
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
