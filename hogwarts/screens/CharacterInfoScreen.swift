//
//  CharacterInfoScreen.swift
//  hogwarts
//
//  Created by Suyash Vashishtha on 24/08/23.
//

import SwiftUI
import Combine

struct CharacterInfoScreen: View {
    let characterName : String;
    
    @State var character: Character;

    private func fetchCharacter() {
            guard let url = URL(string: "https://potterhead-api.vercel.app/api/characters/\(characterName)") else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedCharacter = try JSONDecoder().decode(Character.self, from: data)

                        DispatchQueue.main.async {
                            character = decodedCharacter
                        }
                        
                        print(character)
                    } catch {
                        print("      ___       ")
                        print(error)
                    }
                }
            }.resume()
        }

    func yesOrNo(value: Bool) -> String {
        return value ? "Yes" : "No"
    }
    
    var body: some View {
        ScrollView() {
            ZStack {
                
                Color.black // Background color
                            
            Image("hogwartsBg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                
                Color.black.opacity(0.4) // Semi-transparent black ov

                AsyncImage(url: URL(string: character.image)) { phase in
                    switch phase {
                    case .empty:
                        Color.gray.frame(width: 20, height: 20)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:120,height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                            .overlay(
                                            RoundedRectangle(cornerRadius: 100)
                                                .stroke(Color.white, lineWidth: 3) // Add white border
                                        )

                            .padding(.bottom,10)
                    case .failure:
                        Color.red.frame(width: 20, height: 20)
                    @unknown default:
                        Color.gray.frame(width: 20, height: 20)
                    }
                }

              
            }.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                
               
                
                HStack{
                    CharacterDetailTab(heading: "Name", value: character.name)
                    
                    CharacterDetailTab(heading: "Species", value: character.species)
                }
               
                HStack{
                    CharacterDetailTab(heading: "Gender", value: character.gender)
                    
                    CharacterDetailTab(heading: "House", value: character.house)
                }
                
                
                HStack{
                    CharacterDetailTab(heading: "Date of Birth", value: character.dateOfBirth ?? "")
                    
                    CharacterDetailTab(heading: "Is Wizard", value: "\(character.wizard)" )
                }
                
                HStack{
                    CharacterDetailTab(heading: "Ancestry", value: character.ancestry )
                    
                    CharacterDetailTab(heading: "Patronus", value: character.patronus)
                }
                
                HStack{
                    CharacterDetailTab(heading: "Actor", value: character.actor )
                    
                    CharacterDetailTab(heading: "Is Hogwarts Student", value: yesOrNo(value: character.hogwartsStudent))
                }
                
                if !character.alternate_names.isEmpty {
                    HStack{
                        
                        CharacterDetailTab(heading: "Alt. Name", value: character.alternate_names[0] )
                        if (character.alternate_names.count == 2) {
                            CharacterDetailTab(heading: "", value: character.alternate_names[1] )
                        }
                        
                    }
                   
                }
                
               
               
                
                
           
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal ,20)

        }
        .frame(maxHeight: .infinity)
        .onAppear{
            fetchCharacter()
        }.navigationTitle(characterName)
       
    }
}

struct CharacterDetailTab : View{
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
        Spacer()

    }
}

struct CharacterInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoScreen(
            characterName:"",
            character: Character(
                id:"1213132",
                name:"Harry Potter",
                alternate_names:[
                    "The Boy Who Lived",
                    "The Chosen One"
                ],
                species:"human",
                gender:"male",
                house:"griffindor",
                dateOfBirth:"31-07-1980",
                yearOfBirth:1980,
                wizard:true,
                ancestry:"half-blood",
                eyeColour:"green",
                hairColour:"black",
                wand: Wand(
                    wood: "holly", core: "phoenix feather", length: 11
                ),
                patronus: "stag",
                hogwartsStudent: true,
                hogwartsStaff: false,
                actor:"Daniel Radcliffe",
                alternate_actors: [],
                alive: true,
                image: "https://ik.imagekit.io/hpapi/harry.jpg"
            )
        )
    }
}
