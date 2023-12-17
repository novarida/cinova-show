class MovieApi {
  final String title;
  final String name;
  final String backdrop_path;
  final String overview;
  final String poster_path;
  final String release_date;
  final String first_air_date;
  final double vote_average;

  const MovieApi({
    required this.title,
    required this.name,
    required this.backdrop_path,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.first_air_date,
    required this.vote_average,
  });

  factory MovieApi.fromJson(Map<String, dynamic> json) {
    return MovieApi(
      title: json['title'] ?? '',
      name: json['name'] ?? '',
      backdrop_path: json['backdrop_path'] ?? '',
      overview: json['overview'] ?? '',
      poster_path: json['poster_path'] ?? '',
      release_date: json['release_date'] ?? '',
      first_air_date: json['first_air_date'] ?? '',
      vote_average: (json['vote_average'] ?? 0.0).toDouble(),
    );
  }
}


// class Movie {
//   final String imageAsset;
//   final String title;
//   final String subtitle;

//   Movie({required this.imageAsset, required this.title, required this.subtitle});
// }

