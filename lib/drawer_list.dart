import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Lucas de Oliveira França"),
              accountEmail: Text("mdevstartup@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuoaC-QBBFgMTXhL8ATmQO7mKT0DLBE_tqaA&usqp=CAU"),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.star),
              title: Text("Favorites"),
              subtitle: Text("Mais informações..."),
              trailing: Icon(Icons.forward),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.app_settings_alt),
              title: Text("Config"),
              subtitle: Text("Mais informações..."),
              trailing: Icon(Icons.forward),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.logout),
              title: Text("logout"),
              trailing: Icon(Icons.forward),
            ),
          ],
        ),
      ),
    );
  }
}
