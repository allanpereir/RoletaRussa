//
//  HistoricoDataRecord.swift
//  RoletaRussa
//
//  Created by Alan Silva on 05/08/21.
//

import Foundation

struct historicoDataRecord: Codable{
    let totalValue: Double
    let hitoricoList: [produto]
}

struct historico: Codable {
    let historyID: String
    let date: String
    let nome: String
    let price: Double
    let iconImage: String
}

