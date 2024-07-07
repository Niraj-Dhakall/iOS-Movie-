//
//  MovieViews.swift
//  capstoneFin
//
//  Created by Niraj Dhakal on 4/18/24.
//

import SwiftUI

class MovieViewModel: ObservableObject {
    @Published var movies : [movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    

    init() {
        loadMovies()
    }

    func loadMovies() {
        isLoading = true
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=b1446bbf3b4c705c6d35e7c67f59c413&language=en-US&page=1"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = "load movies: \(error.localizedDescription)"
                    return
                }
                guard let data = data else {
                    self?.errorMessage = "no data"
                    return
                }
                if let decodedResponse = try? JSONDecoder().decode(MovieFeed.self, from: data) {
                    self?.movies = decodedResponse.results
                } else {
                    self?.errorMessage = "decode failed"
                }
            }
        }.resume()
    }
}

struct MovieViews: View {
    @StateObject var viewModel = MovieViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        NavigationView {
            List {
            
                    ForEach(viewModel.movies, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieRow(movie: movie)
                        
                    }
                }
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            }
            .navigationTitle("Movies")
            .navigationBarBackButtonHidden(true)
            
            .navigationBarItems(trailing: NavigationLink(destination: AccountView()) {
                
                            Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 36, height: 36)
                                    .padding(.horizontal,15)
                        })
                        
            
            
            
            }
        }
    
        
    }


// SwiftUI Preview
struct MovieViews_Previews: PreviewProvider {
    static var previews: some View {
        MovieViews()
    }
}
