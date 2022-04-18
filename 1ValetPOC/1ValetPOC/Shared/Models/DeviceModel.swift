//
//  DeviceModel.swift
//  1ValetPOC
//
//  Created by Lucas C Barros on 16/04/22.
//

import Foundation

struct DeviceModel: Decodable {
    let id: Int?
    let name: String?
    let type: String?
    let access: String?
    let image: String?
    let isFavorite: Bool?
    let description: String?
}
