//
//  UtilsExtention.swift
//  iquran
//
//  Created by aldinugroho on 10/03/24.
//

import Foundation
import UIKit

extension UIApplication {
    static func topSafeArea () -> CGFloat {
        var result: CGFloat = 0
        if #available(iOS 15.0, *) {
            // iOS 15 or later
            // Handle iOS 15 specific behavior
            print("IOS 15 or LATER")
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            result = scene?.windows.first?.safeAreaInsets.top ?? 0
        } else {
            // Below iOS 15
            // Handle behavior for versions prior to iOS 15
            print("IOS 15 UNDER")
            result = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
        }
        return result
    }
}
