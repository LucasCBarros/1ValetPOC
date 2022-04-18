//
//  HomeViewModel.swift
//  1ValetPOC
//
//  Created by Lucas C Barros on 16/04/22.
//

import Foundation

protocol HomeViewModelProtocol {
    // Protocol variables
    var deviceAmount: Int { get set }
    
    // Protocol methods
    func fetchDeviceCount()
    func addDevice()
}

class HomeViewModel: HomeViewModelProtocol {
    
    // viewModel Variables
    var deviceAmount: Int = 0
    let modelURLString = "https://mocki.io/v1/59b8aafc-0743-4d27-a8f0-3fa12b33455f"
    
    init() {
        fetchDeviceCount()
    }
    
    // viewModel Methods
    func fetchDeviceCount() {
        guard let url = URL(string: modelURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            do {
                let devices = try JSONDecoder().decode([DeviceModel].self, from: data)
                self.deviceAmount = devices.count
            } catch let jsonError {
                print("Error serializing json:", jsonError)
            }
            
        }.resume()
    }
    
    func addDevice() {
        deviceAmount += 1
    }
    
}
