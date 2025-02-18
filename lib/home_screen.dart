import 'package:flutter/material.dart';
import 'recipe.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> recipes = [
    Recipe(
      name: 'Pasta Carbonara',
      ingredients: ['Pasta', 'Eggs', 'Parmesan', 'Bacon'],
      instructions: 'Boil pasta, cook bacon, mix with eggs and parmesan.',
    ),
    Recipe(
      name: 'Tomato Soup',
      ingredients: ['Tomatoes', 'Onion', 'Garlic', 'Basil'],
      instructions: 'Sauté onions and garlic, add tomatoes, and simmer.',
    ),
  ];

  List<Recipe> favoriteRecipes = [];

  void toggleFavorite(Recipe recipe) {
    setState(() {
      if (favoriteRecipes.contains(recipe)) {
        favoriteRecipes.remove(recipe);
      } else {
        favoriteRecipes.add(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Book"), backgroundColor: Colors.lightBlueAccent,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(favoriteRecipes),
                ),
              );
            },
            child: Text(
              "View Favorites",
              style: TextStyle(color: Colors.white), // Ensures visibility
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].name),
            trailing: Icon(
              favoriteRecipes.contains(recipes[index]) ? Icons.favorite : Icons.favorite_border,
              color: favoriteRecipes.contains(recipes[index]) ? Colors.red : null,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    recipe: recipes[index],
                    isFavorite: favoriteRecipes.contains(recipes[index]),
                    onFavoriteToggle: toggleFavorite,
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
