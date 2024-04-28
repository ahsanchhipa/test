import 'package:flutter/material.dart';

import 'details.dart';
import 'myform.dart';


class Myform extends StatefulWidget {
  const Myform({super.key});

  @override
  State<Myform> createState() => _MyformState();
}

class _MyformState extends State<Myform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Form"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(decoration: InputDecoration(
                hintText: "Product Name",
                icon: Icon(Icons.verified_user_outlined)
            ),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder()
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 100)),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return const Details();
            })
        );
      },
      child: Text(
        "Submit Form".toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
