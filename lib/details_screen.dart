import 'package:flutter/material.dart';
import 'recipe.dart';

class DetailsScreen extends StatefulWidget {
  final Recipe recipe;
  final bool isFavorite;
  final Function(Recipe) onFavoriteToggle;

  DetailsScreen({
    required this.recipe,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.onFavoriteToggle(widget.recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.name), backgroundColor: Colors.lightBlueAccent,),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ingredients:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...widget.recipe.ingredients.map((ingredient) => Text("- $ingredient")).toList(),
            SizedBox(height: 10),
            Text("Instructions:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(widget.recipe.instructions),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: toggleFavorite,
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              label: Text(isFavorite ? "Unmark Favorite" : "Mark as Favorite"),
            ),
          ],
        ),
      ),
    );
  }
}
