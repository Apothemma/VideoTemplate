//
//  LoadingView.swift
//  VideoEditor
//
//  Created by Вячеслав on 30.03.2023.
//

import UIKit
import SnapKit


class LoadingView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .systemOrange
        label.textAlignment = .center
        return label
    }()
    
    private lazy var activityIndicatorView : UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .medium)
        indicatorView.color = .systemOrange
        return indicatorView
    }()

    init(title: String?) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .clear
        setupUI(title: saveTitle(title))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - private

private extension LoadingView {
    
    func setupUI(title: String) {
        titleLabel.text = title
        
        subviews(titleLabel, activityIndicatorView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30)
        ])
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30)
        ])
        activityIndicatorView.startAnimating()
        
    }
    
    func saveTitle(_ title: String?) -> String {
        var saveTitle = ""
        if let title {
            saveTitle = title
        } else {
            saveTitle = "Loading..."
        }
        return saveTitle
    }
}
