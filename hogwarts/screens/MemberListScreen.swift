import SwiftUI
import Combine


struct MemberListScreen: View {
    
    let houseName : String;
    
    @State private var characters: [Character] = []

    private func fetchMembers() {
            guard let url = URL(string: "https://potterhead-api.vercel.app/api/houses/\(houseName)") else {
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
                fetchMembers()
            }
            .padding(15)
            .navigationTitle("Members")
        }
        .frame(maxHeight: .infinity)
    }
       
}



struct MemberListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MemberListScreen(
            houseName: "gryffindor"
        )
    }
}
