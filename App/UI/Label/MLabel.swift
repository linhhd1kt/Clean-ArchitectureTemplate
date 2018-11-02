//
//  MLabel.swift
//  App
//
//  Created by Ha Linh on 9/11/18.
//  Copyright © 2018 HaLinh. All rights reserved.
//

import UIKit

class MLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: CGRect.zero)
        setupDefault()
    }
    
    private func setupDefault() {
        textColor = K.Color.darkText
    }

}

