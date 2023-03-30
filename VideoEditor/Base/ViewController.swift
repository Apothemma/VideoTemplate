//
//  ViewController.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
    }
}


// MARK: - private

private extension ViewController {
    func setBackgroundColor() {
        view.backgroundColor = .black
    }
}
