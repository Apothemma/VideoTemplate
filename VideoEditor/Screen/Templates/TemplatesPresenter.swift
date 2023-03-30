//
//  TemplatesPresenter.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

protocol TemplatesPresenterProtocol: PresenterProtocol {
    func didSelectCell(template: Template)
}

final class TemplatesPresenter {
    private weak var view: TemplatesViewControllerProtocol?
    private let router: TemplatesRouterProtocol
    private let templateService: TemplateService
    
    init(view: TemplatesViewControllerProtocol?, router: TemplatesRouterProtocol, templateService: TemplateService ) {
        self.view = view
        self.router = router
        self.templateService = templateService
    }
}

// MARK: - TemplatesProtocol

extension TemplatesPresenter: TemplatesPresenterProtocol {
    func viewDidLoad() {
        createModel()
    }
    
    func didSelectCell(template: Template) {
        router.showDetail(template: template, templateService: templateService)
    }
}

// MARK: - private

private extension TemplatesPresenter {
    func createModel() {
        let models = Template.allCases.map { template in
            let image = templateService.getCoverImage(for: template)
            return TemplatesModel(image: image, template: template)
        }
        view?.getModel(models)
    }
}
