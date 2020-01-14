//
//  Alert.swift
//  Audi_list
//
//  Created by Kaustubh on 14/01/20.
//  Copyright © 2020 KaustubhtestApp. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class Alert {

    static var rootViewController: UIViewController!
    static var alertController: UIAlertController!

    static func show(title: String, message: String, buttonTitle: String) {
        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        if let controller = UIApplication.shared.windows.last?.rootViewController {
            if !(controller.presentedViewController is UIAlertController) {
                rootViewController = controller
                rootViewController.present(alertController, animated: true)
            }
        }
    }
}
