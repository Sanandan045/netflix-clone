import 'package:flutter/material.dart';
import 'package:netflixclone/models/tv_series_model.dart';
import 'package:netflixclone/models/upcoming_movie_model.dart';
import 'package:netflixclone/widgets/movie_card.dart';

import '../services/api_services.dart';
import '../widgets/custom_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices = ApiServices();

  late Future<UpcomingMovieModel> upcomingFuture;
  late Future<UpcomingMovieModel> nowPlayingFuture;
  late Future<TvSeriesModel> topRatedSeries;
  @override
  void initState() {
    upcomingFuture = apiServices.getUpcomingMovies();
    nowPlayingFuture = apiServices.getNowPlayingMovies();
    topRatedSeries = apiServices.getTopRatedSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          "assets/Vector (1).png",
          height: 80,
          width: 100,
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.person),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<TvSeriesModel>(
              future: topRatedSeries,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomCarouselSlider(data: snapshot.data!);
                }
                return const SizedBox();
              },
            ),
            SizedBox(
                height: 210,
                child: ClipRRect(
                  child: UpcomingMovieCard(
                    headline: "Now Playing ",
                    future: nowPlayingFuture,
                  ),
                )),
            SizedBox(
                height: 220,
                child: ClipRRect(
                  child: UpcomingMovieCard(
                    headline: "Upcoming Movies",
                    future: upcomingFuture,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
