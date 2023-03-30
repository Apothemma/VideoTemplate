//
//  Array+Extensions.swift
//  VideoEditor
//
//  Created by Вячеслав on 30.03.2023.
//

import Foundation


extension Array {
    subscript (safe index: Index) -> Element {
        return 0 <= index && index < count ? self[index] : self[0]
    }
}
