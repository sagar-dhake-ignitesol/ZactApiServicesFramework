//
//  ViewController.swift
//  Example
//
//  Created by Sagar Dhake on 11/04/23.
//

import UIKit
import ZactApiServicesFramework

class ExpenseListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var expenses = [ZactExpenseInfo]()
    
    let accessToken = "xP1z4yfs!Jq3PDELKU4MOTqvJ/YGc3vUeSRb7qFo195wCBKBExNpo3jTDn0ClOOP"
    let bearerToken = "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJDMEJkN3ZkZHdhM0wtWjBDXzhzZTFJUFVQb2dES2oyWDlKX3EwU3p3aTRNIn0.eyJleHAiOjE2OTYwNDI4NjksImlhdCI6MTY4MDUxNzI5NiwiYXV0aF90aW1lIjoxNjgwNDkwODY5LCJqdGkiOiIyMWM5ZWIxMS1jMGFiLTRmMTgtYjg5My1iZTQ1OGQ1ZjE4NmYiLCJpc3MiOiJodHRwczovL2lkbS5zdGFnZS5wOHBpbnQuY29tL2F1dGgvcmVhbG1zL3A4cCIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiJiYTkwZmRmNS03NGI2LTQ0ZmQtYjY4Zi0wYmM2ZjBiNzhlNTUiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJpb25pYyIsIm5vbmNlIjoiMGRmYWE5MzctODI5Ni00YWM0LTk4ZGUtMjdkOTAxZTllY2YzIiwic2Vzc2lvbl9zdGF0ZSI6ImZkYjBmMDEwLTE1NmQtNDA4Yy04ZjAyLTNiMWIyYTc2NzE4MCIsImFsbG93ZWQtb3JpZ2lucyI6WyIqIl0sInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJXRUJfTE9HSU4iLCJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIiwiQURNSU4iLCJVU0VSIiwiQUNDT1VOVElORyJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6Im9wZW5pZCBwcm9maWxlIGVtYWlsIiwic2lkIjoiZmRiMGYwMTAtMTU2ZC00MDhjLThmMDItM2IxYjJhNzY3MTgwIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwOHBSb2xlcyI6WyJXRUJfTE9HSU4iLCJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIiwiQURNSU4iLCJVU0VSIiwiQUNDT1VOVElORyJdLCJuYW1lIjoiVXNlcjEgRGl2MjEiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJkaXYyMXVzZXIxQGdsYWNpZXJkaXYyMS5jb20iLCJnaXZlbl9uYW1lIjoiVXNlcjEiLCJmYW1pbHlfbmFtZSI6IkRpdjIxIiwiZW1haWwiOiJkaXYyMXVzZXIxQGdsYWNpZXJkaXYyMS5jb20ifQ.mL-zM5lddjvCobCJykf3vEcPd9gVo1-GBNdr_0z4-kx8L5asHS8ZFoUvdr102scoSzd23HtlMiHVP-JQPRRVJH7gGzR5zxqbfpiJm8Qxs7oWSj8Cc1u702FVUgcCqLCUjArEKpm4HslVxm_sIzoHf_ig7QsqpzwK15pKTtxMnVB9wg5Z01PREhDiWRaarClOXzFzshkxbv926r4_t_sj6G_Imq4Al0pO5BXISj-Kw0qLPvf_mcUT3FLHck_aSl5NwW3a_X-LWZJYKEeKgVyCC6nDM9gOpgbOIrsOWlV_tLw4gwsWjavQmK-D0HmgAiK967hYWwtzMCJ8qgkEbcQkCQ"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ExpenseCell", bundle: nil), forCellReuseIdentifier: "ExpenseCell")
        
        self.getExpenses()
    }
    
    func getExpenses() {
        let apiServices = ApiServices(accessToken: "abc", bearerToken: self.bearerToken)
        
        let loader = showLoader(view: self.view)
                
        apiServices.getExpenses(state: "pending", size: 20) { expenses, error in
            if let expenses = expenses {
                self.expenses = expenses
                self.tableView.reloadData()
            }
            
            if let error = error {
                print(error)
            }
            
            loader.dismissLoader()
        }
    }
}

extension ExpenseListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count: Int = self.expenses.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index: Int = indexPath.row
        let expense = self.expenses[index]

        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as! ExpenseCell
        cell.setupFor(expenseInfo: expense)
        
        return cell
    }
}

