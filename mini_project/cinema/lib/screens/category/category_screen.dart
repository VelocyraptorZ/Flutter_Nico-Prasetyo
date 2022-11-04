import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/genre_model.dart';
import '../detail/movie_detail_screen.dart';
import '../home/home_view_model.dart';
import '../transitions/transition.dart';
import 'category_view_model.dart';

class CategoryScreen extends StatefulWidget {
  final int selectedGenre;

  const CategoryScreen({Key? key, this.selectedGenre = 28}) : super(key: key);

  @override
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> {
  List<int> genre = [];
  List<Genre> genredetail = [];
  late int selectedGenre;

  @override
  void initState() {
    super.initState();
    selectedGenre = widget.selectedGenre;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var genreViewModel = Provider.of<GenreViewModel>(context, listen: false);
      await genreViewModel.getAllGenres();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var movieViewModel = Provider.of<MovieViewModel>(context, listen: false);
      await movieViewModel.getAllMovies(selectedGenre, '');
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
    // print('list genre: ${genredetail[0].name}');
  }

  @override
  Widget build(BuildContext context) {
    final genreViewModel = Provider.of<GenreViewModel>(context);
    final movieViewModel = Provider.of<MovieViewModel>(context);
    return Column(
      children: [
        body(genreViewModel),
        bodyByGenre(movieViewModel),
      ],
    );
  }

  Widget body(GenreViewModel genreViewModel) {
    final isLoading = genreViewModel.state == GenreViewState.loading;
    final isError = genreViewModel.state == GenreViewState.error;
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (isError) {
      return const Center(
        child: Text('Please Check Your Connection'),
      );
    }

    return _buildGenre(genreViewModel);
  }

  Widget _buildGenre(GenreViewModel genreViewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 45,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const VerticalDivider(
              color: Colors.transparent,
              width: 5,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: genreViewModel.genres.length,
            itemBuilder: (context, index) {
              final genre = genreViewModel.genres[index];
              return Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        final genre = genreViewModel.genres[index];
                        selectedGenre = genre.id!;
                        context
                            .read<MovieViewModel>()
                            .getAllMovies(selectedGenre, '');
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black45,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                        color: (genre.id == selectedGenre)
                            ? Colors.black45
                            : Colors.white,
                      ),
                      child: Text(
                        genre.name!.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: (genre.id == selectedGenre)
                              ? Colors.white
                              : Colors.black45,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'New Movie By Category'.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget bodyByGenre(MovieViewModel movieViewModel) {
    final isLoading = movieViewModel.state == MovieViewState.loading;
    final isError = movieViewModel.state == MovieViewState.error;
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (isError) {
      return const Center(
        child: Text('Please Check Your Connection'),
      );
    }

    return _buildByGenre(movieViewModel);
  }

  Widget _buildByGenre(MovieViewModel movieViewModel) {
    return SizedBox(
      height: 290,
      child: ListView.separated(
        separatorBuilder: (context, index) => const VerticalDivider(
          color: Colors.transparent,
          width: 15,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: movieViewModel.moviesbygenre.length,
        itemBuilder: (context, index) {
          final movie = movieViewModel.moviesbygenre[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  genre = movie.genre!;
                  getGenreMovieDetails(genre);
                  Navigator.push(
                    context,
                    Transition(
                      widget: MovieDetailScreen(
                        movie: movie,
                        genre: genre,
                        genredetail: genredetail,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        width: 180,
                        height: 240,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    placeholder: (context, url) => const SizedBox(
                      width: 180,
                      height: 240,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: 180,
                      height: 240,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/Image-not-available.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 180,
                child: Text(
                  movie.title!.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 14,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 14,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 14,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 14,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 14,
                  ),
                  Text(
                    movie.voteAverage!,
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
