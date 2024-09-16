import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_4_hekmat/data/product_data_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> getProductsData() async {
    try {
      data.clear();
      setState(() {});
      final uri = Uri.parse('https://fakestoreapi.com/products');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        List<dynamic> listOfObjects = jsonDecode(response.body);

        for (Map<String, dynamic> map in listOfObjects) {
          ProductDataModel product = ProductDataModel(
            title: map['title'],
            description: map['description'],
            image: map['image'],
            price: map['price'].toDouble(),
          );
          data.add(product);
        }
        print(data.length);
        setState(() {});
      } else {
        throw Exception('${response.statusCode}');
      }
    } catch (e) {
      print(e);
      print('Failed to fetch data');
    }
  }

  List<ProductDataModel> data = [
    // ProductDataModel(
    //   title: null,
    //   description: null,
    //   image: null,
    //   price: null,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
        child: SafeArea(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 10),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  data[index].image ?? 'image is null',
                  height: 50,
                  width: 100,
                ),
                // title: Text(
                //   data[index].title ?? 'title is null',
                //   maxLines: 1,
                // ),
                // subtitle: Text(
                //   data[index].description ?? 'description is null',
                //   maxLines: 2,
                // ),
                trailing: Text(data[index].price.toString() ?? '0.0'),
              );
              // return Container(
              //   height: 100,
              //   width: 100,
              //   color: Colors.amber,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Image.asset(
              //         'assets/images/image_1.jpeg',
              //         height: 130,
              //       ),
              //       const SizedBox(
              //         height: 10,
              //       ),
              //     ],
              //   ),
              // );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getProductsData,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
