import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Recipe recipe;
  final Function(Recipe) onFavoriteToggle;
  final bool isFavorite; // Add this parameter

  DetailsScreen({
    required this.recipe,
    required this.onFavoriteToggle,
    required this.isFavorite,
  });

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool isFavorite; // Local state to track favorite status

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite; // Initialize with the passed favorite state
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // Toggle local favorite state
    });
    widget.onFavoriteToggle(widget.recipe); // Notify HomeScreen to update favorite list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.name), backgroundColor: Colors.purpleAccent),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ingredients:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...widget.recipe.ingredients.map((ingredient) => Text(ingredient)).toList(),
            SizedBox(height: 16),
            Text("Instructions:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(widget.recipe.instructions),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleFavorite,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                  SizedBox(width: 8),
                  Text(isFavorite ? "Unmark as Favorite" : "Mark as Favorite"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


