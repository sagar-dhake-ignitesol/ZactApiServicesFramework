//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation

public struct ZactAddress : Codable {
    
    public let uuid : String?
    public let street1 : String?
    public let street2 : String?
    public let city : String?
    public let state : String?
    public let country : String?
    public let zip : String?
    
    var stringRepresentation : String {
        var desc = street1 ?? ""
        if let street2 = street2 {
            desc = desc + " " + street2
        }
        
        if let city = city {
            desc = desc + " " + city
        }
        
        if let state = state {
            desc = desc + " " + state
        }
        
        if let zip = zip {
            desc = desc + " " + zip
        }
        
        if let country = country {
            desc = desc + " " + country
        }
        
        return desc
    }
    
    enum CodingKeys: String, CodingKey {
        
        case uuid = "uuid"
        case street1 = "street1"
        case street2 = "street2"
        case city = "city"
        case state = "state"
        case country = "country"
        case zip = "zip"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        street1 = try values.decodeIfPresent(String.self, forKey: .street1)
        street2 = try values.decodeIfPresent(String.self, forKey: .street2)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        zip = try values.decodeIfPresent(String.self, forKey: .zip)
    }
    
    public init(street1: String?, street2: String?, city: String?, state: String?, country: String?, zip: String? ) {
        self.street1 = street1
        self.street2 = street2
        self.city = city
        self.state = state
        self.country = country
        self.zip = zip
        self.uuid = nil
    }
}

extension ZactAddress: Equatable {
    public static func == (lhs: ZactAddress, rhs: ZactAddress) -> Bool {
        return lhs.uuid == rhs.uuid
            && lhs.street1 == rhs.street1
            && lhs.street2 == rhs.street2
            && lhs.city == rhs.city
            && lhs.state == rhs.state
            && lhs.zip == rhs.zip
    }
}
