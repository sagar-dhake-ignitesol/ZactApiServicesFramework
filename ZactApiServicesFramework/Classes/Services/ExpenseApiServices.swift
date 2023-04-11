//
//  File.swift
//  
//
//  Created by Sagar Dhake on 30/03/23.
//

import Foundation
import Alamofire

public protocol ExpenseResponseDelegate: AnyObject {
    func currentList(expenses: [ZactExpenseInfo])
}

public typealias ExpenseListResponseCallback = ([ZactExpenseInfo]?, _ error: String?) -> ()

internal class ExpenseApiServices {
    func getExpensesForState(state : String, bearerToken: String, size: Int = 10, callback: @escaping ExpenseListResponseCallback) {
        var parameters: Parameters = ["page": 0, "size": size, "state" : state]
        if state == "pending"{
            let stateArray: [String] = ["incomplete", "notsubmitted"]
            parameters.updateValue(stateArray, forKey: "state")
        }
        
        print(parameters, state)
        let endpoint = "services/expenses"
                
        ZactApiServiceManager.get(endpoint: endpoint, bearerToken: bearerToken, parameters: parameters)
            .responseDecodable(){(response: AFDataResponse<ZactExpensesResponse>) in
                var errorMessage: String? = nil
                if let value = response.value {
                    callback(value.content, nil)
                }else{
                    errorMessage = ZactApiServiceManager.getErrorMessage(response: response.response)
                    print(errorMessage ?? "")
                    callback(nil, errorMessage)
                }
            }
    }
}
