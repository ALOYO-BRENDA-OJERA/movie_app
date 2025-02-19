import 'package:flutter/material.dart';
import '../models/movies/latest.dart';
import '../services/movies/lastest_movie_service.dart';


class MovieList extends StatelessWidget {
  final MovieService movieService = MovieService();

  MovieList({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LatestMovie>>(
      future: movieService.getNowPlayingMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No movies available'));
        }

        return SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final movie = snapshot.data![index];
              return MovieCard(movie: movie);
            },
          ),
        );
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  final LatestMovie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              height: 180,
              width: 140,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 180,
                  width: 140,
                  child: Center(child: Icon(Icons.error)),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../models/movies/latest.dart';
// import '../services/movies/lastest_movie_service.dart';

// class MovieList extends StatelessWidget {
//   final MovieService movieService = MovieService();

//   MovieList({super.key, required String title});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<LatestMovie>>(
//       future: movieService.getNowPlayingMovies(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (snapshot.hasError) {
//           return Center(
//             child: Text(
//               'Error: ${snapshot.error}',
//               style: const TextStyle(color: Colors.red),
//             ),
//           );
//         }

//         if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No movies available'));
//         }

//         return SizedBox(
//           height: 250,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               final movie = snapshot.data![index];
//               return MovieCard(movie: movie);
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// class MovieCard extends StatelessWidget {
//   final LatestMovie movie;

//   const MovieCard({super.key, required this.movie});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 140,
//       margin: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8.0),
//             child: Image.network(
//               'https://image.tmdb.org/t/p/w500${movie.posterPath}',
//               height: 180,
//               width: 140,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return const SizedBox(
//                   height: 180,
//                   width: 140,
//                   child: Center(child: Icon(Icons.error)),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             movie.title,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

