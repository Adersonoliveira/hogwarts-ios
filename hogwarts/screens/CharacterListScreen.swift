//
//  CharacterListScreen.swift
//  hogwarts
//
//  Created by Suyash Vashishtha on 23/08/23.
//

import SwiftUI
import Combine


struct CharacterListScreen: View {
    
    @State private var characters: [Character] = []

    private func fetchCharacters() {
            guard let url = URL(string: "https://potterhead-api.vercel.app/api/characters") else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedCharacters = try JSONDecoder().decode([Character].self, from: data)

                        DispatchQueue.main.async {
                            characters = decodedCharacters
                        }
                        print(characters)
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
                    ForEach (characters) { char in
                        CharacterCard(
                            name: char.name,
                            id: char.id,
                            image: char.image,
                            subText:char.ancestry,
                            character: char
                        )
                           
                    }
                })
            .onAppear{
                fetchCharacters()
            }
            .padding(15)
            .navigationTitle("Characters")
        }
        .frame(maxHeight: .infinity)
    }
       
}

struct CharacterCard : View{
    
    let name : String;
    let id: String;
    let image: String;
    let subText: String
    let character: Character
    
    
    var body: some View{
        NavigationLink(
            destination:{
                CharacterInfoScreen(characterName: name,character:character)
            },
            label: {
                VStack{
                    
                    AsyncImage(url: URL(string: image)) { phase in
                        switch phase {
                        case .empty:
                            Color.white.frame(width: 20, height: 20)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width:90,height: 90)
                                .padding(.top,10)
                        case .failure:
                            Color.red.frame(width:90,height: 90)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                        @unknown default:
                            Color.gray.frame(width:90,height: 90)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                        }
                    }

                    Text(name)
                        .foregroundColor(Color.purple)
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .fontDesign(.default)
                        .padding(.top)
                        .frame(width: 120)
                        .multilineTextAlignment(.center)
                    
                    Text(subText)
                        .foregroundColor(Color.gray)
                        .font(.system(size: 16))
                        .padding(.bottom)

                }
                .frame(width: 150,height: 180)
                .background(Color.white)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: Color(white: 0.9), radius: 5, x: 0, y: 2)
                .padding(.top, 20)
            }
        )
    }
}

struct CharacterListScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListScreen()
    }
}
