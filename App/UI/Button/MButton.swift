//
//  Button.swift
//  CleanSwift
//
//  Created by Ha Linh on 9/7/18.
//  Copyright © 2018 HaLinh. All rights reserved.
//

import UIKit

class MButton: UIButton {
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init() {
    super.init(frame: CGRect.zero)
    setupDefault()
  }
  
  private func setupDefault() {
    backgroundColor = K.Color.foreground
    tintColor = K.Color.background
    setTitleColor(K.Color.background, for: .normal)
    setTitleColor(K.Color.lightText, for: .highlighted)
    layer.cornerRadius = K.UI.defaultCornerRadius

  }
  
  convenience init(_ title: String) {
    self.init()
    self.setTitle(title, for: .normal)
  }
}
