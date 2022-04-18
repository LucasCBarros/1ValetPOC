//
//  DeviceListViewModel.swift
//  1ValetPOC
//
//  Created by Lucas C Barros on 16/04/22.
//

import Foundation

protocol DeviceListViewModelProtocol {
    var devices: [DeviceModel]? { get set }
    
    func fetchDevices()
}

class DeviceListViewModel: DeviceListViewModelProtocol {
    var devices: [DeviceModel]?
    
    // Mock online to simulate backend
    let modelURLString = "https://mocki.io/v1/c18c81a5-561a-471f-b743-e8c285aa0e2c"
    
    init() {
        fetchDevices()
    }
    
    // Fetch devices from backend
    func fetchDevices() {
        guard let url = URL(string: modelURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            do {
                self.devices = try JSONDecoder().decode([DeviceModel].self, from: data)
            } catch let jsonError {
                print("Error serializing json:", jsonError)
            }
            
        }.resume()
    }
}
