//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

public struct ZactRefundDistribution : Codable {
    public var costCenter : ZactCostCenterEntity?
    public var project : ZactProjectEntity?
    public var percentage : Double?
    public var expenseType: ZactExpenseType?
    public var amount: Double?
    public var projectCode: ZactProjectEntity?
    public var receivable: Bool = false
    public var refund: ZactBaseAmount?
    public var reclaimedNonBizAmt: ZactBaseAmount?

    enum CodingKeys: String, CodingKey {

        case costCenter = "costCenter"
        case project = "project"
        case percentage = "percentage"
        case expenseType = "expenseType"
        case amount = "amount"
        case projectCode = "projectCode"
        case receivable = "receivable"
        case refund = "refund"
        case reclaimedNonBizAmt = "reclaimedNonBizAmt"
    }
    
    public init(){
        
    }

    public init(costCenter: ZactCostCenterEntity, project: ZactProjectEntity, percentage: Double = 100) {
        self.costCenter = costCenter
        self.project = project
        self.percentage = percentage
    }
    
    public init(amount: Double, expenseType: ZactExpenseType) {
        self.amount = amount
        self.expenseType = expenseType
    }
    
    public init(amount: Double) {
        self.amount = amount
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        costCenter = try values.decodeIfPresent(ZactCostCenterEntity.self, forKey: .costCenter)
        project = try values.decodeIfPresent(ZactProjectEntity.self, forKey: .project)
        percentage = try values.decodeIfPresent(Double.self, forKey: .percentage)
        expenseType = try values.decodeIfPresent(ZactExpenseType.self, forKey: .expenseType)
        amount = try values.decodeIfPresent(Double.self, forKey: .amount)
        projectCode = try values.decodeIfPresent(ZactProjectEntity.self, forKey: .projectCode)
        receivable = try values.decodeIfPresent(Bool.self, forKey: .receivable) ?? false
        refund = try values.decodeIfPresent(ZactBaseAmount.self, forKey: .refund)
        reclaimedNonBizAmt = try values.decodeIfPresent(ZactBaseAmount.self, forKey: .reclaimedNonBizAmt)
    }
}
