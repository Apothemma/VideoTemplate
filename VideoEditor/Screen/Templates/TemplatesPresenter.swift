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
    }
    
    func didSelectCell(template: Template) {
        router.showDetail(template: template)
    }
    
    
}


// MARK: - private

private extension TemplatesPresenter {
    
}
