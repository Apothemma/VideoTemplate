//
//  UIView+Extensions.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//


import UIKit.UIView

extension UIView {
    func subviews(_ object: UIView...) {
        object.forEach {
            addSubview($0)
        }
    }
}
