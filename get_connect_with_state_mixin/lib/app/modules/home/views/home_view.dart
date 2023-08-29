import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
      ),
      body: controller.obx(
        (data) => ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: data!.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage(data[index]['picture']['large']),
                    ),
                    title: Text(
                      data[index]['name']['title'] +
                          " " +
                          data[index]['name']['first'] +
                          " " +
                          data[index]['name']['last'],
                    ),
                    subtitle: Text(
                      data[index]['email'],
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: Text(
                      "Age : ${data[index]['dob']['age']}",
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        onError: (error) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}
