//
//  DevicesListViewControllerUITestes.swift
//  1ValetPOCUITests
//
//  Created by Lucas C Barros on 18/04/22.
//

import XCTest

class DevicesListViewControllerUITestes: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    
    func testTabSwitch() throws {
        let app = XCUIApplication()
        
        let tabBar = XCUIApplication().tabBars["Tab Bar"]

        let devicesButton = tabBar.buttons["Devices"]
        devicesButton.tap()
        XCTAssert(app.staticTexts["iPhone Lucas"].exists)

        let configurationButton = tabBar.buttons["Configuration"]
        configurationButton.tap()
        XCTAssert(app.staticTexts["Lucas C. Barros"].exists)

        let homeButton = tabBar.buttons["Home"]
        homeButton.tap()
        XCTAssert(app.staticTexts["Add Device"].exists)

        configurationButton.tap()
        devicesButton.tap()
        homeButton.tap()
        
        XCTAssert(app.staticTexts["Add Device"].exists)
    }
    
    func testAddDeviceHomeScreen() throws {
        let app = XCUIApplication()
        
        let addDeviceButton = app.buttons["Add Device"]
        XCTAssert(app.staticTexts["4"].exists)
        addDeviceButton.tap()
        XCTAssert(app.staticTexts["5"].exists)
        addDeviceButton.tap()
        XCTAssert(app.staticTexts["6"].exists)
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Devices"].tap()
        XCTAssert(app.staticTexts["iPhone Lucas"].exists)
        tabBar.buttons["Home"].tap()
        XCTAssert(app.staticTexts["Add Device"].exists)
        
        let addDeviceStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Add Device"]/*[[".buttons[\"Add Device\"].staticTexts[\"Add Device\"]",".staticTexts[\"Add Device\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        addDeviceStaticText.tap()
        XCTAssert(app.staticTexts["7"].exists)
        addDeviceStaticText.tap()
        XCTAssert(app.staticTexts["8"].exists)
    }
    
    func testEnterDeviceDetail() throws {
        let app = XCUIApplication()
        
        let tabBar = XCUIApplication().tabBars["Tab Bar"]

        let devicesButton = tabBar.buttons["Devices"]
        devicesButton.tap()
        XCTAssert(app.staticTexts["iPhone Lucas"].exists)
        
        let tablesQuery = app.tables
          tablesQuery.cells["iPhone Lucas"].children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssert(app.staticTexts["true"].exists)
        
        let backButton = app.buttons["back"]
        backButton.tap()
        XCTAssert(app.staticTexts["iPhone Lucas"].exists)
    }
}
