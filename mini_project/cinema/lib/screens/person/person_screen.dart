import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'person_view_model.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var personViewModel =
          Provider.of<PersonViewModel>(context, listen: false);
      await personViewModel.getAllPerson();
    });
  }

  @override
  Widget build(BuildContext context) {
    final personViewModel = Provider.of<PersonViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trending Persons On This Week'.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        ),
        body(personViewModel)
      ],
    );
  }

  Widget body(PersonViewModel personViewModel) {
    final isLoading = personViewModel.state == PersonViewState.loading;
    final isError = personViewModel.state == PersonViewState.error;
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

    return _buildPerson(personViewModel);
  }

  Widget _buildPerson(PersonViewModel personViewModel) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const VerticalDivider(
          color: Colors.transparent,
          width: 5,
        ),
        itemCount: personViewModel.persons.length,
        itemBuilder: (context, index) {
          final person = personViewModel.persons[index];
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
                        'https://image.tmdb.org/t/p/w200${person.profilePath}',
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    placeholder: (context, url) => const SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/Image-not-available.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  person.name!.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 8,
                  ),
                ),
              ),
              Center(
                child: Text(
                  person.knownForDepartment!.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
