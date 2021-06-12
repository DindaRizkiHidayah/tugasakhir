import 'package:flutter/material.dart';
import 'package:tugasakhir/pages/homePenjualan.dart';
import 'package:tugasakhir/pages/login_page.dart';

import '../Model/sign_in.dart';
import 'home.dart';

class DrawerNavEmail extends StatefulWidget {
  @override
  _DrawerNavEmailState createState() => _DrawerNavEmailState();
}

class _DrawerNavEmailState extends State<DrawerNavEmail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(
                email,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              accountName: null,
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Data Stock Frozen Food"),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home())),
            ),
            ListTile(
              leading: Icon(Icons.add_shopping_cart),
              title: Text("Data Penjualan Frozen Food"),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomePenjualan())),
            ),
            ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log Out"),
                onTap: () {
                  signOutWithEmail();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                      
                }),
          ],
        ),
      ),
    );
  }
}
