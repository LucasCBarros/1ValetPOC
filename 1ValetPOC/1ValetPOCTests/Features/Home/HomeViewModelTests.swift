//
//  HomeViewModelTests.swift
//  1ValetPOCTests
//
//  Created by Lucas C Barros on 16/04/22.
//

import XCTest

class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        
        // Setup viewModel
        viewModel = HomeViewModel()
        viewModel.deviceAmount = 10
    }

    override func tearDown() {
        super.tearDown()
        
        // Reset viewModel
        viewModel.deviceAmount = 0
    }

    func testAddDevice() throws {
        // Given
        let currentAmout = viewModel.deviceAmount
        
        // When
        viewModel.addDevice()
        let newAmount = viewModel.deviceAmount
        
        // Then
        XCTAssertEqual(currentAmout + 1, newAmount, "Not incrementing value")
    }

    func testFetchDevices() throws {
        // Given
        let currentAmount = viewModel.deviceAmount
        
        // When
        viewModel.fetchDeviceCount()
        let fetchedAmount = viewModel.deviceAmount
        
        // Then
        XCTAssertNotEqual(currentAmount, fetchedAmount, "Not fetching values")
    }

}
