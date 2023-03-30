//
//  TemplateDetailsRouter.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import Foundation
import UIKit


protocol TemplateDetailsRouterProtocol: AnyObject {
    func popDetail(animated: Bool)
}


final class TemplateDetailsRouter {
    
    private let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}


// MARK: - TemplateDetailsRouterProtocol

extension TemplateDetailsRouter: TemplateDetailsRouterProtocol {
    func popDetail(animated: Bool) {
        view.navigationController?.popViewController(animated: animated)
    }
}
