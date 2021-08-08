//
//  HistoricoDataRecord.swift
//  RoletaRussa
//
//  Created by Alan Silva on 05/08/21.
//

import Foundation

struct historicoDataRecord: Codable{
    let totalValue: Double
    let historyAccountList: [historico]
}

struct historico: Codable {
    let historyID: String
    let date: String
    let name: String
    let price: Double
    let iconImage: String
}

//"historyID": "9a157e36-7279-41d0-9d30-5310e9afd6321",
//"date": "2020-11-24T00:00:00.000",
//"name": "Bar da Mooca",
//"price": 250.10,
//"iconImage": "url-image-mooca"
