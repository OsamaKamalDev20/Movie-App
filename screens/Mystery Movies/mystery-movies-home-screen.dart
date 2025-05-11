import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/Movie%20App/colors/movies_colors.dart';
import 'package:flutter_ui_designs/Movie%20App/screens/Mystery%20Movies/mystery-movies-details-screen.dart';
import 'package:flutter_ui_designs/Movie%20App/services/mystery_movies_services.dart';

class MysteryMoviesHomeScreen extends StatefulWidget {
  const MysteryMoviesHomeScreen({super.key});

  @override
  State<MysteryMoviesHomeScreen> createState() =>
      _MysteryMoviesHomeScreenState();
}

class _MysteryMoviesHomeScreenState extends State<MysteryMoviesHomeScreen> {
  late Future<List<dynamic>> mysteryMoviesFuture;

  @override
  void initState() {
    super.initState();
    mysteryMoviesFuture = MysteryMoviesServices.fetchMysteryMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: movieScaffoldBackground,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: movieHeadingColor,
        backgroundColor: movieScaffoldBackground,
        title: Text(
          "Mystery Movies",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, Osama",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Watch your mystery movie here!",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: movieScaffoldBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.notifications,
                        color: movieIconColor,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              // Search Box
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: movieHeadingColor.withOpacity(.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.search,
                      size: 24,
                      color: movieIconColor,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search your Mystery Movies",
                          border: InputBorder.none,
                          hintStyle: Theme.of(context).textTheme.bodyLarge,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: movieIconColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.tune,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // Title Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mystery Movies",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                    "View All",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              // Animated Movies List
              SizedBox(height: 20),
              Expanded(
                child: FutureBuilder(
                  future: mysteryMoviesFuture,
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: movieIconColor,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "Error: ${snapshot.error}",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          "No movies found.",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      );
                    } else {
                      final mysteryMovies = snapshot.data!;
                      return GridView.builder(
                        itemCount: mysteryMovies.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 columns
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.60, // taller cards
                        ),
                        itemBuilder: ((context, index) {
                          final mysteryMovie = mysteryMovies[index];
                          final mysteryMovieTitle =
                              mysteryMovie['title'] ?? 'No Title';
                          final mysteryMovieImage =
                              mysteryMovie['posterURL'] ?? '';
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MysteryMoviesDetailScreen(
                                    title: mysteryMovie['title'] ?? 'No Title',
                                    posterURL: mysteryMovie['posterURL'] ?? '',
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: movieScaffoldBackground,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        movieSubHeadingColor.withOpacity(0.4),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Hero(
                                      tag: mysteryMovieImage,
                                      child: Image.network(
                                        mysteryMovieImage,
                                        width: double.infinity,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Container(
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
                                  SizedBox(height: 4),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          mysteryMovieTitle,
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: movieHeadingColor,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star_rate_rounded,
                                              color: movieIconColor,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '3.8',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
