//
//  Images.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//

import Foundation
import UIKit

enum Image: String, Codable {
    case charleyrivers = "charleyrivers"
    case chilkoottrail = "chilkoottrail"
    case chincoteague = "chincoteague"
    case hiddenlake = "hiddenlake"
    case icybay = "icybay"
    case lakemcdonald = "lakemcdonald"
    case rainbowlake = "rainbowlake"
    case silversalmoncreek = "silversalmoncreek"
    case stmarylake = "stmarylake"
    case twinlake = "twinlake"
    case umbagog = "umbagog"
    
    func getImage() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}
