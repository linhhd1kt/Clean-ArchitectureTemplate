//
//  Api.swift
//  CleanSwift
//
//  Created by Ha Linh on 9/6/18.
//  Copyright © 2018 HaLinh. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit
import PromiseKit

protocol JsonInitable {
    init(_ json: JSON)
}

enum Router: Alamofire.URLRequestConvertible {
    static let baseURLString = K.endPoint.appendPath("api")
    private static var token: String? = nil
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        if let token = Router.token {
            urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        
        return urlRequest
    }
    
    static func setToken(_ token: String) {
        Router.token = token
    }
    
    // MARK: Api function
    case login(email: String, password: String)
    
    // MARK: method
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    // MARK: path
    private  var path: String {
        switch self {
        case .login:
            return "users/login"
        }
    }
    // MARK: parameter
    private var parameters: Parameters {
        switch self {
        case .login(let email, let password):
            return  [
                "email" : email,
                "password" : password
            ]
        }
    }
    
}

class ApiService {
    
    static var shared = ApiService()
    
    func setToken(_ token: String) {
        Router.setToken(token)
    }
    
    func request(_ urlRequest: Alamofire.URLRequestConvertible) -> Promise<JSON>
    {
//        Helper.showLoading()
        return Promise<JSON> { seal in
            Alamofire.request(urlRequest).responseJSON()
                .done { (arg) in
//                    Helper.hideLoading()
                    let json = JSON(arg.json)
                    let statusCode = json["status_code"].intValue
                    switch statusCode {
                    case 200..<300:
                        seal.fulfill(JSON(arg.json))
                    default:
                        let error = NSError.instant(statusCode, localizeString: json["message"].string ?? "system error.")
                        seal.reject(error)
                    }
                }.catch({ (error) in
//                    Helper.hideLoading()
                    seal.reject(error)
                })
        }
        
    }
    
    func login(email: String, password: String) -> Promise<LoginResult> {
        let urlRequest = Router.login(email: email, password: password)
        return request(urlRequest).map { LoginResult($0) }
    }
}
