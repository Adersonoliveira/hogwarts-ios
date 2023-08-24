//
//  Movie.swift
//  hogwarts
//
//  Created by Suyash Vashishtha on 24/08/23.
//

import Foundation

struct Movie :Identifiable, Decodable{
    var id  : String {serial }
    let serial :String
    let title: String
    let summary: String
    let directors : [String]
    let screenwriters: [String]
    let producers : [String]
    let cinematographers: [String]
    let editors: [String]
    let distributors: [String]
    let music_composers: [String]
    let release_date: String
    let running_time: String
    let budget: String
    let box_office: String
    let rating: String
    let trailer: String
    let poster: String
    let wiki: String
}
