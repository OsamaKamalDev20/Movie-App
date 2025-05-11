import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/Movie%20App/colors/movies_colors.dart';
import 'package:flutter_ui_designs/Movie%20App/screens/Animation%20Movies/animated-movies-home-screen.dart';
import 'package:flutter_ui_designs/Movie%20App/screens/Classic%20Movies/classic-movies-home-screen.dart';
import 'package:flutter_ui_designs/Movie%20App/screens/Comedy%20Movies/comedy-movies-home-screen.dart';
import 'package:flutter_ui_designs/Movie%20App/screens/Drama%20Movies/drama-movies-home-screen.dart';
import 'package:flutter_ui_designs/Movie%20App/screens/Family%20Movies/family-movies-home-screen.dart';
import 'package:flutter_ui_designs/Movie%20App/screens/Horror%20Movies/horror-movies-home-screen.dart';
import 'package:flutter_ui_designs/Movie%20App/screens/Mystery%20Movies/mystery-movies-home-screen.dart';
import 'package:flutter_ui_designs/Movie%20App/screens/Western%20Movies/western-movies-home-screen.dart';

class MoviesCategoriesScreen extends StatefulWidget {
  const MoviesCategoriesScreen({super.key});

  @override
  State<MoviesCategoriesScreen> createState() => _MoviesCategoriesScreenState();
}

class _MoviesCategoriesScreenState extends State<MoviesCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: movieScaffoldBackground,
      appBar: AppBar(
        foregroundColor: movieHeadingColor,
        backgroundColor: movieScaffoldBackground,
        title: Text(
          "Movies Categories",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Select Movie Categories",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              SizedBox(height: 20),
              _buildMoviesCategories("Animation", 1, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimationMoviesHomeScreen(),
                  ),
                );
              }),
              _buildMoviesCategories("Classic", 2, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClassicMoviesHomeScreen(),
                  ),
                );
              }),
              _buildMoviesCategories("Comedy", 3, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComedyMoviesHomeScreen(),
                  ),
                );
              }),
              _buildMoviesCategories("Drama", 4, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DramaMoviesHomeScreen(),
                  ),
                );
              }),
              _buildMoviesCategories("Family", 5, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FamilyMoviesHomeScreen(),
                  ),
                );
              }),
              _buildMoviesCategories("Horror", 6, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HorrorMoviesHomeScreen(),
                  ),
                );
              }),
              _buildMoviesCategories("Mystery", 7, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MysteryMoviesHomeScreen(),
                  ),
                );
              }),
              _buildMoviesCategories("Western", 8, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WesternMoviesHomeScreen(),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoviesCategories(
      String title, int value, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: movieScaffoldBackground,
          border: Border.all(color: movieHeadingColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: value,
              activeColor: movieSubHeadingColor,
              onChanged: (value) {},
            ),
            Text(
              title,
              style: TextStyle(
                color: movieHeadingColor,
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
