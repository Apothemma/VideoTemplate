//
//  RemoveBackground.swift
//  VideoEditor
//
//  Created by Вячеслав on 30.03.2023.
//

import Foundation
import CoreML
import CoreImage.CIFilterBuiltins
import UIKit

final class RemoveBackground {
    
    static let shared = RemoveBackground()
    
    private lazy var mlModel = try? segmentation_8bit()
    private lazy var cacheUIIMage = [UIImage: UIImage]()
    
    @available(iOS 14.0, *)
    func forUIImage(images: [UIImage?]) -> [UIImage]? {
        
        guard let mlModel else { return nil }
        var clearImages = [UIImage]()
        
        for image in images {
            guard let image else { return nil }
            
            if let imageInCache = cacheUIIMage[image] {
                clearImages.append(imageInCache)
                
            } else {
                cacheUIIMage[image] = UIImage()
                
                let resizedImage: UIImage = image.resize(size: .init(width: 1024, height: 1024))
                        
                guard
                    let resizedCGImage = resizedImage.cgImage,
                    let originalCGImage = image.cgImage,
                    let resultMask = try? mlModel.prediction(input: segmentation_8bitInput(imgWith: resizedCGImage)) else {
                    return nil
                }
                
                let originalImage = CIImage(cgImage: originalCGImage)
                var maskImage = CIImage(cvPixelBuffer: resultMask.var_2274)
                        
                let scaleX = originalImage.extent.width / maskImage.extent.width
                let scaleY = originalImage.extent.height / maskImage.extent.height
                maskImage = maskImage.transformed(by: .init(scaleX: scaleX, y: scaleY))

                let context = CIContext(options: nil)
                        
                guard let inputCGImage = context.createCGImage(originalImage, from: originalImage.extent) else {
                    return nil
                }
                
                let blendFilter = CIFilter.blendWithRedMask()
                
                blendFilter.inputImage = CIImage(cgImage: inputCGImage)
                blendFilter.maskImage = maskImage
                
                guard let outputCIImage = blendFilter.outputImage?.oriented(.up),
                      let outputCGImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) else {
                    return nil
                }
                
                cacheUIIMage[image] = UIImage(cgImage: outputCGImage)
                clearImages.append(UIImage(cgImage: outputCGImage))
            }
        }
        return clearImages
        
    }
}
