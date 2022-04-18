//
//  DeviceDetailViewModel.swift
//  1ValetPOC
//
//  Created by Lucas C Barros on 16/04/22.
//

import Foundation

protocol DeviceDetailViewModelProtocol {
    var device: DeviceModel? { get set }
}

class DeviceDetailViewModel: DeviceDetailViewModelProtocol {
    var device: DeviceModel?

    init(device: DeviceModel? = nil) {
        self.device = device
    }
}
