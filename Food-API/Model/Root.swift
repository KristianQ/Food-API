//
//  Root.swift
//  Food-API
//
//  Created by Emiliano Qaqi on 10/27/20.
//

import Foundation

struct Root: Codable {
    let data: [Food]?
    
    private enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
