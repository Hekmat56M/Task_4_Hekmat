import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(),
        body: SafeArea(
            child: SafeArea(
                child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 10),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 100,
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/image_1.jpeg',
                height: 130,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    ))));
  }
}
