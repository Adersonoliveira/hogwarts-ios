//
//  WelcomeScreen.swift
//  hogwarts
//
//  Created by Suyash Vashishtha on 23/08/23.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack {
            Image("sortingHat")
                .resizable()
                .frame(width: 200,height: 200,alignment: .center)
                .padding()
            
            Text("Welcome to")

        
            Text("Hogwarts")
                .font(.system(size: 30))
            
            NavigationLink(
                destination: MenuScreen(),
                label:{
                    Text("Contnue")
                        .frame(
                            width: 200,
                            height: 50,
                            alignment: .center
                        )
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                        
                }
            )
            
        }
        .padding()
    
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
