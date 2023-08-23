//
//  Character.swift
//  hogwarts
//
//  Created by Suyash Vashishtha on 24/08/23.
//

import Foundation


struct Wand : Decodable {
    let wood: String
    let core : String
    let length: Float?
}

struct Character : Decodable, Identifiable{
    let id : String
    let name: String
    let alternate_names : [ String]
    let species: String
    let gender: String
    let house: String
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool
    let ancestry: String
    let eyeColour: String
    let hairColour: String
    let wand: Wand
    let patronus: String
    let hogwartsStudent: Bool
    let hogwartsStaff: Bool
    let actor: String
    let alternate_actors: [String]
    let alive: Bool
    let image : String
}



