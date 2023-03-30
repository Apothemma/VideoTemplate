//
//  TemplatesCell.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import UIKit
import SnapKit

final class TemplatesCell: UICollectionViewCell {
    private lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with: UIImage?) {
        coverImageView.image = with
    }
}

// MARK: - private

private extension TemplatesCell {
    func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 20
        
        contentView.subviews(coverImageView)
        
        coverImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
