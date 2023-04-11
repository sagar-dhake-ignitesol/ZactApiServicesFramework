//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

public struct ZactMiles: Codable {
    
    public static let DEFAULT_MILEAGE_RATE: Double = 0.58
    
    public var distance: ZactDistance?
    public var rate: ZactBaseAmount?
    public var nonBizMiles: Double?
    
    enum CodingKeys: String, CodingKey {
        case distance = "distance"
        case rate = "rate"
        case nonBizMiles = "nonBizMiles"
    }
    
    init(){
        distance = ZactDistance()
        rate = ZactBaseAmount(value: ZactMiles.DEFAULT_MILEAGE_RATE)
        distance?.unit = ""
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        distance = try values.decodeIfPresent(ZactDistance.self, forKey: .distance)
        rate = try values.decodeIfPresent(ZactBaseAmount.self, forKey: .rate)
        nonBizMiles = try values.decodeIfPresent(Double.self, forKey: .nonBizMiles)
    }
}

extension ZactMiles: Equatable {
    public static func == (lhs: ZactMiles, rhs: ZactMiles) -> Bool {
        return lhs.distance == rhs.distance
        && lhs.rate == rhs.rate
    }
}
