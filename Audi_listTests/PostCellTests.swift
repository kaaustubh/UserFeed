//
//  PostCellTests.swift
//  Audi_listTests
//
//  Created by Kaustubh on 14/01/20.
//  Copyright © 2020 KaustubhtestApp. All rights reserved.
//

import XCTest
@testable import Audi_list

class PostCellTests: XCTestCase {

    var cell: PostCell!
    let nameLabel = UILabel()
    let messageLabel = UILabel()
    let image = UIImageView()
    override func setUp() {
        super.setUp()
        cell = PostCell()
        cell.messageLabel = messageLabel
        cell.nameLabel = nameLabel
        cell.userImage = image
    }

    func testPostCell() {
        let post = Post(id: "12345", timestamp: "12345", visibility: "visible", message: "Message", service: Service(id: "4321", name: "Service1", title: "service title", image_url: "foo.bar"), user: User(id: "9876", name: "Audi R8", image_url: "bar.foo"), content: nil)
        cell.setPost(post: post)
        XCTAssertEqual(cell.messageLabel.text, "Message")
        XCTAssertEqual(cell.nameLabel.text, "Audi R8")
    }
}
