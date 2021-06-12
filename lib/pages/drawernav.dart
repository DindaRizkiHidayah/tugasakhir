import 'package:flutter/material.dart';
import 'package:tugasakhir/pages/homePenjualan.dart';
import '../Model/sign_in.dart';
import 'home.dart';
import 'login_page.dart';

class DrawerNav extends StatefulWidget {
  @override
  _DrawerNavState createState() => _DrawerNavState();
}

class _DrawerNavState extends State<DrawerNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                name,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                email,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
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
                signOutGoogle();
                Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
              }
            ),
          ],
        ),
      ),
    );
  }
}
