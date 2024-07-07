//
//  MovieDetailView.swift
//  capstoneFin
//
//  Created by Niraj Dhakal on 4/18/24.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: movie
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
    
                if let posterPath = movie.posterPath, let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        Rectangle().fill(Color.gray.opacity(0.4))
                    }
                    .aspectRatio(contentMode: .fit)
                }

                VStack(alignment: .leading, spacing: 8) {
                
                    Text(movie.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    
                    HStack {
                        if let voteAverage = movie.voteAverage {
                            Text("Rating: \(String(format: "%.1f", voteAverage)) / 10")
                                .bold()
                        }
                        Spacer()
                        if let releaseDate = movie.releaseDate {
                            Text("Release Date: \(releaseDate)")
                        }
                    }
                    .font(.subheadline)

                    // Overview
                    Text("Overview")
                        .font(.headline)
                    Text(movie.overview)
                        .font(.body)
                    
                    // Genres (assuming you have genre names or similar mapping available)
                    // This could be a function call to resolve genre IDs to names
                    if !movie.genreIDs.isEmpty {
                        Text("Genres: \(resolveGenreNames(from: movie.genreIDs))")
                    }
                    Text("All copyright below to their respected owners. All rights reserved.")
                        .padding(.vertical)
                        .fontWeight(.heavy)
                        .underline()
                        
                    
                }
                .padding()
                .preferredColorScheme(isDarkMode ? .dark : .light) 
            }
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        
        
    }

    private func resolveGenreNames(from ids: [Int]) -> String {

        let genreDictionary = [28: "Action", 12: "Adventure", 878: "Sci-Fi", 16: "Animation"]
        let genreNames = ids.compactMap { genreDictionary[$0] }.joined(separator: ", ")
        return genreNames.isEmpty ? "No genres listed" : genreNames
    }
}

// Preview for MovieDetailView
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailView(movie: movie(title: "Dune: Part Two",
                                         overview: "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.",
                                         posterPath: "/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg",
                                         backdropPath: nil,
                                         voteAverage: 8.3,
                                         releaseDate: "2024-02-27",
                                         id: 693134,
                                         genreIDs: [878, 12]))
        }
    }
}


