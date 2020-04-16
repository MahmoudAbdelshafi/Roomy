//
//  RoomsModel.swift
//  Roomy
//
//  Created by Mahmoud on 4/7/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation

struct RoomsModel: Codable {
    let id: Int
    let title, price, place: String
    let image: String?
    let purpleDescription: String?
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, title, price, place, image
        case purpleDescription = "description"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

typealias model = [RoomsModel]
