//
//  TextField.swift
//  CleanSwift
//
//  Created by Ha Linh on 9/7/18.
//  Copyright © 2018 HaLinh. All rights reserved.
//

import UIKit

class MTextField: UITextField {

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init() {
    super.init(frame: CGRect.zero)
    setupDefault()
  }
  
  convenience init(_ placeholder: String) {
    self.init()
    self.placeholder = placeholder
  }
  
  private func setupDefault() {
    textColor = K.Color.darkText
    borderStyle = .roundedRect
  }
  
}
