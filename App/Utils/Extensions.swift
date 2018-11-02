//
//  Extensions.swift
//  CleanSwift
//
//  Created by Ha Linh on 9/7/18.
//  Copyright © 2018 HaLinh. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension NSObject {
    var className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
    
    class var className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}

extension UIDevice {
    static var isSimulator: Bool {
        return ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] != nil
    }
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
//    @IBInspectable
//    var borderColor: UIColor? {
//        get {
//            let color = UIColor(cgColor: layer.borderColor!)
//            return color
//        }
//        set {
//            layer.borderColor = newValue?.cgColor
//        }
//    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.4
            layer.shadowRadius = shadowRadius
        }
    }
}

extension UIImageView {
    
    func setRounded() {
        let radius = self.frame.size.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

extension Int {
    func format(_ f: String) -> String {
        return String(format: "%\(f)d", self)
    }
    
    func toWeekdayText() -> String? {
        switch self {
        case 0:
            return "Saturday"
        case 1:
            return "Sunday"
        case 2:
            return "Monday"
        case 3:
            return "Tuesday"
        case 4:
            return "Wednesday"
        case 5:
            return "Thursday"
        case 6:
            return "Friday"
        default:
            return nil
        }
    }
    
    var toString: String {
        get {
            return "\(self)"
        }
    }
}

extension UInt8 {
    var toString: String {
        get {
            return "\(self)"
        }
    }
}

extension Double {
    func format(_ f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

extension Float {
    func format(_ f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

extension String {
    
    var dayFromHourFormat: Date {
        get {
            let formater = DateFormatter()
            formater.dateFormat = "HH:mm:ss"
            return formater.date(from: self) ?? Date()
        }
    }
    
    var date: Date {
        let formater = DateFormatter()
        formater.dateFormat = "MM-dd-yyyy"
        return formater.date(from: self) ?? Date()
    }
    
    var shortDate: String {
        get {
            let formater = DateFormatter()
            formater.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = formater.date(from: self) ?? Date()
            formater.dateStyle = .short
            return formater.string(from: date)
        }
    }
    
    var mediumDate: String {
        get {
            let formater = DateFormatter()
            formater.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = formater.date(from: self) ?? Date()
            formater.dateStyle = .medium
            return formater.string(from: date)
        }
    }
    
    var fullTime: String {
        get {
            let formater = DateFormatter()
            formater.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = formater.date(from: self) ?? Date()
            formater.dateFormat = "MM/dd/yyyy HH:mm a"
            return formater.string(from: date)
        }
    }
    
    var messageHour: String {
        get {
            let formater = DateFormatter()
            formater.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = formater.date(from: self) ?? Date()
            formater.dateFormat = "HH:mm a"
            return formater.string(from: date)
        }
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
//    func getBusinessHour() -> BusinessHour {
//        let array = self.components(separatedBy: ",")
//        guard array.count == 5 else {
//            return BusinessHour(selected: false, day: "", hour: "", status: .close, isTitle: false)
//        }
//        return BusinessHour(selected: array[0] == "true" ? true : false, day: array[1], hour: array[2], status: BusinessHourStatus(rawValue:array[3]) ?? .close, isTitle: array[4] == "true" ? true : false)
//    }
    
    func appendPath(_ path: String) -> String {
        return self + "/" + path
    }
    
    func getUserNameInfo() -> (String, String) {
        var firstname = ""
        var lastname = ""
        let arrayName = self.split(separator: " ")
        switch arrayName.count {
        case 0:
            break
        case 1:
            firstname = String(arrayName[0])
        case 2:
            firstname = String(arrayName[0])
            lastname = String(arrayName[1])
        default:
            firstname = String(arrayName[0])
            lastname = self.replacingOccurrences(of: firstname, with: "").trim()
        }
        return (firstname, lastname)
    }
    
//    var lastMessageTime: String {
//        get {
//            let calendar = Calendar.current
//            let currentDate = calendar.startOfDay(for: Date())
//            let messageDate = calendar.startOfDay(for: self.date)
//            let components = calendar.dateComponents([.day], from: messageDate, to: currentDate)
//
//            switch components.day {
//            case .some(0):
//                return self.messageHour
//            case .some(1):
//                return "time.yesterday".localized
//            case .some(2...6):
//                return self.date.weekDay
//            default:
//                return shortDate
//            }
//        }
//    }
    
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hexString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    
}

//extension UIViewController: NVActivityIndicatorViewable {
//    @objc func backButtonAction() {
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    func addBackbutton(title: String) {
//        if let nav = self.navigationController,
//            let item = nav.navigationBar.topItem {
//            let backButton = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.plain, target: self, action:#selector(self.backButtonAction))
//            backButton.tintColor = K.Color.barItemColor
//            item.backBarButtonItem  = backButton
//        } else {
//            if let nav = self.navigationController,
//                let _ = nav.navigationBar.backItem {
//                self.navigationController!.navigationBar.backItem!.backBarButtonItem?.tintColor = K.Color.barItemColor
//                self.navigationController!.navigationBar.backItem!.title = title
//            }
//        }
//    }
//
//    func popTo<T: UIViewController>(_ viewController: T.Type) {
//        if let vcs = self.navigationController?.viewControllers {
//            for vc in vcs {
//                if vc.isKind(of: T.self) {
//                    navigationController?.popToViewController(vc, animated: true)
//                    return
//                }
//            }
//        }
//    }
//
//    func showProgress() {
//        let activityData = ActivityData(size: CGSize(width: 30, height: 30), message: "", messageFont: nil, messageSpacing: nil, type: .ballPulseSync, color: K.Color.foreground, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: nil, textColor: nil)
//        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, NVActivityIndicatorView.DEFAULT_FADE_IN_ANIMATION)
//    }
//
//    func hideProgress() {
//        stopAnimating()
//    }
//}

extension UITableView {
    func dequeueCell<T: UITableViewCell>(_ cell: T.Type
        ,_ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
    }
    
    func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        self.register(UINib(nibName: T.className, bundle: nil), forCellReuseIdentifier: T.className)
    }
    
    func insertCell(_ indexPath: IndexPath) {
        self.beginUpdates()
        self.insertRows(at: [indexPath], with: .top)
        self.endUpdates()
    }
    
    func removeCell(_ indexPath: IndexPath) {
        self.beginUpdates()
        self.deleteRows(at: [indexPath], with: .bottom)
        self.endUpdates()
    }
    
    func updateCell(_ indexPath: IndexPath) {
        self.beginUpdates()
        self.reloadRows(at: [indexPath], with: .fade)
        self.endUpdates()
    }
    
    func updateCells(_ indexPaths: [IndexPath]) {
        self.beginUpdates()
        self.reloadRows(at: indexPaths, with: .automatic)
        self.endUpdates()
    }
    
}

extension UICollectionView {
    func dequeueCell<T: UICollectionViewCell>(_ cell: T.Type
        ,_ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as! T
    }
    
    func registerCell<T: UICollectionViewCell>(_ cell: T.Type) {
        self.register(UINib(nibName: T.className, bundle: nil), forCellWithReuseIdentifier: T.className)
    }
}

extension Date {
    var businessDayString: String {
        get {
            let formater = DateFormatter()
            formater.dateFormat = "HH:mm a"
            formater.amSymbol = "AM"
            formater.pmSymbol = "PM"
            return formater.string(from: self)
        }
    }
    
    var couponDateString: String {
        get {
            let formater = DateFormatter()
            formater.dateFormat = "MM/dd/yyyy"
            return formater.string(from: self)
        }
    }
    
    var serverFormatDateString: String {
        get {
            let formater = DateFormatter()
            formater.dateFormat = "dd-MM-yyyy"
            return formater.string(from: self)
        }
    }
    
    var normalDateString: String {
        get {
            let formater = DateFormatter()
            formater.dateFormat = "MM-dd-yyyy"
            return formater.string(from: self)
        }
    }
    
    var messageTime: String {
        get {
            let formater = DateFormatter()
            formater.dateFormat = "yyyy/MM/dd HH:mm a"
            formater.amSymbol = "AM"
            formater.pmSymbol = "PM"
            return formater.string(from: self)
        }
    }
    
    // Year
    var currentYear: String? {
        return getDateComponent(dateFormat: "yy")
    }
    
    func getDateComponent(dateFormat: String) -> String? {
        let format = DateFormatter()
        format.dateFormat = dateFormat
        return format.string(from: self)
    }
    
    func currentWeekday() -> Int {
        return Calendar.current.component(.weekday, from: Date())
    }
    
    var weekDay: String {
        return Calendar.current.component(.weekday, from: self).toWeekdayText() ?? "Monday"
    }
}

extension UIStoryboard {
    func instantiateVC<T: UIViewController>(_ type: T.Type) -> T {
        return instantiateViewController(withIdentifier: T.className) as! T
    }
}

extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func resizeImage(_ maxWidth: CGFloat) -> UIImage {
        let size = self.size
        
        let ratio  = maxWidth  / size.width
        
        // Figure out what our orientation is, and use that to form the rectangle
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

//extension UIImageView {
//    func set(_ url: String) {
//        self.sd_setImage(with: URL(string: url), completed: nil)
//    }
//}
//
//extension IndexPath {
//    static func instantiate(_ item: Int) -> IndexPath {
//        return IndexPath(item: item, section: 0)
//    }
//}
//
//extension DateFormatter {
//    static var articleDateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        return formatter
//    }
//}
//
extension NSError {
    static func instant(_ code: Int, localizeString: String) -> NSError {
        return NSError(domain: "API", code: code, userInfo: [NSLocalizedDescriptionKey: localizeString])
    }
}
//
//extension DateComponents {
//    func getWeedayString() -> String {
//        guard let fromWeekday = self.weekday else { return "\(WeekDay.Monday)" }
//        return "\(WeekDay(rawValue: fromWeekday) ?? .Monday)"
//    }
//    
//    func getHourString() -> String {
//        let fullHour: Int = self.hour ?? 0
//        let hour: Int = fullHour % 12
//        let amPm = fullHour >= 12 ? "PM" : "AM"
//        let minute: Int = self.minute ?? 0
//        return String(format: "%d:%02d %@", hour, minute, amPm)
//        
//    }
//}


