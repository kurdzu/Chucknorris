//
//  Joke.swift
//  lecture 17
//
//  Created by omari katamadze on 05.01.23.
//

import Foundation

struct Joke : Codable{
    let id : String?
    let text : String?
    
    enum CodingKeys: String, CodingKey {
           case id   = "id"
           case text  = "value"
       
       }
}
