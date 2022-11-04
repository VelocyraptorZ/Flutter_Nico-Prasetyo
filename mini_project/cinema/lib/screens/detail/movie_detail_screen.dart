import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/movie_model.dart';
import '../../model/cast_list_model.dart';
import '../../model/genre_model.dart';
import '../../model/screenshot_model.dart';
import 'movie_detail_view_model.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  final List<int> genre;
  final List<Genre> genredetail;
  const MovieDetailScreen(
      {Key? key,
      required this.genre,
      required this.genredetail,
      required this.movie})
      : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MovieDetailScreen> {
  late int id;
  @override
  void initState() {
    super.initState();
    id = widget.movie.id!;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var moviedetailViewModel =
          Provider.of<MovieDetailViewModel>(context, listen: false);
      await moviedetailViewModel.getAllMovieDetails(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final moviedetailViewModel = Provider.of<MovieDetailViewModel>(context);
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          body: body(moviedetailViewModel),
        ));
  }

  Widget body(MovieDetailViewModel moviedetailViewModel) {
    final isLoading =
        moviedetailViewModel.state == MovieDetailViewState.loading;
    final isError = moviedetailViewModel.state == MovieDetailViewState.error;
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

    return _buildMovieDetail(moviedetailViewModel);
  }

  Widget _buildMovieDetail(MovieDetailViewModel moviedetailViewModel) {
    final movieDetail = moviedetailViewModel.moviedetails;
    return SingleChildScrollView(
      child: Stack(
        children: [
          ClipPath(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(190),
                bottomRight: Radius.circular(190),
              ),
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/original/${movieDetail?.backdropPath!}',
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/Image-not-available.png'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Container(
                padding: const EdgeInsets.only(top: 90),
                child: GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse(
                        'https://www.youtube.com/embed/${movieDetail?.trailerId}');
                    if (!await launchUrl(url)) {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.play_circle_outline,
                          color: Colors.red[600],
                          size: 65,
                        ),
                        Text(
                          movieDetail?.title!.toUpperCase() ?? '',
                          style: TextStyle(
                            color: Colors.red[600],
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Movie Overview'.toUpperCase(),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 50,
                      child: SingleChildScrollView(
                        child: Text(
                          movieDetail?.overview ?? '',
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Release Date'.toUpperCase(),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              movieDetail?.releaseDate ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: Colors.yellow[800],
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Run Time'.toUpperCase(),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              '${movieDetail?.runtime ?? ''} MIN',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: Colors.red[600],
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Budget'.toUpperCase(),
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              '\$ ${movieDetail?.budget ?? ''}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: Colors.green[800],
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Preview Movie'.toUpperCase(),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 145,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const VerticalDivider(
                          color: Colors.transparent,
                          width: 5,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            movieDetail?.movieImage?.backdrops?.length ?? 0,
                        itemBuilder: (context, index) {
                          Screenshot? image =
                              movieDetail?.movieImage!.backdrops![index];
                          return Card(
                            elevation: 3,
                            borderOnForeground: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                imageUrl:
                                    'https://image.tmdb.org/t/p/w500${image?.imagePath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Movie Genres'.toUpperCase(),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 55,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.genredetail.length,
                          separatorBuilder: (context, index) =>
                              const VerticalDivider(
                            color: Colors.transparent,
                            width: 5,
                          ),
                          itemBuilder: (context, index) {
                            // Genre? genre = movieDetail?.genres![index];
                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black45,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                  ),
                                  child: Text(
                                    widget.genredetail[index].name!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Text(
                      'Movie Casts'.toUpperCase(),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const VerticalDivider(
                          color: Colors.transparent,
                          width: 5,
                        ),
                        itemCount: movieDetail?.castList?.length ?? 0,
                        itemBuilder: (context, index) {
                          Cast? cast = movieDetail?.castList![index];
                          return Column(
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                elevation: 3,
                                child: ClipRRect(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/w200${cast?.profilePath}',
                                    imageBuilder: (context, imageBuilder) {
                                      return Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(100)),
                                          image: DecorationImage(
                                            image: imageBuilder,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                    placeholder: (context, url) =>
                                        const SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Image-not-available.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  cast?.name!.toUpperCase() ?? '',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  cast?.character!.toUpperCase() ?? '',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
