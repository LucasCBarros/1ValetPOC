//
//  HomeViewControllerTests.swift
//  1ValetPOCTests
//
//  Created by Lucas C Barros on 16/04/22.
//

import XCTest

class HomeViewControllerTests: XCTestCase {
    
    var sut: HomeViewController?
    var viewModel: HomeViewModel!

    override func setUp() {
        super.setUp()
        
        // Setup SUT
        viewModel = HomeViewModel()
        viewModel.deviceAmount = 10
        sut = HomeViewController(viewModel: viewModel)
    }

    override func tearDown() {
        super.tearDown()
        
        // Reset SUT
        viewModel.deviceAmount = 0
        sut?.viewModel = viewModel
    }

    func testAddDevice() throws {
        // Given
        let currentAmount = sut?.viewModel.deviceAmount ?? 0
        
        // When
        sut?.tapAddDevice()
        let newAmount = sut?.viewModel.deviceAmount ?? 0
        
        // Then
        XCTAssertEqual(currentAmount + 1, newAmount, "Not incrementing value")
    }
}
