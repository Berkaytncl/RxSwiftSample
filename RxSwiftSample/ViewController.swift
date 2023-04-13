//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by Berkay Tuncel on 13.04.2023.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

     @IBOutlet weak var tableView: UITableView!

     private let viewModel = ListViewModel()
     
     private let disposedBag = DisposeBag()
    
     override func viewDidLoad() {
          super.viewDidLoad()
          configureTableView()
     }
          
     fileprivate func configureTableView() {
          //TODO: bind tableView
          viewModel.listItems.bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { row, item, cell in
               cell.textLabel?.text = item.model
               cell.detailTextLabel?.text = item.brand
          }.disposed(by: disposedBag)
          
          //TODO: fetch items
          viewModel.fetchItems()
          
          //TODO: handle selection
          tableView.rx.modelSelected(ListModel.self).bind { selectedItem in
               print("Selected car is \(selectedItem.brand) \(selectedItem.model)")
          }.disposed(by: disposedBag)
     }
}

