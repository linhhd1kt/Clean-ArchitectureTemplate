//
//  BusinessViewController.swift
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

protocol BusinessDisplayLogic: class
{
  func displaySomething(viewModel: Business.Something.ViewModel)
}

class BusinessViewController: UIViewController, BusinessDisplayLogic
{
  var interactor: BusinessBusinessLogic?
  var router: (NSObjectProtocol & BusinessRoutingLogic & BusinessDataPassing)?

  // MARK: Object lifecycle
  override func loadView() {
    super.loadView()
    setup()
    initView()
  }
  
  // MARK: Setup
  private func setup()
  {
    let viewController = self
    let interactor = BusinessInteractor()
    let presenter = BusinessPresenter()
    let router = BusinessRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }

  // MARK: Init View
  private func initView() {
    view = MView()
  }

  // MARK: View lifecycle
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something  
  func doSomething()
  {
    let request = Business.Something.Request()
    interactor?.doSomething(request: request)
  }
  // MARK: Display something
  func displaySomething(viewModel: Business.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}