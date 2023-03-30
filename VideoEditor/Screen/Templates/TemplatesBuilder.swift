//
//  TemplatesBuilder.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import Foundation
import UIKit


struct TemplatesBuilder {
    static func create() -> UIViewController {
        let view = TemplatesViewController()
        let router = TemplatesRouter(view: view)
        let presenter = TemplatesPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}
