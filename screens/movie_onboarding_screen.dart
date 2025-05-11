import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/Movie%20App/colors/movies_colors.dart';
import 'package:flutter_ui_designs/Movie%20App/jsons/movie_onboarding_json_data.dart';
import 'package:flutter_ui_designs/Movie%20App/screens/movies_categories.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  int currentIndex = 0;
  PageController _movieController = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    _movieController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _movieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: movieScaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _movieController,
                itemCount: movies.length,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = movies.length - 1 == index;
                  });
                },
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.1,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          height: 230,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              movies[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Text(
                          movies[index].title,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          movies[index].description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              child: isLastPage
                  ? _buildGetStarted()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _movieController.jumpToPage(movies.length - 1);
                          },
                          child: Text(
                            "Skip",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        SmoothPageIndicator(
                          controller: _movieController,
                          count: movies.length,
                          onDotClicked: (currentIndex) {
                            _movieController.animateToPage(
                              currentIndex,
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeIn,
                            );
                          },
                          effect: ExpandingDotsEffect(
                            spacing: 8.0,
                            radius: 10,
                            dotWidth: 14.0,
                            dotHeight: 14.0,
                            activeDotColor: movieButtonColor,
                            dotColor: movieButtonColor.withOpacity(.2),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _movieController.nextPage(
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text(
                            "Next",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGetStarted() {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * .9,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MoviesCategoriesScreen(),
            ),
          );
        },
        child: Text("Get Started"),
      ),
    );
  }
}
