import 'package:flutter/material.dart';
import 'package:learning_provider_pattern/controllers/heroes_controller.dart';
import 'package:learning_provider_pattern/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HeroesController>.value(value: HeroesController()),
      ],
      child: MaterialApp(
        title: 'Learning Provider Pattern',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: 'Learning Provider Pattern'),
      ),
    );
  }
}