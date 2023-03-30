//
//  App.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import Foundation

struct App {
    struct Image {
        static let backButton = "backButton"
        static let coverCutCutTemplate = "coverCutCutTemplateImage"
        
        static func cutCutTemplateImage(_ number: Int) -> String {
            let correctNumber = number % 8 + 1
            return "cutCutTemplateImage\(correctNumber)"
        }
    }
    
    struct Title {
        static let templates = "Templates"
        static let templateDetail = "Template "
    }
    
    struct Music {
        static let cutCutTemplate = "cutCutTemplateMusic"
    }
}
