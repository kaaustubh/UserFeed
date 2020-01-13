//
//  Audi_listTests.swift
//  Audi_listTests
//
//  Created by Kaustubh on 13/01/20.
//  Copyright © 2020 KaustubhtestApp. All rights reserved.
//

import XCTest
@testable import Audi_list

class Audi_listTests: XCTestCase {

    let offset = 0
    let limit = 10
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetPosts() {
        let postsExpectation = expectation(description: "Get Posts")
        _ = PostsService().loadPosts(offset: offset, limit: limit, completion: { posts,error in
            if let posts = posts, posts.count == 10 {
                postsExpectation.fulfill()
            }
        })
        waitForExpectations(timeout: 3, handler: nil)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
