//
//  NightsWatchTests.swift
//  NightsWatchTests
//
//  Created by Bas Pellis on 27/11/15.
//  Copyright © 2015 WebComrades. All rights reserved.
//

import XCTest

class NightsWatchTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConfiguration() {
        let viewController = ViewController()
        let noexistConfiguration = viewController.loadConfiguration(name: "noexist-configuration", bundle: NSBundle(forClass: object_getClass(self)))
        XCTAssertNil(noexistConfiguration)

        let configuration = viewController.loadConfiguration(name: "test-configuration", bundle: NSBundle(forClass: object_getClass(self)))
        XCTAssertNotNil(configuration)
        XCTAssertEqual(configuration!["background"].stringValue, "#123456")
        XCTAssertEqual(configuration!["text"].stringValue, "#789012")
        XCTAssertEqual(configuration!["name"].stringValue, "Nights Watch Test")
    }

}
