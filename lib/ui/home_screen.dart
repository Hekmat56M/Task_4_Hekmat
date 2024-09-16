import 'dart:convert';
//import 'dart:nativewrappers/_internal/vm/lib/convert_patch.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_4_hekmat/data/product_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      // appBar: AppBar(),
      body:
          // SafeArea(
          //       child: SizedBox(
          // height: 700,
          // child:
          ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              data[index].image ?? 'image is null',
              height: 50,
              width: 100,
            ),
            title: Text(
              data[index].title ?? 'title is null',
              maxLines: 1,
            ),
            subtitle: Text(
              data[index].description ?? 'description is null',
              maxLines: 2,
            ),
            trailing: Text(data[index].price.toString() ?? '0.0'),
          );

          // return Container(
          //   height: 100,
          //   width: 100,
          //   color: Colors.grey,
          //   child: ListTile(
          //     leading: Container(
          //       height: 100,
          //       width: 100,
          //       clipBehavior: Clip.antiAlias,
          //       decoration: BoxDecoration(
          //         color: Colors.blue,
          //         //shape: BoxShape.circle,
          //         borderRadius: BorderRadius.circular(9),
          //       ),
          //       child: Image.asset(
          //         'assets/images/image_1.jpeg',
          //         fit: BoxFit.fill,
          //         //color: Colors.white,
          //       ),
          //     ),
          //     title: Text('Song ${index + 1}'),
          //     trailing: const Icon(Icons.arrow_forward_ios_rounded),
          //   ),
          // );
        },
        // separatorBuilder: (context, index) => const SizedBox(
        //       height: 20,
        //     ),
        // itemCount: 10),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: getProductsData,
        child: const Icon(Icons.refresh),
      ),

      // )
      // )
    );
  }
}
