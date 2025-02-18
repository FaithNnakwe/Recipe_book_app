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
      name: 'Avocado with Toast',
      ingredients: ['2 slices of bread', '1 ripe avacado', 'salt and pepper', '1 tsp lemon juice', '2 eggs','Red pepper flakes'],
      instructions: 'Toast bread until golden. Mash avocado with lemon juice, salt, and pepper. Spread on toast and top with eggs. Sprinkle with red pepper flakes.',
    ),
    Recipe(
      name: 'Caprese Salad',
      ingredients: ['1 large Tomato, sliced', '½ cup fresh mozzarella, sliced', '¼ cup fresh basil leaves', '1 tbsp olive oil', '1 tbsp balsamic glaze', 'Salt & pepper to taste'],
      instructions: 'Arrange tomato and mozzarella slices on a plate, layering with basil. Drizzle with olive oil and balsamic glaze. Season with salt & pepper.',
    ),
    Recipe(name:'Garlic Butter Chicken', 
    ingredients: ['2 chicken breasts', '3 tbsp butter', '4 cloves garlic minced', '1 tsp paprika', '½ tsp salt & pepper', '1 tbsp parsley chopped'],
    instructions: 'Heat 1 tbsp butter in a pan over medium-high heat. Add chicken, season with paprika, salt, and pepper. Cook until golden brown. Add remaining butter and garlic, stirring until fragrant (about 1 min). Garnish with parsley and serve hot.',
    ),
    Recipe(name:'Banana oat Pancakes', 
    ingredients: ['1 banana mashed', '1 egg','½ cup oats','½ tsp cinammon', '½ tsp vanilla extract', '1 tbsp honey'],
    instructions: 'Mix all ingredients in a bowl until smooth. Heat a non-stick pan and pour batter to form pancakes. Cook for 2-3 minutes per side until golden. Serve with honey or fresh fruit.',
    ),
    Recipe(name:'Teriyaki Beef Stir-Fry', 
    ingredients: ['Beef strips', '1 tbsp olive oil','1 cup broccoli','1 sliced bell pepper', '¼ cup teriyaki sauce ', '1 tsp sesame seeds'],
    instructions: 'Heat oil in a pan and cook beef until browned. Add broccoli and bell pepper, stir-frying for 3 minutes. Pour in teriyaki sauce, cook for another 2 minutes, and serve with rice.',
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
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text("Recipe Book"), backgroundColor: Colors.transparent, elevation: 0,
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
            tileColor: Colors.white,
            title: Text(recipes[index].name,  
            style: TextStyle(color:Colors.black),
            ),
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
