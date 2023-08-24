//
//  Spell.swift
//  hogwarts
//
//  Created by Suyash Vashishtha on 24/08/23.
//

import Foundation


struct Spell :Identifiable, Decodable{
    let id : String
    let name : String
    let description : String
}
