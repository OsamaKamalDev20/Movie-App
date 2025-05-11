import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/Movie%20App/colors/movies_colors.dart';
import 'package:flutter_ui_designs/Movie%20App/screens/Family%20Movies/family-movies-details-screen.dart';
import 'package:flutter_ui_designs/Movie%20App/services/family_movies_services.dart';

class FamilyMoviesHomeScreen extends StatefulWidget {
  const FamilyMoviesHomeScreen({super.key});

  @override
  State<FamilyMoviesHomeScreen> createState() => _FamilyMoviesHomeScreenState();
}

class _FamilyMoviesHomeScreenState extends State<FamilyMoviesHomeScreen> {
  late Future<List<dynamic>> familyMoviesFuture;

  @override
  void initState() {
    super.initState();
    familyMoviesFuture = FamilyMoviesServices.fetchFamilyMovies();
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
                          "Watch your family movie here!",
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
                          hintText: "Search your Family Movies",
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
                    "Family Movies",
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
                  future: familyMoviesFuture,
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
                      final familyMovies = snapshot.data!;
                      return GridView.builder(
                        itemCount: familyMovies.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 columns
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.60, // taller cards
                        ),
                        itemBuilder: ((context, index) {
                          final familyMovie = familyMovies[index];
                          final familyMovieTitle =
                              familyMovie['title'] ?? 'No Title';
                          final familyMovieImage =
                              familyMovie['posterURL'] ?? '';
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FamilyMoviesDetailScreen(
                                    title: familyMovie['title'] ?? 'No Title',
                                    posterURL: familyMovie['posterURL'] ?? '',
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
                                      tag: familyMovieImage,
                                      child: Image.network(
                                        familyMovieImage,
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
                                          familyMovieTitle,
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
                                              '4.5',
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
