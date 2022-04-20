//
//  LocationService.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//

import Foundation

class LocationService {
    
    private let fileName: String = "landmarkData"
    
    func retrieveLocations() -> [Location]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Location].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
