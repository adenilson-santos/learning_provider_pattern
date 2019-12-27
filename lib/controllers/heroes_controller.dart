import 'package:flutter/material.dart';
import 'package:learning_provider_pattern/models/hero_model.dart';

class HeroesController extends ChangeNotifier {

  List<HeroModel> heroes = [

    HeroModel(name: 'Thor'),
    HeroModel(name: 'Wonderful Woman'),
    HeroModel(name: 'Iron Man'),
    HeroModel(name: 'Batman'),
    HeroModel(name: 'American Captain'),
    HeroModel(name: 'Superman'),
    HeroModel(name: 'Spider Man'),

  ];

  void checkFavorite(HeroModel model){
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }

}