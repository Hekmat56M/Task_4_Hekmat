import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var controllerNo1 = TextEditingController();

  var controllerNo2 = TextEditingController();

  int result = 0;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        // appBar: AppBar(),
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(1),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controllerNo1,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter no.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Enter no. 1'),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 4,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 6,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: controllerNo2,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter no.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Enter no. 2'),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 4,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 6,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      IconButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('This validator is correct');
                              print(controllerNo1.text);
                              print(controllerNo2.text);
                              int number1 = int.parse(controllerNo1.text);
                              int number2 = int.parse(controllerNo2.text);
                              if (number1 >= 10 || number2 >= 10) {
                                print('add small no.');
                              } else {
                                result = number1 + number2;
                              }

                              setState(() {});
                            } else {
                              print('This validator is not correct');
                            }
                          },
                          icon: Icon(Icons.add)),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Result  =  $result'),
                    ],
                  ),
                ))));
  }
}
