import 'package:flutter/material.dart';
import 'package:projekweb/Model/model.dart';
import 'package:projekweb/Model/tvgenre_api.dart';
import 'package:projekweb/View/detailpage2.dart';

class TVGenre extends StatefulWidget {
  @override
  _MovieGenreState createState() => _MovieGenreState();
}

class _MovieGenreState extends State<TVGenre> {
  final MoviePopular _movieApi = MoviePopular();
  late Future<List<MovieApi>> _movies;

  @override
  void initState() {
    super.initState();
    _movies = _movieApi.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple[300],
        title: Text(
          "TV Series",
          style: TextStyle(
            fontSize: 23,
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
          future: _movies,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<MovieApi> movies = snapshot.data ?? [];

              return GridView.count(
                crossAxisCount: 2,
                children: movies.map((movie) {
                  return CustomCard(
                    title: movie.name,
                    backdropPath: movie.backdrop_path,
                    voteAverage: movie.vote_average,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(movie: movie),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.title,
    required this.backdropPath,
    required this.voteAverage,
    required this.onTap,
  });

  final String title;
  final String backdropPath;
  final double voteAverage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, 
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 110,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500$backdropPath"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '⭐$voteAverage /10',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
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
