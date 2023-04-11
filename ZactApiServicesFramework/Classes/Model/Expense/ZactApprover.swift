//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

public struct ZactApprover : Codable, ZactUserProtocol {
    
    public var picture: String?
    public let uuid : String?
    public let firstName : String?
    public let lastName : String?
    public let email : String?

    enum CodingKeys: String, CodingKey {

        case uuid = "uuid"
        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        email = try values.decodeIfPresent(String.self, forKey: .email)
    }
}
