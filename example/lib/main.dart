import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:payfort_plugin/payfort_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _userID = '';
  Map result;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String userID;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      userID = await PayfortPlugin.getID;
      debugPrint('user id is $userID');
    } on PlatformException {
      userID = 'Failed to get user ID.';
      debugPrint('Failed to get user ID.');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _userID = userID;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('pay'),
            onPressed: () {
              PayfortPlugin.getID.then((value) => {
                    //use this call to get device id and send it to server
                    debugPrint('user id is $value'),
                    PayfortPlugin.performPaymentRequest(
                            'YOR_MERCHANT_REF',
                            'YOUR_SDK_TOKEN',
                            'ahmed',
                            'en',
                            'user@mail.com',
                            '1',
                            'PURCHASE')
                        .then((value) => {
                              debugPrint(
                                  'card number is ${value['card_number']}')
                            })
                  });
            },
          ),
        ),
      ),
    );
  }
}
