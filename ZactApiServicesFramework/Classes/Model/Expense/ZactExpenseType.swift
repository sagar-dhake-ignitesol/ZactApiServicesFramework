//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

public struct ZactExpenseType {
    public var uuid : String?
    public var displayName : String?
    public var questionnaireGroup: String?
    public var questionnaireGroupEnabled: Bool?
    public var category: ZactExpenseTypeCategory?
    public var isCategoryDefault: Bool?
    public var isEnabled: Bool?
    public var externalName: String?
    public var description: String?
    public var receivable: Bool?
    
    public init() {
        
    }
    
    public init(_ uuid: String?) {
        self.uuid = uuid
    }
}

extension ZactExpenseType: Codable {
    
    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case displayName = "displayName"
        case questionnaireGroup = "questionnaireGroup"
        case questionnaireGroupEnabled = "questionnaireGroupEnabled"
        case category = "category"
        case isCategoryDefault = "isCategoryDefault"
        case isEnabled = "isEnabled"
        case externalName = "externalName"
        case description = "description"
        case receivable = "receivable"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
        questionnaireGroup = try values.decodeIfPresent(String.self, forKey: .questionnaireGroup)
        questionnaireGroupEnabled = try values.decodeIfPresent(Bool.self, forKey: .questionnaireGroupEnabled)
        category = try values.decodeIfPresent(ZactExpenseTypeCategory.self, forKey: .category)
        isCategoryDefault = try values.decodeIfPresent(Bool.self, forKey: .isCategoryDefault)
        isEnabled = try values.decodeIfPresent(Bool.self, forKey: .isEnabled)
        externalName = try values.decodeIfPresent(String.self, forKey: .externalName)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        receivable = try values.decodeIfPresent(Bool.self, forKey: .receivable)
    }
}

extension ZactExpenseType: Equatable {
    public static func == (lhs: ZactExpenseType, rhs: ZactExpenseType) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
