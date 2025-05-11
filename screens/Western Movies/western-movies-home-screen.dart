import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/Movie%20App/colors/movies_colors.dart';
import 'package:flutter_ui_designs/Movie%20App/screens/Family%20Movies/family-movies-details-screen.dart';
import 'package:flutter_ui_designs/Movie%20App/services/western_movies_services.dart';

class WesternMoviesHomeScreen extends StatefulWidget {
  const WesternMoviesHomeScreen({super.key});

  @override
  State<WesternMoviesHomeScreen> createState() =>
      _WesternMoviesHomeScreenState();
}

class _WesternMoviesHomeScreenState extends State<WesternMoviesHomeScreen> {
  late Future<List<dynamic>> westernMoviesFuture;

  @override
  void initState() {
    super.initState();
    westernMoviesFuture = WesternMoviesServices.fetchWesternMovies();
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
          "Family Movies",
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
                          "Watch your western movie here!",
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
                          hintText: "Search your Western Movies",
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
                    "Western Movies",
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
                  future: westernMoviesFuture,
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
                      final westernMovies = snapshot.data!;
                      return GridView.builder(
                        itemCount: westernMovies.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 columns
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.60, // taller cards
                        ),
                        itemBuilder: ((context, index) {
                          final westernMovie = westernMovies[index];
                          final westernMovieTitle =
                              westernMovie['title'] ?? 'No Title';
                          final westernMovieImage =
                              westernMovie['posterURL'] ?? '';
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FamilyMoviesDetailScreen(
                                    title: westernMovie['title'] ?? 'No Title',
                                    posterURL: westernMovie['posterURL'] ?? '',
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
                                      tag: westernMovieImage,
                                      child: Image.network(
                                        westernMovieImage,
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
                                          westernMovieTitle,
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
                                              '3.9',
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
