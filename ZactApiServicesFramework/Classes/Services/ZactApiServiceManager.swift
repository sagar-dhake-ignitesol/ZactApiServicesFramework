//
//  File.swift
//  
//
//  Created by Sagar Dhake on 31/03/23.
//

import Foundation
import Alamofire

class ZactApiServiceManager {
    
    static func getAPIHost() -> String {
        return "https://api.stage.p8pint.com/"
    }
   
    static func get(endpoint: String, bearerToken: String, parameters: Parameters? = nil, shouldAuthorize: Bool = true) -> DataRequest{
        return createAlamofireRequest(method: .get, endpoint: endpoint, bearerToken: bearerToken, encoding: URLEncoding(arrayEncoding: .noBrackets), parameters: parameters, shouldAuthorize: shouldAuthorize)
    }
    
    static func post(endpoint: String, bearerToken: String, parameters: Parameters? = nil, shouldAddNewHeader: Bool? = false, requestData: Any? = nil) -> DataRequest{
        return createAlamofireRequest(method: .post, endpoint: endpoint, bearerToken: bearerToken, parameters: parameters, shouldAddNewHeader: shouldAddNewHeader ?? false, requestData: requestData)
    }
    
    private static func createAlamofireRequest(method: HTTPMethod = .get, endpoint: String, bearerToken: String, encoding: ParameterEncoding = JSONEncoding.default, parameters: Parameters? = nil, shouldAuthorize: Bool = true, shouldAddNewHeader: Bool = false, requestData: Any? = nil) -> DataRequest{
        let url = getAPIHost() + endpoint
     
        if let requestPostData = requestData {
            var urlRequest = URLRequest(url: URL(string: url)!)
                    
            if shouldAuthorize {
                // Create header with Bearer token
                urlRequest.addValue("Bearer " + (bearerToken), forHTTPHeaderField: "Authorization")
                                    
                if shouldAddNewHeader {
                    urlRequest.addValue("application/zact.api.v2+json", forHTTPHeaderField: "Accept")
                }
            }
            
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: requestPostData, options: .prettyPrinted)
            urlRequest.httpMethod = method.rawValue.uppercased()
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let req = Alamofire
                .Session
                .default
                .request(urlRequest)
                .validate(statusCode: 200..<300)
                                        
            req.response(){ response in
                //Handle the response status code
                self.handleResponseCode(response: response.response)
            }
            
            return req
        }
        else {
            var headers: HTTPHeaders = [:]
            
            if shouldAuthorize {
                // Create header with Bearer token
                if shouldAddNewHeader {
                    headers = [
                        "Authorization": "Bearer " + (bearerToken),
                        "Accept": "application/zact.api.v2+json"
                    ]
                }
                else {
                    headers = [
                        "Authorization": "Bearer " + (bearerToken)
                    ]
                }
            }
            
            let req = Alamofire
                .Session
                .default
                .request(url,
                         method: method,
                         parameters: parameters,
                         encoding: encoding,
                         headers: headers
                )
                .validate(statusCode: 200..<300)
            
            req.response(){ response in
                //Handle the response status code
                self.handleResponseCode(response: response.response)
            }
            
            return req
        }
    }
    
    static func handleResponseCode(response: HTTPURLResponse?){
        guard let urlResponse = response else{
            return
        }
        
        switch urlResponse.statusCode {
        case 401:
            print("\(String(describing: urlResponse.url)) Status code: \(urlResponse.statusCode)")
        default:
            print("\(String(describing: urlResponse.url)) Status code: \(urlResponse.statusCode)")
        }
    }
    
    static func getErrorMessage(response: HTTPURLResponse?) -> String{
        if let res = response{
            switch res.statusCode {
            case 400:
                return "Bad request"
            case 403:
                return "Forbidden"
            case 404:
                return "Resource not found"
            default:
                return "Internal server error"
            }
        }
        return "Unable to resolve host"
    }
}

