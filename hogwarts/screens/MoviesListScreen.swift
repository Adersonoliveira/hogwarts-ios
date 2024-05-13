import SwiftUI

struct MoviesListScreen: View {
    
    @State private var movies: [Movie] = []
    
    
    private func fetchMovies() {
            guard let url = URL(string: "https://potterhead-api.vercel.app/api/movies") else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedMovies = try JSONDecoder().decode([Movie].self, from: data)

                        DispatchQueue.main.async {
                            movies = decodedMovies
                        }
                       
                        print(movies)
                    } catch {
   
                        print("      ___       ")
                        print(error)
                    }
                }
            }.resume()
        }
    
    var body: some View {
        
        ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()), GridItem(.flexible()),
                    ],
                    alignment: .center,
                    spacing: 10,
                    pinnedViews: [],
                    content: {
                        ForEach (movies) { movie in
                            MovieTab(movie: movie)
                        }
                    })
                
                .padding(15)
          
        }
                .navigationTitle("Movies")
                .onAppear{
                    fetchMovies()
                }
        .frame(maxHeight: .infinity)
    }
}

struct MovieTab : View{
    let movie : Movie
    
    var body : some View{
        NavigationLink(
            destination:{
                MovieInfoScreen(movie:movie)
            },
            
            label:{
                ZStack{
                    AsyncImage(url: URL(string: movie.poster)) { phase in
                        switch phase {
                        case .empty:
                            Color.white
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:220,height: 220)
                                .padding(10)
                                .cornerRadius(10)
                        case .failure:
                            Color.white
                                .aspectRatio(contentMode: .fit)
                                .frame(width:220,height: 220)
                                .padding(10)
                                .cornerRadius(10)
                        @unknown default:
                            Color.gray
                                .aspectRatio(contentMode: .fit)
                                .frame(width:220,height: 220)
                                .padding(10)
                                .cornerRadius(10)
                        }
                    }

                }
            }

        )

    }
}

struct MoviesListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListScreen()
    }
}
