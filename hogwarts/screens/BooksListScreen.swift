
import SwiftUI

struct BooksListScreen: View {
    
    @State private var books : [Book] = []
    
    private func fetchBooks() {
            guard let url = URL(string: "https://potterhead-api.vercel.app/api/books") else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedBooks = try JSONDecoder().decode([Book].self, from: data)

                        DispatchQueue.main.async {
                            books = decodedBooks
                        }
                       
                        print(books)
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
                        ForEach (books) { book in
                            BookTab(book: book)
                        }
                    })
                
                .padding(15)
          
        }
                .navigationTitle("Books")
                .onAppear{
                    fetchBooks()
                }
        .frame(maxHeight: .infinity)
    }
}

struct BookTab : View{
    let book : Book
    
    var body : some View{
        NavigationLink(
            destination:{
                BookInfoScreen(book:book)
            },
            
            label:{
                ZStack{
                    AsyncImage(url: URL(string: book.cover)) { phase in
                        switch phase {
                        case .empty:
                            Color.gray
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


struct BooksListScreen_Previews: PreviewProvider {
    static var previews: some View {
        BooksListScreen()
    }
}
