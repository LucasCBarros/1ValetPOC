//
//  DeviceDetailViewControllerTests.swift
//  1ValetPOCTests
//
//  Created by Lucas C Barros on 16/04/22.
//

import XCTest

class DeviceDetailViewControllerTests: XCTestCase {

    var sut: DeviceDetailViewController?
    var viewModel: DeviceDetailViewModel!

    override func setUp() {
        super.setUp()
        
        // Setup SUT
        viewModel = DeviceDetailViewModel()
        sut = DeviceDetailViewController()
        getData()
    }

    override func tearDown() {
        super.tearDown()
        
        // Reset SUT
        sut?.viewModel = viewModel
    }

    func testSearchBar() throws {
        // Given
//        let startingDeviceCount = sut?.searchedDevices?.count
//        XCTAssertEqual(startingDeviceCount, 4, "Didn't fetch initial devices")
//        
//        // When
//        sut?.searchFor("i")
//        let searchDeviceCount1 = sut?.searchedDevices?.count
//        // Then
//        XCTAssertEqual(searchDeviceCount1, 2, "Search didn't work")
        
    }

}

// MARK: Auxiliar methods
extension DeviceDetailViewControllerTests {
    
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
        guard let device = try? decoder.decode(DeviceModel.self, from: json) else {
            XCTFail("Failed converting data")
            return
        }
        
        sut?.viewModel?.device = device
    }
}
