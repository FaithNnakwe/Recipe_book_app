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
      imageUrl: 'assets/avacado_toast.jpeg',
    ),
    Recipe(
      name: 'Caprese Salad',
      ingredients: ['1 large Tomato, sliced', '½ cup fresh mozzarella, sliced', '¼ cup fresh basil leaves', '1 tbsp olive oil', '1 tbsp balsamic glaze', 'Salt & pepper to taste'],
      instructions: 'Arrange tomato and mozzarella slices on a plate, layering with basil. Drizzle with olive oil and balsamic glaze. Season with salt & pepper.',
      imageUrl: 'assets/caprese_salad.jpeg',
    ),
    Recipe(name:'Garlic Butter Chicken', 
    ingredients: ['2 chicken breasts', '3 tbsp butter', '4 cloves garlic minced', '1 tsp paprika', '½ tsp salt & pepper', '1 tbsp parsley chopped'],
    instructions: 'Heat 1 tbsp butter in a pan over medium-high heat. Add chicken, season with paprika, salt, and pepper. Cook until golden brown. Add remaining butter and garlic, stirring until fragrant (about 1 min). Garnish with parsley and serve hot.',
    imageUrl: 'assets/Garlic_butter_chicken.jpeg' 
    ),
    Recipe(name:'Banana oat Pancakes', 
    ingredients: ['1 banana mashed', '1 egg','½ cup oats','½ tsp cinammon', '½ tsp vanilla extract', '1 tbsp honey'],
    instructions: 'Mix all ingredients in a bowl until smooth. Heat a non-stick pan and pour batter to form pancakes. Cook for 2-3 minutes per side until golden. Serve with honey or fresh fruit.',
    imageUrl: 'assets/Banana_oat_pancake.jpeg',
    ),
    Recipe(name:'Teriyaki Beef Stir-Fry', 
    ingredients: ['Beef strips', '1 tbsp olive oil','1 cup broccoli','1 sliced bell pepper', '¼ cup teriyaki sauce ', '1 tsp sesame seeds'],
    instructions: 'Heat oil in a pan and cook beef until browned. Add broccoli and bell pepper, stir-frying for 3 minutes. Pour in teriyaki sauce, cook for another 2 minutes, and serve with rice.',
    imageUrl: 'assets/Teriyaki_beef_sauce.jpeg',
    ),
    Recipe(name: 'Chicken Pad Thai', 
    ingredients: ['8 oz rice noodles', '2 tbsp vegetable oil', '1 lb chicken breast, sliced', '2 cloves garlic, minced', '2 eggs, beaten', '¼ cup fish sauce', '2 tbsp soy sauce', '1 tbsp tamarind paste', '1 tbsp brown sugar', '½ cup bean sprouts', '¼ cup crushed peanuts', '2 green onions, chopped', 'Lime wedges for serving'],
    instructions: 'Cook rice noodles according to package instructions and set aside. Heat oil in a pan and cook chicken until golden. Add garlic and eggs, stirring until eggs are scrambled. Stir in fish sauce, soy sauce, tamarind paste, and sugar. Toss in noodles, bean sprouts, and green onions. Serve with crushed peanuts and lime wedges.',
    imageUrl: 'assets/chicken_pad_thai.jpeg',
    ),
    Recipe(name: 'Chapati', 
    ingredients: ['2 cups flour', '½ tsp salt', '¾ cup warm water', '1 tbsp oil'],
    instructions: 'Mix flour and salt. Gradually add warm water and knead into a soft dough. Cover and let rest for 30 minutes. Divide into small balls, roll out, and cook on a dry pan until golden brown on both sides. Serve with stew or tea.',
    imageUrl: 'assets/chapati.jpeg',
    ),
    Recipe(name: 'Jollof Rice', 
    ingredients: ['2 cups rice', '1 can tomato paste', '2 tomatoes, blended', '1 onion, chopped', '2 cups chicken broth', '1 tsp thyme', '1 tsp curry powder', '1 tsp paprika', '2 tbsp vegetable oil', '1 cup mixed vegetables', 'Salt to taste'],
    instructions: 'Heat oil in a pot, sauté onions until translucent. Add blended tomatoes and tomato paste, cook for 10 minutes. Stir in seasonings and broth. Add rice, cover, and cook on low heat until tender. Add vegetables and simmer for 5 more minutes before serving.',
    imageUrl: 'assets/jollof_rice.jpeg',
   ),
    Recipe(name: 'Beef Bulgogi', 
    ingredients: ['1 lb beef sirloin, thinly sliced', '¼ cup soy sauce', '2 tbsp brown sugar', '1 tbsp sesame oil', '2 cloves garlic, minced', '1 tsp ginger, grated', '1 tbsp sesame seeds', '1 green onion, chopped', '1 small onion, sliced'],
    instructions: 'In a bowl, mix soy sauce, brown sugar, sesame oil, garlic, and ginger. Add beef and marinate for at least 30 minutes. Heat a pan and cook beef with sliced onions until caramelized. Sprinkle with sesame seeds and green onions before serving.',
    imageUrl: 'assets/beef_bulgogi.jpeg',
   ),
    Recipe(name: 'Puff-Puff', 
    ingredients: ['2 cups flour', '½ cup sugar', '1 tsp yeast', '½ tsp nutmeg', '1 cup warm water', 'Vegetable oil for frying'],
    instructions: 'Dissolve yeast in warm water and let sit for 5 minutes. Mix flour, sugar, and nutmeg. Add yeast mixture and mix into a smooth batter. Let rest for 1 hour. Heat oil and drop spoonfuls of batter, frying until golden brown. Serve warm.',
    imageUrl: 'assets/puff_puff.jpeg',
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
      body: ListView.separated(
        itemCount: recipes.length,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                recipes[index].imageUrl,
                width:50,
                height:50,
                fit: BoxFit.cover,
              ),
            ),
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
