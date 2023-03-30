//
//  Template.swift
//  VideoEditor
//
//  Created by Вячеслав on 30.03.2023.
//

import Foundation

enum Template: String {
    case cutCut
}


// MARK: - methods Template

extension Template: CaseIterable {
    static let count: Int = {
        return Template.allCases.count
    }()
    
    static subscript(_ index: Int) -> String {
        return Template.allCases[index].rawValue
    }
    
    static func getElement(atIndex index: Int) -> Template {
        return Template.allCases[index]
    }
}
