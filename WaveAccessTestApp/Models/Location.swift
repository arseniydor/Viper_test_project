//
//  Location.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//

import Foundation
import UIKit

struct Coordinates: Codable {
    var longitude: CGFloat
    var latitude: CGFloat
}

class Location: Codable {
    var name: String
    var category: String
    var city: String
    var state: String
    var id: Int
    var park: String
    var coordinates: Coordinates
    var imageName: String
    var isFavorite: Bool
    
    func getImage() -> UIImage? {
        UIImage(named: imageName)
    }
}
