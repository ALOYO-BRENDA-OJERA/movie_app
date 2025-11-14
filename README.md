Overview

A simple and elegant Flutter application that fetches and displays movie information using The Movie Database (TMDB) API.
This app does not play movies — it only shows details such as posters, descriptions, ratings, release dates, and more.

Features

Browse popular, trending, and top-rated movies

View detailed movie information (overview, rating, release date, genres)

High-quality poster and backdrop images

Clean and responsive Flutter UI

Fast API calls using TMDB

Tech Stack

Flutter (Dart)

TMDB API

HTTP package for network requests

Setup Instructions
1. Clone the repository
git clone ttps://github.com/ALOYO-BRENDA-OJERA/movie_app)
cd flutter-movie-app

2. Install dependencies
flutter pub get

3. Add your TMDB API key

Create a .env file (or use your preferred method) and add:

TMDB_API_KEY=your_api_key_here

4. Run the app
flutter run

API Key Notice

This project uses The Movie Database (TMDB) API.
You must create your own API key from:
https://www.themoviedb.org/

TMDB does not allow streaming movies.
This app only displays publicly available metadata.

License

This project is for educational and personal use.
TMDB branding and data belong to The Movie Database.
