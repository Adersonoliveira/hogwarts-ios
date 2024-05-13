import SwiftUI

struct House: Identifiable {
     let id = UUID()
     var name: String
     var image: String
    var data: String
 }

var houseList = [
    House(name: "Gryffindor", image:"griff",data:"gryffindor"),
    House(name: "Slytherin", image: "slyth",data:"slytherin"),
    House(name: "Hufflepuff", image: "huff",data: "hufflepuff"),
    House(name: "Ravenclaw", image: "raven",data:"ravenclaw"),
]


struct HousesListScreen: View {
    var body: some View {
        LazyVGrid(
           columns: [
               GridItem(.flexible()), GridItem(.flexible()),
           ],
           alignment: .center,
           spacing: 10,
           pinnedViews: [],
           content: {
               ForEach (houseList) { house in
                   HouseTab(
                    name: house.name,
                    image: house.image,
                    data: house.data
                )
               }
           })
        .padding(15)
        .navigationTitle("Choose House")
    }
}


struct HouseTab : View{
    
    let name : String;
    let image: String;
    let data: String;
    

    
    var body: some View{
        NavigationLink(
            destination:{
                MemberListScreen(houseName: data)
            },
            label: {
                
                VStack{
                    Image(image)
                        .resizable()
                        .frame(width: 50,height: 50,alignment: .trailing)
                    
                    Text(name)
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

struct HousesListScreen_Previews: PreviewProvider {
    static var previews: some View {
        HousesListScreen()
    }
}
