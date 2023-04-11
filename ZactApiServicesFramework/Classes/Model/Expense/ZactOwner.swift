//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

public struct ZactOwner : Codable, ZactUserProtocol {
    public var picture: String?
    public let uuid : String?
    public let firstName : String?
    public let lastName : String?
    public let email : String?
    public let active: Bool?
    public let setupComplete: Bool?
    public let roles : [String]?

    enum CodingKeys: String, CodingKey {

        case uuid = "uuid"
        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
        case picture = "picture"
        case active = "active"
        case setupComplete = "setupComplete"
        case roles = "roles"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        setupComplete = try values.decodeIfPresent(Bool.self, forKey: .setupComplete)
        roles = try values.decodeIfPresent([String].self, forKey: .roles)
    }
}

protocol ZactUserProtocol {
    var firstName : String? { get }
    var lastName : String? { get }
    var email : String? { get }
    var picture : String? { get }
}

extension ZactUserProtocol {
    public var fullname : String? {
        var name = ""
        if let firstName = firstName {
            name = firstName
        }
        if let lastName = lastName {
            name = name  + " " + lastName
        }
        return name
    }
}
