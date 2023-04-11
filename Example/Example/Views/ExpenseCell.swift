//
//  ExpenseCell.swift
// Zact Inc.
//
//  Created by Sanman on 31/07/18.
//  Copyright © 2018 
//

import UIKit
import SwiftUI
import ZactApiServicesFramework

class ExpenseCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblPlace: UILabel!
    @IBOutlet weak var lblExpenseType: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblCreatedBy: UILabel!
    @IBOutlet weak var creditTextLbl: UILabel!
    @IBOutlet weak var createdLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var createdByView: UIView!
    @IBOutlet weak var expenseCategoryLbl: UILabel!
    @IBOutlet weak var expenseCategoryImageView: UIImageView!
    @IBOutlet weak var expenseCategoryView: UIView!
  
    var expenseInfo : ZactExpenseInfo?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bgView.backgroundColor = .white
    }
  
    //MARK:- UI Setup
    func setupFor(expenseInfo: ZactExpenseInfo) {
        self.expenseInfo = expenseInfo
        
        var vendor = expenseInfo.vendor ?? ""
        if let expenseClass = expenseInfo.expenseClass {
            if vendor.isEmpty {
                vendor = "Unknown Vendor"
            }
            if expenseClass.lowercased() == "mileage" {
                vendor = "Mileage Expense"
            } else if expenseClass.lowercased() == "time" {
                vendor = "Time Expense"
            }
        }
        lblPlace.text = vendor
        
        self.lblExpenseType.text = expenseInfo.expenseType ?? "  "
        self.lblTotal.text = expenseInfo.getAmountString()
        self.lblDateTime.text = milliSecondsToDate(milliseconds: expenseInfo.date ?? 0)
        
        var name: String? = nil
        if (expenseInfo.txnSource == "manual") {
            if let owner = expenseInfo.owner, let firstName = owner.firstName, !firstName.isEmpty {
                name = firstName
            }
        }else{
            name = "System"
        }
        
        lblCreatedBy.text = name
    }
}
