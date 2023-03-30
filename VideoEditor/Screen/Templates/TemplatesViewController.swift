//
//  TemplatesViewController.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import UIKit
import SnapKit

protocol TemplatesViewControllerProtocol: AnyObject {
    
}

final class TemplatesViewController: ViewController {
    
    var presenter: TemplatesPresenterProtocol?
    
    private lazy var templateCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.collectionViewItemSpacing
        layout.itemSize = CGSize(width: Constants.cellWidth,
                                 height: Constants.cellHeight)
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.registerCell(TemplatesCell.self)
        collectionView.backgroundColor = .clear
        collectionView.subscribe(self)
        collectionView.contentInset = UIEdgeInsets(top: 0,
                                                   left: Constants.collectionViewLeftRightInset,
                                                   bottom: 0,
                                                   right: Constants.collectionViewLeftRightInset)
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        setupUI()
    }
    
}

// MARK: - TemplatesViewControllerProtocol

extension TemplatesViewController: TemplatesViewControllerProtocol {
    
}


// MARK: - private

private extension TemplatesViewController {
    
    func setupUI() {
        setupNavigationItem()
                
        view.subviews(templateCollectionView)

        templateCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupNavigationItem() {
        setupTitle()
    }
    
    func setupTitle() {
        navigationItem.title = App.Title.templates
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
}


// MARK: - CollectionViewDelegates

extension TemplatesViewController: CollectionViewDelegates {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return Template.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeue(cell: TemplatesCell.self, indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        cell.configure(with: Template.getElement(atIndex: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectCell(template: Template.getElement(atIndex: indexPath.item))
    }
    
    
}


// MARK: - Constants

private extension TemplatesViewController {
    enum Constants {
        static let collectionViewLeftRightInset: CGFloat = 20
        static let collectionViewItemSpacing: CGFloat = 20
        static var cellWidth: CGFloat {
            UIScreen.main.bounds.width / 2 - 30
        }
        static var cellHeight: CGFloat {
            UIScreen.main.bounds.height / 3
        }
    }
}
