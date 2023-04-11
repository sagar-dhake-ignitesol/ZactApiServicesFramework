//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

public struct ZactRefund : Codable {
    public var creditExpenseUid : String?
    public var refundedExpense : ZactRefundedExpense?
    public var refund : ZactBaseAmount?
    public var expenseType: ZactExpenseType?
    public var costCenter : ZactCostCenterEntity?
    public var projectCode : ZactProjectEntity?
    public var reclaimedNonBizAmt: ZactBaseAmount?
    public var isReceivable: Bool = false
    public var distributions: [ZactRefundDistribution]?
    
    enum CodingKeys: String, CodingKey {
        case creditExpenseUid = "creditExpenseUid"
        case refundedExpense = "refundedExpense"
        case refund = "refund"
        case reclaimedNonBizAmt = "reclaimedNonBizAmt"
        case expenseType = "expenseType"
        case costCenter = "costCenter"
        case projectCode = "projectCode"
        case isReceivable = "isReceivable"
        case distributions = "distributions"
    }
    
    init() {
        
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        creditExpenseUid = try values.decodeIfPresent(String.self, forKey: .creditExpenseUid)
        refundedExpense = try values.decodeIfPresent(ZactRefundedExpense.self, forKey: .refundedExpense)
        refund = try values.decodeIfPresent(ZactBaseAmount.self, forKey: .refund)
        reclaimedNonBizAmt = try values.decodeIfPresent(ZactBaseAmount.self, forKey: .reclaimedNonBizAmt)
        costCenter = try values.decodeIfPresent(ZactCostCenterEntity.self, forKey: .costCenter)
        projectCode = try values.decodeIfPresent(ZactProjectEntity.self, forKey: .projectCode)
        expenseType = try values.decodeIfPresent(ZactExpenseType.self, forKey: .expenseType)
        isReceivable = try values.decodeIfPresent(Bool.self, forKey: .isReceivable) ?? false
        distributions = try values.decodeIfPresent([ZactRefundDistribution].self, forKey: .distributions)
    }
    
    init(for expense: ZactExpenseInfo, transaction: ZactExpenseInfo, distribution: ZactDistribution) {
        creditExpenseUid = expense.uuid
        var rf = ZactRefundedExpense()
        rf.amount = transaction.amountAndTax
        rf.uid = transaction.uuid
        rf.vendor = transaction.vendor
        rf.externalId = transaction.customerExpenseId
        reclaimedNonBizAmt = transaction.nonBizExpenseAmount
        refundedExpense = rf
        costCenter = distribution.costCenter
        projectCode = distribution.projectCode
        expenseType = distribution.expenseType
        isReceivable = distribution.receivable
        distributions = []
    }
}

extension ZactRefund: Equatable {
    public static func == (lhs: ZactRefund, rhs: ZactRefund) -> Bool {
        return lhs.creditExpenseUid == rhs.creditExpenseUid
            && lhs.refund == rhs.refund
            && lhs.costCenter == rhs.costCenter
            && lhs.expenseType == rhs.expenseType
            && lhs.reclaimedNonBizAmt == rhs.reclaimedNonBizAmt
            && lhs.refundedExpense == rhs.refundedExpense
            && lhs.projectCode == rhs.projectCode
    }
}
