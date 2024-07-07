//
//  movie.swift
//  capstoneFin
//
//  Created by Niraj Dhakal on 4/18/24.
//

import Foundation

struct MovieFeed: Decodable {
    let results: [movie]
}

struct movie: Decodable{
    let title: String
        let overview: String
        let posterPath: String?
        let backdropPath: String?
        let voteAverage: Double?
        let releaseDate: String?
        let id: Int
        let genreIDs: [Int]

        enum CodingKeys: String, CodingKey {
            case title, overview, id, genreIDs = "genre_ids"
            case posterPath = "poster_path"
            case backdropPath = "backdrop_path"
            case releaseDate = "release_date"
            case voteAverage = "vote_average"
        }
}
