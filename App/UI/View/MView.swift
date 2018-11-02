//
//  View.swift
//  CleanSwift
//
//  Created by Ha Linh on 9/7/18.
//  Copyright © 2018 HaLinh. All rights reserved.
//

import UIKit

class MView: UIView {
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  init() {
    super.init(frame: CGRect.zero)
    setupDefault()
  }
  
  private func setupDefault() {
    self.backgroundColor = K.Color.background
  }
}
