import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mobile/screens/Auth/CreateNew.dart';
import 'package:mobile/screens/auth/Login.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(''),
            backgroundColor: const Color.fromRGBO(251, 140, 106, 1)),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('JAEL',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () => {
                      Navigator.of(context).push<dynamic>(
                        Login.route(),
                      )
                    },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                child: const Text('Login')),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () => {
                      Navigator.of(context).push<dynamic>(
                        CreateNew.route(),
                      )
                    },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                child: const Text('Create New')),
          ]),
        ));
  }
}
