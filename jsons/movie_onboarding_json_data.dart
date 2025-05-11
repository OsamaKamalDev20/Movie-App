class MovieOnBoardingScreen {
  String image;
  String title;
  String description;

  MovieOnBoardingScreen({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<MovieOnBoardingScreen> movies = [
  MovieOnBoardingScreen(
    image: "assets/movie/movie-onboarding-1.jpg",
    title: "Stream Unlimited Movies",
    description:
        "Discover the latest blockbusters and timeless classics. All in one place",
  ),
  MovieOnBoardingScreen(
    image: "assets/movie/movie-onboarding-2.jpg",
    title: "Enjoy Seamless Experience",
    description:
        "Dark theme, powerful search, and personalized recommendations await you.",
  ),
  MovieOnBoardingScreen(
    image: "assets/movie/movie-onboarding-3.jpg",
    title: "Add to Your WatchList",
    description: "Save your favorite movies and watch anytime, anywhere!",
  ),
];
