//
//  ServiceCall.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 5/3/24.
//

import Foundation

class ServiceCall {
    class func post(parameters: [String: Any], path: String, requiresToken: Bool = false, success: @escaping ((_ response: AnyObject?) -> Void), failure: @escaping ((_ error: Error?) -> Void)) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            // Build query string from parameters
            var parameterData = Data()
            var urlComponents = URLComponents()
            urlComponents.queryItems = parameters.compactMap { key, value in
                guard let stringValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return nil }
                return URLQueryItem(name: key, value: stringValue)
            }
            if let query = urlComponents.query {
                parameterData.append(query.data(using: .utf8) ?? Data())
            }
            
            // Ensure the URL is valid
            guard let url = URL(string: path) else {
                DispatchQueue.main.async {
                    failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil))
                }
                return
            }
            
            // Create URL request
            var request = URLRequest(url: url, timeoutInterval: 20)
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            if(requiresToken) {
//                #if DEBUG
//                request.addValue("eZJ2r4opC5mCi0BcKFH1", forHTTPHeaderField: "access_token")
//                #else
                request.addValue(MainViewModel.shared.userObj.authToken, forHTTPHeaderField: "access_token")
//                #endif
            }
            request.httpMethod = "POST"
            request.httpBody = parameterData
            
            // Execute the request
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    DispatchQueue.main.async {
                        failure(error)
                    }
                    return
                }
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        failure(NSError(domain: "No data received", code: 500, userInfo: nil))
                    }
                    return
                }
                
                do {
                    if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary {
                        DispatchQueue.main.async {
                            success(jsonResponse)
                        }
                    } else {
                        DispatchQueue.main.async {
                            failure(NSError(domain: "Invalid response format", code: 500, userInfo: nil))
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        failure(error)
                    }
                }
            }
            
            task.resume()
        }
    }
}
