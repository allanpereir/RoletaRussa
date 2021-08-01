//
//  DataRecord.swift
//  RoletaRussa
//
//  Created by Alan Silva on 31/07/21.
//

import Foundation

struct dataRecord: Codable{
    let totalValue: Double
    let productList: [produto]
}
struct produto: Codable {
    let productID: String
    let productType: String
    let date: String
    let name: String
    let price: Double
    let quantity: Int
}

