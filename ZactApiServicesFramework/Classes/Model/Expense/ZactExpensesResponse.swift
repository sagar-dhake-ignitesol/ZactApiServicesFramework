//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation

public struct ZactExpensesResponse : Codable {
    public let number : Int?
    public let size : Int?
    public let totalPages : Int?
    public let numberOfElements : Int?
    public let totalElements : Int?
    public let hasPrevious : Bool?
    public let hasNext : Bool?
    public let first : Bool?
    public let last : Bool?
    public let hasContent : Bool?
    public let content : [ZactExpenseInfo]?

    enum CodingKeys: String, CodingKey {

        case number = "number"
        case size = "size"
        case totalPages = "totalPages"
        case numberOfElements = "numberOfElements"
        case totalElements = "totalElements"
        case hasPrevious = "hasPrevious"
        case hasNext = "hasNext"
        case first = "first"
        case last = "last"
        case hasContent = "hasContent"
        case content = "content"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
        size = try values.decodeIfPresent(Int.self, forKey: .size)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        numberOfElements = try values.decodeIfPresent(Int.self, forKey: .numberOfElements)
        totalElements = try values.decodeIfPresent(Int.self, forKey: .totalElements)
        hasPrevious = try values.decodeIfPresent(Bool.self, forKey: .hasPrevious)
        hasNext = try values.decodeIfPresent(Bool.self, forKey: .hasNext)
        first = try values.decodeIfPresent(Bool.self, forKey: .first)
        last = try values.decodeIfPresent(Bool.self, forKey: .last)
        hasContent = try values.decodeIfPresent(Bool.self, forKey: .hasContent)
        content = try values.decodeIfPresent([ZactExpenseInfo].self, forKey: .content)
    }
}
