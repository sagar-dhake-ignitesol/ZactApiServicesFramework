//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation

public class ZactExpenseInfo : Codable {
    
    public var isSuccess = true
    
    //Response and request attributes
    public var uuid : String?
    public var state : String?
    public var prevState : String?
    public var expenseClass : String?
    public var miles: ZactMiles?
    public var amountAndTax: ZactAmountAndTax?
    public var date : Double?
    public var nonBizExpenseAmount: ZactBaseAmount?
    public var customerExpenseId: UInt64?
    public var refundedExpenses: [ZactRefund]?
    public var claimAmount: ZactClaimAmount?
    public var createdBy: ZactApprover?
    public var hourlyRate: Double? = 1
    public var totalHours: Double? = 0
    public var owner : ZactOwner?
    public var txnSource: String?
    public var approvalChain: [ZactApprovalItem]?
    public var approver : ZactApprover?
    public var vendor : String?
    public var merchantRating : ZactMerchantRating?
    public var requiredProperties : [ZactRequired]?
    public var allocation : ZactAllocation?
    public var expenseType : String?
    public var purpose : String?
    public var receipts: ZactExpenseReceipts?
    public var lineItems: [ZactExpenseItem]?
    public var attendees: [String]?
    public var allowedActions : [String]?
    public var attentionNeeded : Bool?
    public var pnr : String?
    public var requiredAttributes: [ZactRequiredAttributes]?
    public var _refundedExpenses: [ZactRefund]?
    public var isSettled : Bool?
    
    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case state = "state"
        case prevState = "prevState"
        case expenseClass = "expenseClass"
        case claimAmount = "claimAmount"
        case amountAndTax = "amountAndTax"
        case miles = "miles"
        case customerExpenseId = "customerExpenseId"
        case date = "date"
        case hourlyRate = "hourlyRate"
        case totalHours = "totalHours"
        case owner = "owner"
        case nonBizExpenseAmount = "nonBizExpenseAmount"
        case createdBy = "createdBy"
        case approver = "approver"
        case txnSource = "txnSource"
        case vendor = "vendor"
        case merchantRating = "merchantRating"
        case requiredProperties = "requiredProperties"
        case approvalChain = "approvalChain"
        case expenseType = "expenseType"
        case purpose = "purpose"
        case allocation = "allocation"
        case receipts = "receipts"
        case lineItems = "lineItems"
        case attendees = "attendees"
        case allowedActions = "allowedActions"
        case attentionNeeded = "attentionNeeded"
        case pnr = "pnr"
        case refundedExpenses = "refundedExpenses"
        case requiredAttributes = "requiredAttributes"
        case isSettled = "isSettled"
    }
    
    init(isSuccess: Bool){
        self.isSuccess = isSuccess
    }
    
    init(){
        state = "incomplete"
        txnSource = "manual"
        expenseClass = "expense"
        amountAndTax = ZactAmountAndTax()
        miles = ZactMiles()
        claimAmount = ZactClaimAmount()
        nonBizExpenseAmount = ZactBaseAmount()
        receipts = ZactExpenseReceipts()
        hourlyRate = 1
        date = (NSDate().timeIntervalSince1970 * 1000).roundToPlaces(toPlaces: 0)
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        prevState = try values.decodeIfPresent(String.self, forKey: .prevState)
        expenseClass = try values.decodeIfPresent(String.self, forKey: .expenseClass)
        miles = try values.decodeIfPresent(ZactMiles.self, forKey: .miles)
        nonBizExpenseAmount = try values.decodeIfPresent(ZactBaseAmount.self, forKey: .nonBizExpenseAmount)
        claimAmount = try values.decodeIfPresent(ZactClaimAmount.self, forKey: .claimAmount)
        amountAndTax = try values.decodeIfPresent(ZactAmountAndTax.self, forKey: .amountAndTax)
        date = try values.decodeIfPresent(Double.self, forKey: .date)
        createdBy = try values.decodeIfPresent(ZactApprover.self, forKey: .createdBy)
        customerExpenseId = try values.decodeIfPresent(UInt64.self, forKey: .customerExpenseId)
        owner = try values.decodeIfPresent(ZactOwner.self, forKey: .owner)
        approver = try values.decodeIfPresent(ZactApprover.self, forKey: .approver)
        txnSource = try values.decodeIfPresent(String.self, forKey: .txnSource)
        vendor = try values.decodeIfPresent(String.self, forKey: .vendor)
        merchantRating = try values.decodeIfPresent(ZactMerchantRating.self, forKey: .merchantRating)
        requiredProperties = try values.decodeIfPresent([ZactRequired].self, forKey: .requiredProperties)
        approvalChain = try values.decodeIfPresent([ZactApprovalItem].self, forKey: .approvalChain)
        allocation = try values.decodeIfPresent(ZactAllocation.self, forKey: .allocation)
        expenseType = try values.decodeIfPresent(String.self, forKey: .expenseType)
        purpose = try values.decodeIfPresent(String.self, forKey: .purpose)
        receipts = try values.decodeIfPresent(ZactExpenseReceipts.self, forKey: .receipts)
        lineItems = try values.decodeIfPresent([ZactExpenseItem].self, forKey: .lineItems)
        attendees = try values.decodeIfPresent([String].self, forKey: .attendees)
        allowedActions = try values.decodeIfPresent([String].self, forKey: .allowedActions)
        attentionNeeded = try values.decodeIfPresent(Bool.self, forKey: .attentionNeeded)
        pnr = try values.decodeIfPresent(String.self, forKey: .pnr)
        refundedExpenses = try values.decodeIfPresent([ZactRefund].self, forKey: .refundedExpenses)
        requiredAttributes = try values.decodeIfPresent([ZactRequiredAttributes].self, forKey: .requiredAttributes)
        isSettled = try values.decodeIfPresent(Bool.self, forKey: .isSettled)
    }
    
    func copy() -> ZactExpenseInfo {
        if let data = try? JSONEncoder().encode(self) //Serializing
        {
            do {
                let copy = try JSONDecoder().decode(ZactExpenseInfo.self, from: data)
                return copy
            } catch let error {
                print(error)
            }
        }
        return self
    }
    
    init(uuid: String?, date: Double?) {
        self.uuid = uuid
        self.date = date
    }
}

extension ZactExpenseInfo: Equatable {
    public static func == (lhs: ZactExpenseInfo, rhs: ZactExpenseInfo) -> Bool {
        var isExpenseTypeEqual: Bool = true
        var isVendorEqual: Bool = true
        
        if lhs.expenseClass == "expense" {
            isExpenseTypeEqual = lhs.expenseType?.lowercased() == rhs.expenseType?.lowercased()
            isVendorEqual = lhs.vendor == rhs.vendor
        }
        
        if let uuid = rhs.uuid, !uuid.isEmpty {  // this check is added for checking expense is new or not
            return lhs.uuid == rhs.uuid
                && lhs.nonBizExpenseAmount == rhs.nonBizExpenseAmount
                && lhs.expenseClass == rhs.expenseClass
                && lhs.amountAndTax == rhs.amountAndTax
                && lhs.date == rhs.date
                && lhs.miles == rhs.miles
                && isVendorEqual
                && lhs.customerExpenseId == rhs.customerExpenseId
                && lhs.allocation == rhs.allocation
                && isExpenseTypeEqual
                && lhs.purpose == rhs.purpose
                && lhs.receipts == rhs.receipts
                && lhs.attendees == rhs.attendees
                && lhs.refundedExpenses == rhs.refundedExpenses
        }else{
            return lhs.uuid == rhs.uuid
                && lhs.nonBizExpenseAmount == rhs.nonBizExpenseAmount
                && lhs.amountAndTax == rhs.amountAndTax
                && lhs.miles == rhs.miles
                && isVendorEqual
                && lhs.customerExpenseId == rhs.customerExpenseId
                && lhs.allocation == rhs.allocation
                && isExpenseTypeEqual
                && lhs.purpose == rhs.purpose
                && lhs.receipts == rhs.receipts
                && lhs.attendees == rhs.attendees
                && lhs.refundedExpenses == rhs.refundedExpenses
        }
        
        
    }
}

// Custom getters
extension ZactExpenseInfo {
    
    public func isManualTransaction() -> Bool {
        return txnSource == "manual"
    }
    
    public func isReturningExpense() -> Bool {
        if prevState?.lowercased() == "submitted" {
            return true
        }
        return false
    }
    
    public func shouldShowApprovalChain() -> Bool {
        let s = state?.lowercased()
        if prevState?.lowercased() == "submitted" || s == "submitted" || s == "approved" || s == "payprocessed" {
            return true
        }
        return false
    }
    
    public func getAmountString() -> String {
        return ("\(isCreditExpense() ? "-" : "")" + (amountAndTax?.stringRepresentation ?? "0"))
    }
    
    public func isCreditExpense() -> Bool {
        return expenseClass?.lowercased() == "credit"
    }
}
