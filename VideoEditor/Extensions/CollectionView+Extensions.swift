//
//  CollectionView+Extensions.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import UIKit.UICollectionView


typealias CollectionViewDelegates
    = UICollectionViewDelegate
    & UICollectionViewDataSource
    & UICollectionViewDelegateFlowLayout

public extension UICollectionView {
    
    func subscribe(_ object: (UICollectionViewDelegate
                              & UICollectionViewDataSource)) {
        delegate = object
        dataSource = object
    }
    
    func dequeue<T: UICollectionReusableView>(cell: T.Type, indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: T.classDescription, for: indexPath) as? T
    }
    
    func registerCell<T: UICollectionReusableView>(_ cell: T.Type) {
        register(cell, forCellWithReuseIdentifier: cell.classDescription)
    }
    
}
