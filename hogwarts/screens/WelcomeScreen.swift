//
//  WelcomeScreen.swift
//  hogwarts
//
//  Created by Suyash Vashishtha on 23/08/23.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        
        ZStack{
            Image("bg")
                .resizable()
                .frame(width: .infinity,height: .infinity,alignment: .center)
            
            VStack {
                Image("logoNoBg")
                    .resizable()
                    .frame(width: 270,height: 250,alignment: .center)
                    .padding()
                
                Text("Welcome to")
                    .foregroundColor(.white)
            
                Text("Hogwarts")
                    .foregroundColor(.white)
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
                            .background(Color.purple)
                            .cornerRadius(8)
                            
                    }
                )
                
            }
            .frame(alignment: .bottom)
            .padding(.top,200)
            
        }
       
    
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
