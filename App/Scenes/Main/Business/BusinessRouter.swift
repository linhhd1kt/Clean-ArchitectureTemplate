//
//  BusinessRouter.swift
//  App
//
//  Created by Ha Linh on 9/10/18.
//  Copyright (c) 2018 HaLinh. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol BusinessRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol BusinessDataPassing
{
  var dataStore: BusinessDataStore? { get }
}

class BusinessRouter: NSObject, BusinessRoutingLogic, BusinessDataPassing
{
  weak var viewController: BusinessViewController?
  var dataStore: BusinessDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
    // 
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: BusinessViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: BusinessDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
