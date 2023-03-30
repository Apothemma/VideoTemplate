//
//  TemplatesRouter.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import UIKit

protocol TemplatesRouterProtocol: AnyObject {
    func showDetail(template: Template, templateService: TemplateService)
}

final class TemplatesRouter {
    private let view: UIViewController?
    
    init(view: UIViewController?) {
        self.view = view
    }
}

// MARK: - TemplatesRouterProtocol

extension TemplatesRouter: TemplatesRouterProtocol {
    func showDetail(template: Template, templateService: TemplateService) {
        let detailViewController = TemplateDetailsBuilder.create(template: template, templateService: templateService)
        view?.show(detailViewController, sender: .some(self))        
    }
}
