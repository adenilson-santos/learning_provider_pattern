import 'package:flutter/material.dart';
import 'package:learning_provider_pattern/controllers/heroes_controller.dart';
import 'package:learning_provider_pattern/models/hero_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _buildList(HeroesController heroesController){
    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index) => _buildItens(heroesController.heroes[index], heroesController),
    );
  }

  Widget _buildItens(HeroModel heroModel, HeroesController heroesController) {
    return ListTile(
      title: Text(heroModel.name),
      trailing: heroModel.isFavorite ? Icon(Icons.star, color: Colors.yellow,) : Icon(Icons.star_border),
      onTap: () {
        heroesController.checkFavorite(heroModel);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Consumer<HeroesController>(
          builder: (context, heroes, widget) {
            return Center(child: Text('${heroes.heroes.where((hero) => hero.isFavorite).length}'));
          },
        ),
      ),
      body: Consumer<HeroesController>(
        builder: (context, heroesController, widget) {
          return _buildList(heroesController);
        },
      )
    );
  }
}
