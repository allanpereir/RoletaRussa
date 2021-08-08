//
//  HistoricoController.swift
//  RoletaRussa
//
//  Created by Alan Silva on 06/08/21.
//

import Foundation

class HistoricoController{
    
    private var dadosJSON: historicoDataRecord?
    
    var countHistorico: Int{ 
        return dadosJSON?.historyAccountList.count ?? 0
        
    }
    
    func loadHistorico(indexPath: IndexPath) -> historico?{        
        return self.dadosJSON?.historyAccountList[indexPath.row]
    }
    
    
    /// Parse the jsonData using the JSONDecoder with help of sampleRecord model
    /// - Parameter jsonData: jsonData object
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileURL = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileURL)
                return data
            }
        }catch {
                print("erro:\(error)")
        }
        return nil
    }

    func importaData(value: String){
            let jsonData = readLocalJSONFile(forName: value)

            if let data = jsonData {
                if let recordObj = parse(jsonData: data){
                     dadosJSON = recordObj
                }
            }
    }
    
    /// Parse the jsonData using the JSONDecoder with help of sampleRecord model
    /// - Parameter jsonData: jsonData object
    func parse(jsonData: Data) -> historicoDataRecord? {
        do {
            let decoderData = try JSONDecoder().decode(historicoDataRecord.self, from: jsonData)
            return decoderData
        }catch {
            print("erro:\(error)")
        }
        return nil
    }

}

