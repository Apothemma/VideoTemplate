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
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
        activityIndicatorView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-25)
            make.centerX.equalToSuperview()
        }
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
