//
//  TemplateDetailsBuilder.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import UIKit

struct TemplateDetailsBuilder {
    static func create(template: Template, templateService: TemplateService) -> UIViewController {
        let view = TemplateDetailsViewController()
        let router = TemplateDetailsRouter(view: view)
        let presenter = TemplateDetailsPresenter(view: view, router: router, template: template, templateService: templateService)
        
        view.presenter = presenter
        
        return view
    }
}
