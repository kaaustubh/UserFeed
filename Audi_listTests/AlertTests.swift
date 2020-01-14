//
//  AlertTests.swift
//  Audi_listTests
//
//  Created by Kaustubh on 14/01/20.
//  Copyright © 2020 KaustubhtestApp. All rights reserved.
//

import XCTest
@testable import Audi_list

class AlertTests: XCTestCase {

    var viewController: UIViewController!
    override func setUp() {
        super.setUp()
        viewController = UIViewController()
        Alert.rootViewController = viewController
    }

    func testAlertController() {
        Alert.show(title: "Alert title", message: "Alert Message", buttonTitle: "ok")
        XCTAssertEqual(Alert.alertController.title, "Alert title")
        XCTAssertEqual(Alert.alertController.message, "Alert Message")
        XCTAssertEqual(Alert.alertController.actions.count, 1)
        XCTAssertEqual(Alert.alertController.actions.first?.title, "ok")
    }

}
