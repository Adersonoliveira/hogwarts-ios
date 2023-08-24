//
//  Book.swift
//  hogwarts
//
//  Created by Suyash Vashishtha on 25/08/23.
//

import Foundation


struct Book :Identifiable, Decodable{
    var id  : String { serial }
    let serial :String
    let title: String
    let summary: String
    let release_date : String?
    let dedication: String
    let pages : String
    let cover: String
    let wiki: String
}
