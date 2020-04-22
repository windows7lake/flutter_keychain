import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _firstStart = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Text('First Start: $_firstStart\n'),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Permission.storage.request();
              },
              child: Text('Permissinon\n'),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                FlutterKeychain.put(
                  key: "100uuidKey",
                  value: "456789",
                );
                print("====== put");
              },
              child: Text('put\n'),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                String uuidKey = await FlutterKeychain.get(key: "100uuidKey");
                print("====== get: $uuidKey");
                _firstStart = uuidKey;
                setState(() {});
              },
              child: Text('gut\n'),
            ),
          ]),
        ),
      ),
    );
  }
}
