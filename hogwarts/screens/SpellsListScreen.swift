//
//  SpellsListScreen.swift
//  hogwarts
//
//  Created by Suyash Vashishtha on 23/08/23.
//

import SwiftUI
import Combine

struct SheetView: View {
    var spell: Spell
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Spell Info")
                .font(.title)
                .foregroundColor(.purple)
                .fontWeight(.bold)
                .padding(.bottom,20)
  
            Text(spell.name)
                .foregroundColor(.black)
                .font(.system(size: 20))
                .padding(.bottom,5)
            

            Text(spell.description)
                .foregroundColor(.gray)
        }.frame(maxWidth: .infinity,maxHeight: .infinity, alignment:.topLeading)
            .padding(20)
        
       
    }
}

struct SpellsListScreen: View {
    
    @State private var spells: [Spell] = []

    
    private func fetchSpells() {
            guard let url = URL(string: "https://potterhead-api.vercel.app/api/spells") else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedSpells = try JSONDecoder().decode([Spell].self, from: data)

                        DispatchQueue.main.async {
                            spells = decodedSpells
                        }
                        print(spells)
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
                    ForEach (spells) { spell in
                        SpellCard(
                            name: spell.name,
                            id: spell.id,
                            image: "spell",
                            spell: spell
                        )
                           
                    }
                })
            .onAppear{
                fetchSpells()
            }
            .padding(15)
            .navigationTitle("Spells")
        }
        .frame(maxHeight: .infinity)
    }
}

struct SpellCard : View{
    
    @State private var isShowingSheet = false
    
    let name : String;
    let id: String;
    let image: String;
    let spell : Spell
    
    var body: some View{
        VStack(alignment: .center){
                    
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width:90,height: 90)
                        .padding(.top,10)
                    Text(name)
                        .foregroundColor(Color.purple)
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .fontDesign(.default)
                        .padding(.top)
                        .frame(width: 120)
                        
                

                }
                .onTapGesture {
                    isShowingSheet = true
                }
                .sheet(isPresented: $isShowingSheet) {
                    SheetView(spell:spell)
                        .presentationDetents([.medium])
                        }
                .frame(width: 150,height: 180)
                .background(Color.white)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: Color(white: 0.9), radius: 5, x: 0, y: 2)
                .padding(.top, 20)
            }
}




struct SpellsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        SpellsListScreen()
    }
}
