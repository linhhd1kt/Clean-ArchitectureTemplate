//
//  LaunchModels.swift
//  YouBChat
//
//  Created by Ha Linh on 9/10/18.
//  Copyright (c) 2018 HaLinh. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Launch
{
  // MARK: Use cases
  
  enum AutoLogin
  {
    struct Request
    {
    }
    struct Response
    {
        var autoLoginSuccess: Bool
    }
    struct ViewModel
    {
        var autoLoginSuccess: Bool
    }
  }
}
