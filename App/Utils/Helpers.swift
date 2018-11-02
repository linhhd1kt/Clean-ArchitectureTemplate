//
//  Helpers.swift
//  CleanSwift
//
//  Created by Ha Linh on 9/8/18.
//  Copyright © 2018 HaLinh. All rights reserved.
//

import Foundation
import NVActivityIndicatorView


struct Helper {
    static func showLoading() {
        // MARK: activity indicator and network state
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(K.UI.activityData, NVActivityIndicatorView.DEFAULT_FADE_IN_ANIMATION)
    }
    static func hideLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(NVActivityIndicatorView.DEFAULT_FADE_OUT_ANIMATION)
    }

}
