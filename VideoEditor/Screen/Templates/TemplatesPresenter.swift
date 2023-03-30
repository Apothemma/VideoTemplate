//
//  TemplatesPresenter.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import Foundation

protocol TemplatesPresenterProtocol: PresenterProtocol {
    func didSelectCell(template: Template)
}


final class TemplatesPresenter {
    private weak var view: TemplatesViewControllerProtocol?
    private let router: TemplatesRouterProtocol
    
    init(view: TemplatesViewControllerProtocol?, router: TemplatesRouterProtocol) {
        self.view = view
        self.router = router
    }
}


// MARK: - TemplatesProtocol

extension TemplatesPresenter: TemplatesPresenterProtocol {
    func viewDidLoad() {
        createModel()
    }
    
    func didSelectCell(template: Template) {
        router.showDetail(template: template)
    }
    
    
}


// MARK: - private

private extension TemplatesPresenter {
    func createModel() {
        let models = Template.allCases.map { template in
            let image = TemplateService.shared.getCoverImage(for: template)
            return TemplatesModel(image: image, template: template)
        }
        view?.getModel(models)
    }
}
