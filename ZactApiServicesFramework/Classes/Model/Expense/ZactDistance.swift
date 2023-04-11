//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

public struct ZactDistance: Codable {
    public var begLocation: String?
    public var endLocation: String?
    public var value: Double? = 0
    public var unit: String?
    
    enum CodingKeys: String, CodingKey {
        case begLocation = "begLocation"
        case endLocation = "endLocation"
        case value = "value"
        case unit = "unit"
    }
    
    public init(){
        unit = "MILES"
        value = 0
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        begLocation = try values.decodeIfPresent(String.self, forKey: .begLocation)
        endLocation = try values.decodeIfPresent(String.self, forKey: .endLocation)
        value = try values.decodeIfPresent(Double.self, forKey: .value)
        unit = try values.decodeIfPresent(String.self, forKey: .unit)
    }
}

extension ZactDistance: Equatable {
    public static func == (lhs: ZactDistance, rhs: ZactDistance) -> Bool {
        return lhs.begLocation ?? "" == rhs.begLocation ?? ""
            && lhs.endLocation ?? "" == rhs.endLocation ?? ""
            && lhs.value?.roundToPlaces() == rhs.value?.roundToPlaces()
    }
}
