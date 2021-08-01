//
//  importArquivoJSON.swift
//  RoletaRussa
//
//  Created by Alan Silva on 31/07/21.
//

import Foundation

// MARK: - Helper methods for reading & parsing the JSON file.

/// Method to read the local json file.
/// - Parameter name: file name
/// - Returns: return file contents in Data format.
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
