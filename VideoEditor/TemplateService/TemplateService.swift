//
//  TemplateService.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import UIKit
import AVFoundation
import CoreML
import CoreImage.CIFilterBuiltins



enum Template: String {
    case cutCut
}


final class TemplateService {
    static var shared: TemplateService = TemplateService()
    
    func getImages(for template: Template, _ images: [UIImage?]? = nil) -> [[UIImage?]] {
        
        switch template {
        case .cutCut: return getCutCutTemplateImages(images)
        }
    }
    
    func getCoverImage(for template: Template) -> UIImage? {
        
        switch template {
        case .cutCut:
            let image = UIImage(named: App.Image.coverCutCutTemplate)
            return image
        }
    }
    
    func getTemplateMusicURL(for template: Template) -> URL {
        
        switch template {
        case .cutCut: return getMusicURL(forResource: App.Music.cutCutTemplate, withExtension: "mp3")

        }
    }
    
}


// MARK: - private

private extension TemplateService {
    
    @available(iOS 14.0, *)
    func getCutCutTemplateImages(_ images: [UIImage?]? = nil) -> [[UIImage?]] {
        var output = [[UIImage?]]()
        
        var photos = [UIImage?]()
        if images == nil {
            for i in 0..<Constants.defoultCutCutImagesCount {
                let photo = UIImage(named: App.Image.cutCutTemplateImage(i))
                photos.append(photo)
            }
            output.append(photos)
        }
        
        if let clearPhotos = RemoveBackground.shared.forUIImage(images: photos) {
            output.append(clearPhotos)
        }
        
        return output
    }
    
    func getMusicURL(forResource: String, withExtension: String) -> URL {
        let path = Bundle.main.path(forResource: forResource, ofType: withExtension)
        let url = URL(fileURLWithPath: path!)
        return url
    }
    
        
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


// MARK: - Constants

private extension TemplateService {
    enum Constants {
        static let defoultCutCutImagesCount: Int = 8
    }
}

