import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mobile/screens/Home/Home.dart';
import 'package:mobile/screens/Home/index.dart';
import 'package:mobile/screens/auth/Login.dart';
import 'package:mobile/screens/auth/CreateNewUser.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
            title: Text(''),
            backgroundColor: Color.fromARGB(255, 106, 149, 251)),*/

        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  'https://res.cloudinary.com/dbfpsigax/image/upload/v1685804937/circles/close-up-happy-people-posing-together_fizy1z.jpg'),
              fit: BoxFit.cover,
            )),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Circles',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w900)),
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
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue)),
                        child: const Text('ログイン')),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () => {
                              Navigator.of(context).push<dynamic>(
                                CreateNewUser.route(),
                              )
                            },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue)),
                        child: const Text('新規登録')),
                    ElevatedButton(
                        onPressed: () => {
                              Navigator.of(context).push<dynamic>(
                                Index.route(),
                              )
                            },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue)),
                        child: const Text('ホーム')),
                  ]),
            )));
  }
}
