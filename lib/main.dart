import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

class Recipe {
  final String name;
  final List<String> ingredients;
  final String instructions;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
  });
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

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
        title: Text("Recipe Book"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade600, Colors.blue.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.restaurant, color: Colors.blueAccent),
                  title: Text(
                    recipes[index].name,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  tileColor: Colors.blue.shade400,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipe: recipes[index],
                          onFavoriteToggle: toggleFavorite,
                          isFavorite: favoriteRecipes.contains(recipes[index]),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
