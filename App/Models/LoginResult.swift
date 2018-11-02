//
//  AuthResult.swift
//  CleanSwift
//
//  Created by Ha Linh on 9/5/18.
//  Copyright © 2018 HaLinh. All rights reserved.
//

import SwiftyJSON

struct LoginResult: JsonInitable {
    var token: String
    
    init(_ json: JSON) {
        token = json["data"]["token"].stringValue
    }
}
