//
//  TemplateDetailsViewController.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import UIKit
import SnapKit

protocol TemplateDetailsViewControllerProtocol: AnyObject {
    func setTitle(template: String)
    func setBackgroundImage(_ photo: UIImage?)
    func setImage(_ photo: UIImage?)

}

final class TemplateDetailsViewController: ViewController {
    
    var presenter: TemplateDetailsPresenterProtocol?
    
    private lazy var templateBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var templateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var loadingView = LoadingView(title: title)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        presenter?.viewDidDisappear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidAppear(true)
    }
}

// MARK: - TemplateDetailsViewControllerProtocol

extension TemplateDetailsViewController: TemplateDetailsViewControllerProtocol {
    func setTitle(template: String) {
        let title = App.Title.templateDetail + template.uppercased()
        setupTitle(title: title)
    }
    
    func setBackgroundImage(_ photo: UIImage?) {
        templateBackgroundImageView.image = photo
    }
    
    func setImage(_ photo: UIImage?) {
        templateImageView.image = photo
    }
}

// MARK: - private

private extension TemplateDetailsViewController {
    
    func setupUI() {
        setupNavigationBackButton()
        
        view.subviews(loadingView, templateBackgroundImageView, templateImageView)
        
        templateBackgroundImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constants.imageViewBottomInset)
        }
        
        templateImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constants.imageViewBottomInset)
        }
    }
    
    func setupNavigationBackButton() {
        let backImage = UIImage(named: App.Image.backButton)
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonPressed))
        navigationController?.navigationBar.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
    }
    
    func setupTitle(title: String) {
        navigationItem.title = title
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

// MARK: - @objc

@objc
private extension TemplateDetailsViewController{
    func backButtonPressed() {
        presenter?.backButtonPressed()
    }
}

// MARK: - Constants

private extension TemplateDetailsViewController {
    enum Constants {
        static let imageViewBottomInset: CGFloat = UIScreen.main.bounds.width / 8
    }
}
