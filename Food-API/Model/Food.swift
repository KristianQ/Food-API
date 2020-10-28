//
//  Food.swift
//  Food-API
//
//  Created by Emiliano Qaqi on 10/27/20.
//

import Foundation

struct Food : Codable, Identifiable, Hashable {
    var id: Int?
    let title : String?
    let url : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case url = "url"
    }
}
