//
//  MovieInfoScreen.swift
//  hogwarts
//
//  Created by Suyash Vashishtha on 24/08/23.
//

import SwiftUI

struct MovieInfoScreen: View {
    
    let movie : Movie;
    
    var body: some View {
        ScrollView() {
            ZStack {
                
                Color.black // Background color
                            
            Image("hogwartsBg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                
                Color.black.opacity(0.7) // Semi-transparent black ov
                
                HStack(alignment: .top){
                    AsyncImage(url: URL(string: movie.poster)) { phase in
                        switch phase {
                        case .empty:
                            Color.gray.frame(width: 20, height: 20)
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

                            Text(movie.title)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            
                            Text("Release Date")
                                .font(.system(size: 14))

                                .fontWeight(.bold)
                                .padding(.top,1)
                                .foregroundColor(.purple)
                                .frame(width: 120,alignment: .leading)
                            
                            Text(movie.release_date)
                                .foregroundColor(.white)
                            
                            Text("Run Time")
                                .font(.system(size: 14))

                                .fontWeight(.bold)
                                .padding(.top,1)
                                .foregroundColor(.purple)
                                .frame(width: 120,alignment: .leading)
                            
                            Text(movie.running_time)
                                .foregroundColor(.white)
                        }.padding()
                        

                }.frame(alignment: .leading)


              
            }.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                
            MovieDetailTab(heading: "Trailer", value: "")
    
                Link("Tap To Play", destination: URL(string: movie.trailer)!)
                           .buttonStyle(LinkButtonStyle())
            
            MovieDetailTab(heading: "Summary", value: movie.summary)
 
            VStack(alignment: .leading){
                Text("Directors")
                    .font(.system(size: 18))
                    .fontDesign(.default)
                    .fontWeight(.bold)
                    .padding(.top)
                    .foregroundColor(.purple)
                    .frame(width: 120,alignment: .leading)
                
                if(movie.directors.count>0){
                    ForEach(movie.directors, id: \.self)
                    { text in Text(text) }
                }
            }
                
            VStack(alignment: .leading){
                Text("Screen Writers")
                    .font(.system(size: 18))
                    .fontDesign(.default)
                    .fontWeight(.bold)
                    .padding(.top)
                    .foregroundColor(.purple)
                    .frame(alignment: .leading)
                
                if(movie.screenwriters.count>0){
                    ForEach(movie.screenwriters, id: \.self)
                    { text in Text(text) }
                }
            }
                
            VStack(alignment: .leading){
                Text("Producers")
                    .font(.system(size: 18))
                    .fontDesign(.default)
                    .fontWeight(.bold)
                    .padding(.top)
                    .foregroundColor(.purple)
                    .frame(alignment: .leading)
                
                if(movie.producers.count>0){
                    ForEach(movie.producers, id: \.self)
                    { text in Text(text).padding(.bottom,1) }
                }
            }
                
            VStack(alignment: .leading){
                Text("Distributors")
                    .font(.system(size: 18))
                    .fontDesign(.default)
                    .fontWeight(.bold)
                    .padding(.top)
                    .foregroundColor(.purple)
                    .frame(alignment: .leading)
                
                if(movie.distributors.count>0){
                    ForEach(movie.distributors, id: \.self)
                    { text in Text(text) }
                }
            }
                
            VStack(alignment: .leading){
                Text("Distributors")
                    .font(.system(size: 18))
                    .fontDesign(.default)
                    .fontWeight(.bold)
                    .padding(.top)
                    .foregroundColor(.purple)
                    .frame(alignment: .leading)
                
                if(movie.distributors.count>0){
                    ForEach(movie.distributors, id: \.self)
                    { text in Text(text) }
                }
            }


               
                
                
           
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal ,20)

        }
        .frame(maxHeight: .infinity)
        .navigationTitle(movie.title)
       
    }
}

struct MovieDetailTab : View{
    let heading: String
    let value: String;
    
    var body : some View{
        VStack(alignment: .leading){
            Text(heading)
                .font(.system(size: 18))
                .fontDesign(.default)
                .fontWeight(.bold)
                .padding(.top)
                .foregroundColor(.purple)
                .frame(width: 120,alignment: .leading)
            Text(value)

            
        }

    }
}

struct LinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body)
            .padding(10)
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(5)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

struct MovieInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieInfoScreen(
            movie: Movie(
                serial: "1",
                title: "Harry Potter and the Philosopher's Stone",
                summary: "Harry Potter’s dull life is completely changed on his eleventh birthday when a mysterious letter addressed to him arrives in the mail. After finding out about his real parents and a whole hidden wizarding world, he goes on to Hogwarts, his new magical school. From battling a troll to flying on broomsticks to catch golden snitches, Harry’s new life promises to be full of joy and adventure, until he finds out about a certain Dark Lord who murdered his parents is trying to regain power. With his friends Hermione and Ron, Harry sets out to find the philosopher’s stone before Voldemort to prevent his return. After advancing through a particularly difficult set of traps designed by the school, Harry faces the Dark Lord and manages to keep the Philosopher’s Stone safe.",
                directors: ["Chris Columbus"],
                screenwriters: ["Chris Columbus"],
                producers: [
                    "Chris Columbus",
                    "David Heyman",
                    "David Heyman",
                ],
                cinematographers: [
                    "David Heyman",
],
                editors: ["David Heyman",
],
                distributors: ["David Heyman",
],
                music_composers: ["David Heyman",
],
                release_date: "4 November 2001",
                running_time: "152 minutes",
                budget:"$125 million",
                box_office: "$1.018 million",
                rating: "PG",
                trailer: "https://www.youtube.com/watch?v=PbdM1db3JbY",
                poster: "https://www.wizardingworld.com/images/products/films/rectangle-1.png",
                wiki:"https://harrypotter.fandom.com/wiki/Harry_Potter_and_the_Philosopher's_Stone_(film)")
        )
    }
}
