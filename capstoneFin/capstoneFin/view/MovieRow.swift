//
//  MovieRow.swift
//  capstoneFin
//
//  Created by Niraj Dhakal on 4/18/24.
//

import SwiftUI

struct MovieRow: View {
    
    var movie: movie

    var body: some View {
        HStack {
            // Movie poster
            if let posterPath = movie.posterPath, let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray.frame(width: 100, height: 150)
                }
                .frame(width: 100, height: 150)
                .cornerRadius(8)
            }


            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)

                Text(movie.overview)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .lineLimit(3)
            }
            .padding(.leading, 10)
        }
        .frame(height: 150)
    }
}


// MARK: - Preview for MovieRow
struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: movie(title: "Dune: Part Two",
                              overview: "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.",
                              posterPath: "/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg",
                              backdropPath: nil,
                              voteAverage: 8.303,
                              releaseDate: "2024-02-27",
                              id: 693134,
                              genreIDs: [878, 12]))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
