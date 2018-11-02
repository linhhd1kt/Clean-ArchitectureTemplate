//
//  LocalStorageService.swift
//  App
//
//  Created by Ha Linh on 9/10/18.
//  Copyright © 2018 HaLinh. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class LocalStorageService {
    static var shared = LocalStorageService()
    
    static let authTokenServiceName = "auth-service-name"
    static let localStorageGroup = "shared-access-local-storage-group"
    
    static let storageTokenName = "storage-token-name"
    
    var authKeychainWrapper = KeychainWrapper(serviceName: authTokenServiceName, accessGroup: localStorageGroup)
    
    private func set(_ info: String,for key: String) {
        let setSuccessful = authKeychainWrapper.set(info, forKey: key, withAccessibility: .afterFirstUnlock)
        if setSuccessful {
        } else {
            fatalError("Save info to key chain error.")
        }
    }
    
    private func get(_ key: String) -> String? {
        return authKeychainWrapper.string(forKey: key, withAccessibility: .afterFirstUnlock)
    }
    
    func saveToken(token: String) {
        set(token, for: LocalStorageService.storageTokenName)
    }
    
    func getSavedToken() -> String? {
        return get(LocalStorageService.storageTokenName)
    }
    
}
