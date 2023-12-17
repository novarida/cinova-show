import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projekweb/Model/model.dart';
import 'package:projekweb/Model/movieairing_api.dart';
import 'package:projekweb/View/detailpage2.dart';

class AiringMovie extends StatelessWidget {
  final MovieApi? movie;

  const AiringMovie({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple[300],
        title: Text(
          'Airing Movies',
          style: GoogleFonts.poppins(
            fontSize: 25
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: 800,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurple[50],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: FutureBuilder<List<MovieApi>>(
          future: MoviePopular().getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('No movies available.'),
              );
            } else {
              List<MovieApi> movies = snapshot.data!;
              return _buildMovieListView(context, movies);
            }
          },
        ),
      ),
    );
  }

  Widget _buildMovieListView(BuildContext context, List<MovieApi> movies) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return _movieCardApi(context, movies[index]);
      },
    );
  }

  Widget _movieCardApi(BuildContext context, MovieApi movie) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(movie: movie),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${movie.poster_path}',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 5),
                      child: Text(
                        movie.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 6, right: 6, bottom: 5),
                        child: Text(
                          '⭐${movie.vote_average}/10',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
