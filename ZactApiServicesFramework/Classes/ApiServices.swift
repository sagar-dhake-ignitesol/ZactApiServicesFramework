public struct ApiServices {
    
    /// Access token required to verify authorised user
    private var accessToken: String
    
    /// Bearer token required for calling api
    private var bearerToken: String

    /**
        Initilization of the framework using accessToken and bearerToken
     
        - parameter accessToken: If worng access token, framework will not be accessible.
        - parameter bearerToken: The token which is used for caling api's
    */
    public init(accessToken: String, bearerToken: String) {
        self.accessToken = accessToken
        self.bearerToken = bearerToken
    }
    
    /**
        Get expense list according to state passed
     
        - parameter state: Get expenses of passsed state
        - parameter size: Size od expenses returned
        - parameter size: Callback has expense list and error message params
    */
    public func getExpenses(state : String, size: Int, callback: @escaping ExpenseListResponseCallback) {
        if(FrameworkManager.checkIsAuthorized(accessToken: self.accessToken)) {
            ExpenseApiServices().getExpensesForState(state: state, bearerToken: self.bearerToken) { expenses, error in
               callback(expenses, error)
            }
        }
        else {
            callback(nil, "Access token error")
        }
    }
}
