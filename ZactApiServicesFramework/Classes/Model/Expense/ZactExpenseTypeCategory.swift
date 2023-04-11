//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

public struct ZactExpenseTypeCategory {
    
    public let uuid : String?
    public let category : String?
    public let desc : String?
    
    init(_ uuid: String, category: String, desc: String){
        self.uuid = uuid
        self.category = category
        self.desc = desc
    }
}

extension ZactExpenseTypeCategory: Codable {
    
    enum CodingKeys: String, CodingKey {
        
        case uuid = "uuid"
        case category = "category"
        case desc = "desc"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        desc = try values.decodeIfPresent(String.self, forKey: .desc)
    }
}
