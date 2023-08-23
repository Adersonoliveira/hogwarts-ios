//
//  MenuScreen.swift
//  hogwarts
//
//  Created by Suyash Vashishtha on 23/08/23.
//

import SwiftUI

struct Option: Identifiable {
     let id = UUID()
     var name: String
     var image: String
    var screenRef: String
 }

var menuOptions = [
    Option(name: "Characters", image:"charLogo",screenRef:"char"),
    Option(name: "Houses", image: "houseLogo",screenRef:"houses"),
    Option(name: "Spells", image: "spellLogo",screenRef:"spells"),
    Option(name: "Movies", image: "movieLogo",screenRef:"movies"),
    Option(name: "Books", image: "booksLogo",screenRef: "books"),
    Option(name: "About", image: "aboutLogo",screenRef: "about"),
]


struct MenuScreen: View {
    var body: some View {
        LazyVGrid(
           columns: [
               GridItem(.flexible()), GridItem(.flexible()),
           ],
           alignment: .center,
           spacing: 10,
           pinnedViews: [],
           content: {
               ForEach (menuOptions) { option in
                   OptionButton(
                    optionName: option.name,
                    optonScreen: option.screenRef,
                    optionImage: option.image
                )
               }
           })
        .padding(15)
        .navigationTitle("Choose Option")
    }
}

struct OptionButton : View{
    
    let optionName : String;
    let optonScreen: String;
    let optionImage: String;
    

    
    var body: some View{
        NavigationLink(
            destination:{
                if optonScreen == "char"{
                    CharacterListScreen()
                }else if optonScreen=="houses"{
                    HousesListScreen()
                }else if optonScreen == "spells"{
                    SpellsListScreen()
                }else if optonScreen == "movies"{
                    MoviesListScreen()
                }else if optonScreen == "books"{
                    BooksListScreen()
                }else if optonScreen == "about"{
                    AboutScreen()
                }else{
                    Text("Invalid Choice")
                }
                
            },
            label: {
                VStack{
                    
                    Image(optionImage)
                        .resizable()
                        .frame(width: 50,height: 50,alignment: .trailing)

                    Text(optionName)
                        .foregroundColor(Color.purple)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .fontDesign(.default)
                        .padding(.top,5)
                }
                .frame(width: 150,height: 150)
                .background(Color.white)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: Color(white: 0.9), radius: 5, x: 0, y: 2)
                .padding(.top, 20)
            }
        )
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
