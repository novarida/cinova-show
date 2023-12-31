import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projekweb/Model/model.dart';

class DetailPage extends StatelessWidget {
  final MovieApi movie;

  DetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple[300],
        title: Text('Movie Detail'),
        centerTitle: true,
      ),
      body: Container(
        height: 800,
        padding: EdgeInsets.all(30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepPurple[50],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            Center(
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500${movie.backdrop_path}"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                movie.title,
                style: GoogleFonts.varelaRound(
                  fontSize: 30, 
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Text(
                'Release Date: ${movie.release_date}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.deepPurple[300],
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: Text(
                '⭐${movie.vote_average}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Movie Overview:',
              style: GoogleFonts.varelaRound(
                fontSize: 20, 
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 8),
            Text(
              movie.overview,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
