import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../../drawer/drawer.dart';
import '../../model/genre_model.dart';
import '../category/category_screen.dart';
import '../category/category_view_model.dart';
import '../detail/movie_detail_screen.dart';
import '../person/person_screen.dart';
import '../transitions/transition.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late List<int> genre;
  List<Genre> genredetail = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var movieViewModel = Provider.of<MovieViewModel>(context, listen: false);
      await movieViewModel.getAllMovies(0, '');
    });
  }

  void getGenreMovieDetails(List<int> genre) {
    final allgenre = Provider.of<GenreViewModel>(context, listen: false).genres;

    if (genredetail.isEmpty) {
      for (var g in allgenre) {
        for (var r in genre) {
          if (g.id == r) {
            genredetail.add(g);
          }
        }
      }
    } else {
      genredetail.clear();
      for (var g in allgenre) {
        for (var r in genre) {
          if (g.id == r) {
            genredetail.add(g);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final movieViewModel = Provider.of<MovieViewModel>(context);
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        backgroundColor: Colors.grey[400],
        elevation: 0,
        title: Text(
          'Cinema'.toUpperCase(),
          style: Theme.of(context).textTheme.caption?.copyWith(
                color: Colors.black45,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: const CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/Logo.png'),
            ),
          ),
        ],
      ),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
          baseColor: Colors.grey[600]!,
          spawnOpacity: 0.4,
          opacityChangeRate: 0.25,
          minOpacity: 0.1,
          maxOpacity: 0.4,
          spawnMinSpeed: 10.0,
          spawnMaxSpeed: 70.0,
          spawnMinRadius: 10.0,
          spawnMaxRadius: 50,
          particleCount: 60,
        )),
        vsync: this,
        child: SingleChildScrollView(
          child: movieViewModel.movies.isNotEmpty
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CarouselSlider.builder(
                        itemCount: movieViewModel.movies.length,
                        itemBuilder: (context, index, _) {
                          final movie = movieViewModel.movies[index];
                          return GestureDetector(
                            onTap: () {
                              genre = movie.genre!;
                              getGenreMovieDetails(genre);
                              Navigator.push(
                                context,
                                Transition(
                                  widget: MovieDetailScreen(
                                      genre: genre,
                                      genredetail: genredetail,
                                      movie: movie),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                                    height: 500,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Image-not-available.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: Center(
                                    child: Text(
                                      movie.title!.toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        options: CarouselOptions(
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          pauseAutoPlayOnTouch: true,
                          viewportFraction: 0.8,
                          enlargeCenterPage: true,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CategoryScreen(),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: PersonScreen(),
                    )
                  ],
                )
              : movieViewModel.state == MovieViewState.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: 650,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Center(
                            child: Text('Please Check Your Connection!'),
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
