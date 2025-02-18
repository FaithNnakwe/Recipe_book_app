import 'package:flutter/material.dart';
import 'recipe.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> favoriteRecipes;

  FavoritesScreen(this.favoriteRecipes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(title: Text("Favorite Recipes"), backgroundColor: Colors.lightBlueAccent,),
      body: favoriteRecipes.isEmpty
          ? Center(child: Text("No favorite recipes yet!"))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.white,
                  title: Text(favoriteRecipes[index].name,
                  style: TextStyle(color:Colors.black),),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipe: favoriteRecipes[index],
                          isFavorite: true,
                          onFavoriteToggle: (recipe) {},
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
