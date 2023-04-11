public struct ApiServices {
    private var accessToken: String
    private var bearerToken: String

    public init(accessToken: String, bearerToken: String) {
        self.accessToken = accessToken
        self.bearerToken = bearerToken
    }
    
    public func sayHello() {
        print("hello world")
    }
  
//    public func getExpenses(state : String, size: Int, callback: @escaping ExpenseListResponseCallback) {
//        if(FrameworkManager.checkIsAuthorized(accessToken: self.accessToken)) {
//            ExpenseApiServices().getExpensesForState(state: state, bearerToken: self.bearerToken) { expenses, error in
//               callback(expenses, error)
//            }
//        }
//        else {
//            callback(nil, "Access token error")
//        }
//    }
}
