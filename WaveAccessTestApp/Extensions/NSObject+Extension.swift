//
//  NSObject+Extension.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//

import Foundation

extension NSObject {
    public class var nameOfClass: String {
        String(describing: self)
    }

    public var nameOfClass: String {
        String(describing: type(of: self))
    }
}
