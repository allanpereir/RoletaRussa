//
//  HistoricoController.swift
//  RoletaRussa
//
//  Created by Alan Silva on 31/07/21.
//

import Foundation

class HitoricoController{
    
    private var dadosJSON: dataRecord?
    
    let historicoController: Controller = Controller()
    
    var count: Int {
        return dadosJSON?.productList.count ?? 0
    }
    var valor: Double{
        return dadosJSON?.totalValue ?? 0.0
    }
    
    func importaData(){
        let jsonData = readLocalJSONFile(forName: "JSONData")
        
        if let data = jsonData {
            if let recordObj = parse(jsonData: data){
                  dadosJSON = recordObj
                
            }
        }
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

        
    
}
