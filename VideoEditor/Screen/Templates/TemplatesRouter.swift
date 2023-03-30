//
//  TemplatesRouter.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import Foundation


import UIKit


protocol TemplatesRouterProtocol: AnyObject {
    func showDetail(template: Template)
}


final class TemplatesRouter {
    
    private let view: UIViewController?
    
    init(view: UIViewController?) {
        self.view = view
    }
}


// MARK: - TemplatesRouterProtocol

extension TemplatesRouter: TemplatesRouterProtocol {
    func showDetail(template: Template) {
        let detailViewController = TemplateDetailsBuilder.create(template: template)
        view?.show(detailViewController, sender: .some(self))        
    }
}
