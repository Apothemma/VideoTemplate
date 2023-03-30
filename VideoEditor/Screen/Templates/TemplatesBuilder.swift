//
//  TemplatesBuilder.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import UIKit

struct TemplatesBuilder {
    static func create(templateService: TemplateService) -> UIViewController {
        let view = TemplatesViewController()
        let router = TemplatesRouter(view: view)
        let presenter = TemplatesPresenter(view: view,
                                           router: router,
                                           templateService: templateService)
        view.presenter = presenter
        
        return view
    }
}
