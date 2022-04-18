//
//  DeviceListViewModelTests.swift
//  1ValetPOCTests
//
//  Created by Lucas C Barros on 16/04/22.
//

import XCTest

class DeviceListViewModelTests: XCTestCase {

    var viewModel: DeviceListViewModel!
    var mockContentData: [DeviceModel]?
    
    override func setUp() {
        super.setUp()
        
        // Setup viewModel
        viewModel = DeviceListViewModel()
    }

    override func tearDown() {
        super.tearDown()
        
        // Reset viewModel
        viewModel.devices = []
    }

    func testFetchDevices() {
        // Given
        let currentDevices = viewModel.devices
        
        // When
        getData()
        let fetchedDevices = viewModel.devices
        
        // Then
        XCTAssertNotEqual(currentDevices?.count, fetchedDevices?.count, "Not fetching devices")
    }
}

// MARK: Auxiliar methods
extension DeviceListViewModelTests {
    
    func getData() {
        guard let url = Bundle.main.url(forResource: "devicesMock", withExtension: "json") else {
            XCTFail("Missing file: devicesMock.json")
            return
        }

        guard let json = try? Data(contentsOf: url) else {
            XCTFail("Failed converting data")
            return
        }
        
        let decoder = JSONDecoder()
        guard let devices = try? decoder.decode([DeviceModel].self, from: json) else {
            XCTFail("Failed converting data")
            return
        }
        
        mockContentData = devices
    }
}
