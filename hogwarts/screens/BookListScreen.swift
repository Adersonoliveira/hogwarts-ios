//
//  BookListScreen.swift
//  hogwarts
//
//  Created by Suyash Vashishtha on 25/08/23.
//

import SwiftUI

struct BookListScreen: View {
    
    
    @State private var books : [Book] = []
    
    private func fetchBooks() {
            guard let url = URL(string: "https://potterhead-api.vercel.app/api/books") else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodeBooks = try JSONDecoder().decode([Book].self, from: data)

                        DispatchQueue.main.async {
                            books = decodeBooks
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
                            Text(book.title)
                                .foregroundColor(.red)
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
                Text("Books")
            },
            
            label:{
                ZStack{
                    AsyncImage(url: URL(string: book.cover)) { phase in
                        switch phase {
                        case .empty:
                            Color.gray.frame(width: 20,height: 20)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:220,height: 220)
                                .padding(10)
                                .cornerRadius(10)
                        case .failure:
                            Color.red
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

struct BookListScreen_Previews: PreviewProvider {
    static var previews: some View {
        BookListScreen()
    }
}
