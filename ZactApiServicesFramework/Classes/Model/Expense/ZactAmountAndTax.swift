//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

protocol ZactAmountAndTaxProtocol {
    var base : Double? { get }
    var tax : Double? { get }
    var currencyCode : String? { get }
}

public struct ZactAmountAndTax: Codable, Equatable, ZactAmountAndTaxProtocol {
    public var base: Double?
    public var tax: Double?
    public var currencyCode: String?
    
    enum CodingKeys: String, CodingKey {
        case base = "base"
        case tax = "tax"
        case currencyCode = "currencyCode"
    }
    
    init(){
        base = 0
        tax = 0
        currencyCode = "USD"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        base = try values.decodeIfPresent(Double.self, forKey: .base)
        tax = try values.decodeIfPresent(Double.self, forKey: .tax)
        currencyCode = try values.decodeIfPresent(String.self, forKey: .currencyCode)
    }
    
    public static func == (lhs: ZactAmountAndTax, rhs: ZactAmountAndTax) -> Bool {
        return lhs.base == rhs.base
            && lhs.tax == rhs.tax
            && lhs.currencyCode == rhs.currencyCode
    }
}

extension ZactAmountAndTaxProtocol where Self : Codable {
    var stringRepresentation : String {
        return "$" + "" + base!.formatDecimal
    }
}
