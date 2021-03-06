//
//  HistoricoController.swift
//  RoletaRussa
//
//  Created by Alan Silva on 31/07/21.
//

import Foundation

class ContaController{
    
    private var dadosJSON: dataRecord?
    
//    let historicoController: Controller = Controller()
    
    var count: Int {
        return dadosJSON?.productList.count ?? 0
    }
    var valorConta: Double{
        //return dadosJSON?.totalValue ?? 10.00
        return dadosJSON?.totalValue ?? 1.00
    }
    
    func loadCurrentProduto(indexPah: IndexPath) -> produto?{
        return self.dadosJSON?.productList[indexPah.row]
    }
    
    func getTipo(indexPah: IndexPath) -> String{
        if self.dadosJSON?.productList[indexPah.row].productType == "BEBIDA" {
            return "beer"
        }else {
            return "dish"
        }
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
    func parse(jsonData: Data) -> dataRecord? {
        do {
            let decoderData = try JSONDecoder().decode(dataRecord.self, from: jsonData)
            return decoderData
        }catch {
            print("erro:\(error)")
        }
        return nil
    }

}
