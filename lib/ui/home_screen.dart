import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
            child: Container(
      height: 700,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              width: 100,
              color: Colors.grey,
              child: ListTile(
                leading: Container(
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    //shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Image.asset(
                    'assets/images/image_1.jpeg',
                    fit: BoxFit.fill,
                    //color: Colors.white,
                  ),
                ),
                title: Text('Song ${index + 1}'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
          itemCount: 10),
    )));
  }
}
