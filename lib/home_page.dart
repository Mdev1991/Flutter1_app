import 'package:flutter/material.dart';
import 'package:flutter_app1/drawer_list.dart';
import 'package:flutter_app1/screens/hello_listview.dart';
import 'package:flutter_app1/utils/nav.dart';
import 'package:flutter_app1/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'screens/hello_page2.dart';
import 'screens/hello_page3.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: DrawerList(),
        appBar: AppBar(
          title: Text(
            "Title",
          ),
          bottom: TabBar(tabs: [
            Tab(text: "TAB 1"),
            Tab(text: "TAB 2"),
            Tab(text: "TAB 3")
          ]),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            _body(context),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.white,
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _onClickFab();
              },
            ),
          ],
        ),
      ),
    );
  }

  _onClickFab() {
    print("Adicionar!");
  }
}

_body(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _text(),
        _carousel(),
        _buttons(),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
_carousel() {
  return Container(
    margin: EdgeInsets.only(
      top: 20,
      bottom: 20,
    ),
    height: 300,
    child: PageView(
      children: [
        _img("assets/images/dog1.png"),
        _img("assets/images/dog2.png"),
        _img("assets/images/dog3.png"),
        _img("assets/images/dog4.png"),
        _img("assets/images/dog5.png"),
      ],
    ),
  );
}

_buttons() {
  return Builder(
    builder: (context) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlueButton("ListView",
                  onPressed: () => _onClickNavigator(context, HelloListView())),
              BlueButton("Page 2",
                  onPressed: () => _onClickNavigator(context, HelloPage2())),
              BlueButton("Page 3",
                  onPressed: () => _onClickNavigator(context, HelloPage3())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlueButton("Snack", onPressed: () => _onClickSnack(context)),
              BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
              BlueButton("Toast", onPressed: _onClickToast),
            ],
          ),
        ],
      );
    },
  );
}

void _onClickNavigator(BuildContext context, Widget page) async {
  String s = await push(context, page);

  print(">> $s");
}

_onClickSnack(context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text("Olá Flutter"),
    action: SnackBarAction(
        textColor: Colors.yellow,
        label: "OK!",
        onPressed: () {
          print("OK!");
        }),
  ));
}

_onClickDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Flutter é muito legal"),
            actions: [
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.pop(context);
                  print("Ok");
                },
              )
            ],
          ),
        );
      });
}

_onClickToast() {
  Fluttertoast.showToast(
      msg: "Flutter é muito legal",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black26,
      textColor: Colors.white,
      fontSize: 16.0);
}

_img(String img) {
  return Image.asset(
    img,
    fit: BoxFit.cover,
  );
}

_text() {
  return Text(
    "Gallery",
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      decorationColor: Colors.blue,
    ),
  );
}
