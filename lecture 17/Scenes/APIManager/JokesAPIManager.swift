//
//  JokesAPIManager.swift
//  lecture 17
//
//  Created by omari katamadze on 05.01.23.
//

import Foundation

enum CategoriesType: Int {
    case animal = 0
    case career
    case celebrity
    case dev
    case explicit
    case fashion
    
    var endPoint: String {
        switch self {
        case .animal:
            return "category=animal"
        case .career:
            return "category=career"
        case .celebrity:
            return "category=dev"
        case .dev:
            return "category=explicit"
        case .explicit:
            return "category=explicit"
        case .fashion:
            return "category=fashion"
        }
    }
}
