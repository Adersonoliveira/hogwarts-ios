
import SwiftUI

struct BookInfoScreen: View {
    
    let book : Book;
    
    var body: some View {
        ScrollView() {
            ZStack {
                
                Color.black // Background color
                            
            Image("hogwartsBg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                
                Color.black.opacity(0.7) // Semi-transparent black ov
                
                HStack(alignment: .top){
                    AsyncImage(url: URL(string: book.cover)) { phase in
                        switch phase {
                        case .empty:
                            Color.black.frame(width: 20, height: 20)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width:120,height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.bottom,10)
                        case .failure:
                            Color.red.frame(width: 20, height: 20)
                        @unknown default:
                            Color.gray.frame(width: 20, height: 20)
                        }
                    }
                    

                        VStack(alignment: .leading){

                            Text(book.title)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            
                            if((book.release_date) != nil){
                                Text("Release Date")
                                    .font(.system(size: 14))

                                    .fontWeight(.bold)
                                    .padding(.top,1)
                                    .foregroundColor(.purple)
                                    .frame(width: 120,alignment: .leading)
                                
                                Text(book.release_date ?? "")
                                    .foregroundColor(.white)
                            }
                            
                            
                            
                            Text("Pages")
                                .font(.system(size: 14))

                                .fontWeight(.bold)
                                .padding(.top,1)
                                .foregroundColor(.purple)
                                .frame(width: 120,alignment: .leading)
                            
                            Text(book.pages)
                                .foregroundColor(.white)
                        }.padding()
                        

                }.frame(alignment: .leading)


              
            }.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                
            MovieDetailTab(heading: "Wiki", value: "")
    
                Link("Tap To Read", destination: URL(string: book.wiki)!)
                           .buttonStyle(LinkButtonStyle())
            
            MovieDetailTab(heading: "Summary", value: book.summary)
 
                MovieDetailTab(heading: "Dedication", value: book.dedication)
     

                
           
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal ,20)

        }
        .frame(maxHeight: .infinity)
        .navigationTitle(book.title)
       
    }
}




struct BookInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        BookInfoScreen(
            book : Book(
                serial: "1",
                title: "Harry Potter and the Philosopher's Stone",
                summary: "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!",
                release_date: "26 June 1997",
                dedication: "For Jessica, who loves stories, for Anne, who loved them too, and for Di, who heard this one first",
                pages: "223",
                cover: "https://www.wizardingworld.com/images/products/books/UK/rectangle-1.jpg",
                wiki: "https://harrypotter.fandom.com/wiki/Harry_Potter_and_the_Philosopher's_Stone")
        )
    }
}
