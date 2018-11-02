//
//  config.swift
//  CleanSwift
//
//  Created by Ha Linh on 9/7/18.
//  Copyright © 2018 HaLinh. All rights reserved.
//

import UIKit
import SwiftyBeaver
import NVActivityIndicatorView

// MARK: loger
let log = SwiftyBeaver.self

struct K {
    static let endPoint = "http://dev.youbchat.com"
    struct UI {
        static let defaultMargin: CGFloat = 20.0
        static let defaultTextFieldHeight: CGFloat = 44.0
        static let defaultButtonHeight: CGFloat = 44.0
        static let defaultControlDistance: CFloat = 20.0
        static let defaultCornerRadius: CGFloat = 6.0

        static let activityData = ActivityData(size: CGSize(width: 40, height: 40), message: nil, messageFont: nil, messageSpacing: nil, type: .circleStrokeSpin, color: Color.hilight, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: nil, textColor: nil)
        
        struct TabBar {
            static func creatTabBarItem(title: String?, image: UIImage, selectedImage: UIImage?) -> UITabBarItem {
                let item = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
                item.imageInsets.top = 6
                item.imageInsets.bottom = -6
                return item
            }
            
            static func configTabBar(_ tabbar: UITabBar) {
                tabbar.backgroundColor = K.Color.background
            }
        }
        
    }
    
    struct Color {
        static let foreground = UIColor.dogleBule
        static let background = UIColor.white
        static let hilight = UIColor.tomanto
        static let darkText = UIColor.tundora
        static let lightText = UIColor.gray
    }
}



extension UIColor {
    static let dogleBule = UIColor(hex: "#1E90FF")
    static let tundora = UIColor(hex: "#424242")
    static let gray = UIColor(hex: "#919191")
    static let tomanto = UIColor(hex: "#FF6347")
}



func configLoger() {
    // add log destinations. at least one is needed!
    let console = ConsoleDestination()  // log to Xcode Console
    let file = FileDestination()  // log to default swiftybeaver.log file
    let cloud = SBPlatformDestination(appID: "foo", appSecret: "bar", encryptionKey: "123") // to cloud
    
    // use custom format and set console output to short time, log level & message
    console.format = "$DHH:mm:ss$d $L $M"
    // or use this for JSON output: console.format = "$J"
    
    // add the destinations to SwiftyBeaver
    log.addDestination(console)
    log.addDestination(file)
    log.addDestination(cloud)
}
