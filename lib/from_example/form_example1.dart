import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class __FormExample1State extends StatefulWidget {
  const __FormExample1State({Key? key}) : super(key: key);

  @override
  State<__FormExample1State> createState() => ___FormExample1StateState();
}

class ___FormExample1StateState extends State<__FormExample1State> {
  String firstName = "";
  String lastName = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FormExample')),
      body: Form(
        key: formKey,
        child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
            onChanged: (value) {
              setState(() {
                firstName = value;
              });
            },
            validator: (String? value){
              if (value == null || value.isEmpty){
                return "Please enter you First Name";
              }
              return null;
            }),
          TextFormField(
            decoration: const InputDecoration(labelText: 'LastName'),
            onChanged: (value) {
              setState(() {
                lastName = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()){
                print('Success form');
              }
            }, 
            child: Text('Submit')),
          SizedBox(
            height: 20,
          ),     
          Container(
            color: Colors.green,
            child: Text(
              "Name : $firstName $lastName",
              style: TextStyle(fontSize: 26),
            ),
          )
         ],
        )
      )
    );
  }
}