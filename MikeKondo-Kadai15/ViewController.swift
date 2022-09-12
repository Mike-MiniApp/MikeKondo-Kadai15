//
//  ViewController.swift
//  MikeKondo-Kadai15
//
//  Created by 近藤米功 on 2022/09/07.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - UI Parts
    @IBOutlet private weak var fruitTableView: UITableView!

    private var fruits = [Fruit(name: "りんご", isCheck: false),
                         Fruit(name: "みかん", isCheck: true),
                         Fruit(name: "バナナ", isCheck: false),
                         Fruit(name: "パイナップル", isCheck: true)]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFruitTableView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            switch segue.identifier {
            case "InputFruit":
                guard let navigation = segue.destination as? UINavigationController else { return }
                guard let select = navigation.topViewController as? InputFruitViewController else { return }
                select.delegate = self
            default:
                break
            }
        }

    private func setupFruitTableView() {
        fruitTableView.delegate = self
        fruitTableView.dataSource = self
        fruitTableView.register(UINib(nibName: FruitTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: FruitTableViewCell.identifier)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FruitTableViewCell.identifier, for: indexPath) as? FruitTableViewCell else {
            fatalError("The dequeued cell is not instance")
        }
        cell.configure(fruit: fruits[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if fruits[indexPath.row].isCheck {
            fruits[indexPath.row].isCheck = false
        } else {
            fruits[indexPath.row].isCheck = true
        }
        fruitTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - InputFruitViewControllerDelegate
extension ViewController: InputFruitViewControllerDelegate {
    func didSaveFruit(name: String) {
        fruits.append(Fruit(name: name, isCheck: false))
        fruitTableView.reloadData()
    }
}
