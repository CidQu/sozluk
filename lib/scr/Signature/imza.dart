//HAHAHA- promoting my own team.
import 'package:flutter/material.dart';
import 'package:sozluk/env.dart';

class Signature extends StatelessWidget {
  Signature({Key? key}) : super(key: key);
  final version = env.version;

  @override
  Widget build(BuildContext context) {
    return Text(
      '''Made with 💙 by Kanagawa 🌊
      Version: $version''',
      style: TextStyle(fontSize: 10),
    );
  }
}
