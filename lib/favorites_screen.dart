import 'package:flutter/material.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> favoriteRecipes;

  FavoritesScreen(this.favoriteRecipes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Recipes"), backgroundColor: Colors.purpleAccent,),
      body: favoriteRecipes.isEmpty
          ? Center(child: Text("No favorite recipes yet!"))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteRecipes[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipe: favoriteRecipes[index],
                           isFavorite: true, // Since it's in the favorites list, set it as true
                          onFavoriteToggle: (recipe) {}, // No need to toggle here
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
