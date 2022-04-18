//
//  DeviceListViewControllerTests.swift
//  1ValetPOCTests
//
//  Created by Lucas C Barros on 16/04/22.
//

import XCTest

class DeviceListViewControllerTests: XCTestCase {

    var sut: DeviceListViewController?
    var viewModel: DeviceListViewModel!

    override func setUp() {
        super.setUp()
        
        // Setup SUT
        viewModel = DeviceListViewModel()
        sut = DeviceListViewController()
        getData()
        sut?.searchedDevices = viewModel.devices
    }

    override func tearDown() {
        super.tearDown()
        
        // Reset SUT
        sut?.viewModel = viewModel
    }

    func testSearchBar() throws {
        // Given
        let startingDeviceCount = sut?.searchedDevices?.count
        XCTAssertEqual(startingDeviceCount, 4, "Didn't fetch initial devices")
        
        // When
        sut?.searchFor("i")
        let searchDeviceCount1 = sut?.searchedDevices?.count
        // Then
        XCTAssertEqual(searchDeviceCount1, 2, "Search didn't work")
        
        // When
        sut?.searchFor("ip")
        let searchDeviceCount2 = sut?.searchedDevices?.count
        // Then
        XCTAssertEqual(searchDeviceCount2, 1, "Search didn't work")
        
        // When
        sut?.searchFor("ipo")
        let searchDeviceCount3 = sut?.searchedDevices?.count
        // Then
        XCTAssertEqual(searchDeviceCount3, 0, "Search didn't work")
    }

}

// MARK: Auxiliar methods
extension DeviceListViewControllerTests {
    
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
        
        sut?.viewModel.devices = devices
    }
}
