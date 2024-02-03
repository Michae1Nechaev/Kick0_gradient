//
//  ViewController.swift
//  NMAKickTask0
//
//  Created by Нечаев Михаил on 01.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private let squareView = SquareView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

}

private extension ViewController {
    func setupLayout() {
        view.addSubview(squareView)
        squareView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            squareView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            squareView.widthAnchor.constraint(equalToConstant: 100),
            squareView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

