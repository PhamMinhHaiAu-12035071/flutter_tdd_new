import 'package:flutter/material.dart';
import 'package:flutter_tdd_new/configs/routers/e_page.dart';

class HomeScreen extends EPage {
  const HomeScreen({required Map<String, dynamic> args}) : super(args: args);

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('This is home screen'),
      ),
    );
  }
}
