//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

protocol ZactCurrencyProtocol {
    var value : Double? { get }
    var currencyCode : String? { get }
}

public struct ZactBaseAmount : Codable, Equatable, ZactCurrencyProtocol {
    public var value : Double?
    public var currencyCode : String?

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case currencyCode = "currencyCode"
    }

    public init(){
        value = 0
        currencyCode = "USD"
    }
    
    public init(value: Double){
        self.value = value
        currencyCode = "USD"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(Double.self, forKey: .value)
        currencyCode = try values.decodeIfPresent(String.self, forKey: .currencyCode)
    }
    
    public static func == (lhs: ZactBaseAmount, rhs: ZactBaseAmount) -> Bool {
        return lhs.value?.roundToPlaces() == rhs.value?.roundToPlaces()
            && lhs.currencyCode == rhs.currencyCode
    }
}

extension ZactCurrencyProtocol where Self : Codable {
    var stringRepresentation : String {
        return "$" + " " + value!.formatDecimal
    }
}
