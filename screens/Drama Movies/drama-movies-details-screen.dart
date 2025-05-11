import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/Movie%20App/colors/movies_colors.dart';

class DramaMoviesDetailScreen extends StatelessWidget {
  final String title;
  final String posterURL;
  const DramaMoviesDetailScreen(
      {super.key, required this.title, required this.posterURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: movieScaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Hero(
                    tag: posterURL,
                    child: Image.network(
                      posterURL,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 160,
                        width: double.infinity,
                        color: Colors.grey.shade200,
                        child: Icon(
                          Icons.broken_image,
                          size: 50,
                          color: movieIconColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    "• Animation • Classic • Comedy • Drama • Horror • Family • Mystery • Western",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Synopsis",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: 4),
                Text(
                  "Enjoy the magical adventure of $title, a captivating drama movie that brings fun, emotions, and excitement to the screen for audiences of all ages",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: movieScaffoldBackground,
        child: ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_rounded, color: movieHeadingColor, size: 26),
              SizedBox(width: 4),
              Text("Add to watchlist"),
            ],
          ),
        ),
      ),
    );
  }
}
