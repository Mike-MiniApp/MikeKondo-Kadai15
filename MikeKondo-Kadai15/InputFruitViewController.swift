//
//  InputFruitViewController.swift
//  MikeKondo-Kadai15
//
//  Created by 近藤米功 on 2022/09/08.
//

import UIKit
protocol InputFruitViewControllerDelegate: AnyObject {
    func didSaveFruit(name: String)
}

class InputFruitViewController: UIViewController {
    @IBOutlet private weak var fruitTextField: UITextField!
    weak var delegate: InputFruitViewControllerDelegate?

    @IBAction private func didSaveFruitButton(_ sender: Any) {
        guard let fruitName = fruitTextField.text else { return }
        delegate?.didSaveFruit(name: fruitName)
        dismiss(animated: true)
    }

    @IBAction private func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
