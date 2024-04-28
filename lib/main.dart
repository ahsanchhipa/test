import 'package:flutter/material.dart';
import 'package:patientform/myform.dart';
import 'package:patientform/details.dart  ';
import 'form.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter  PUSH POP ',
        theme: ThemeData.light(),
        home: MyForm()

    );
  }
}



