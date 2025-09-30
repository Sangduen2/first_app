import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FromRegistration extends StatefulWidget {
  const FromRegistration({Key? key}) : super(key: key);

  @override
  State<FromRegistration> createState() => _FromRegitrationState();
}

class _FromRegitrationState extends State<FromRegistration> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //controller
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? gender = 'Male';
  String? selectedProvice;
  bool isAccept = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration From')),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration:InputDecoration(label: Text('Full Name')) ,
              controller: fullNameController,
              validator: (String? value){
                if (value == null || value.isEmpty) {
                  return "Please enter you Full Name";
                }
                return null;
              },
            ),
            TextFormField(
              decoration:InputDecoration(label: Text('Email')) ,
              controller: emailController,
              validator: (String? value){
                if (value == null || value.isEmpty) {
                  return "Please enter you Email";
                }
                return null;
              },
            ),
            Column(
              children: [
                RadioListTile(
                  value: 'Male',
                  title: Text('Male'),
                  groupValue: gender,
                  onChanged: (String? value){
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                RadioListTile(
                  value: 'Female',
                  title: Text('Female'),
                  groupValue: gender,
                  onChanged: (String? value){
                    setState(() {
                      gender = value;
                    });
                  },
                ),
              ],
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Provice'),
              value: selectedProvice,
              items: ['Bangkok', 'Chaing Mai', 'Phuget']
              .map((String item) => 
                DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedProvice = value;
                });
              },
              validator: (String? value){
                if(value == null){
                  return "Plese select Provice";
                }
                return null;
              },
            ),
            CheckboxListTile(
              title: const Text("Accept Term & Conditions"),
              checkColor: Colors.blue,
              value: isAccept,
              onChanged: (bool? value) {
                setState(() {
                  isAccept = value!;
                });
              }),
            ElevatedButton(onPressed: () {
              if (formKey.currentState!.validate()) {
                print('sucess form');
              }
            }, child: Text('Submit'))
          ],
        )),
    );
  }
}