//
//  UIImage+Extensions.swift
//  VideoEditor
//
//  Created by Вячеслав on 30.03.2023.
//

import UIKit.UIImage

extension UIImage {
    func resize(size: CGSize? = nil, insets: UIEdgeInsets = .zero, fill: UIColor = .white) -> UIImage {
      var size: CGSize = size ?? self.size
      let widthRatio  = size.width / self.size.width
      let heightRatio = size.height / self.size.height
    
      if widthRatio > heightRatio {
        size = CGSize(width: floor(self.size.width * heightRatio), height: floor(self.size.height * heightRatio))
      } else if heightRatio > widthRatio {
        size = CGSize(width: floor(self.size.width * widthRatio), height: floor(self.size.height * widthRatio))
      }
    
      let rect = CGRect(x: 0,
                        y: 0,
                        width: size.width + insets.left + insets.right,
                        height: size.height + insets.top + insets.bottom)
    
      UIGraphicsBeginImageContextWithOptions(rect.size, false, scale)
    
      fill.setFill()
      UIGraphicsGetCurrentContext()?.fill(rect)
    
      draw(in: CGRect(x: insets.left,
                      y: insets.top,
                      width: size.width,
                      height: size.height))
      let newImage = UIGraphicsGetImageFromCurrentImageContext()
    
      UIGraphicsEndImageContext()
    
      return newImage!
    }
}
