//
//  AboutScreen.swift
//  hogwarts
//
//  Created by Suyash Vashishtha on 23/08/23.
//

import SwiftUI

struct AboutScreen: View {
    var body: some View {
        VStack(alignment: .center){
            
            Image("iconLogo")
                .resizable()
                .frame(width: 100,height: 100,alignment: .center)
            
            Text("Hogwarts !")
                .font(.title)
                .foregroundColor(.purple)
                .fontWeight(.bold)
                .padding(.bottom,20)
  
            Text("One Stop Harry Potter Database.")
                .foregroundColor(.black)
                .font(.system(size: 20))
                .padding(.bottom,5)
            

            Text("From Character to Book, from Spells to Movies. We have everything you need !")
                .foregroundColor(.gray)
            
            Text("Made with ❤️")
                .foregroundColor(Color.gray)
                .padding(.top,40)
            Text("Suyash Vashishtha")
                .font(.system(.headline))
                .foregroundColor(Color.purple)
            
            
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity, alignment:.center)
            .padding(20)
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
