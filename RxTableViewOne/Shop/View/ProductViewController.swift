//
//  ProductViewController.swift
//  RxTableViewOne
//
//  Created by Mahdi Mahjoobe on 12/9/18.
//  Copyright © 2018 Mahdi Mahjoobe. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProductViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let bag = DisposeBag()
    private let viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rx.setDelegate(self).disposed(by: bag)
        
        bindTableView()
    }
    
    private func bindTableView() {
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        
        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "cellId", cellType: ProductTableViewCell.self)) { (row,item,cell) in
            cell.item = item
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(Product.self).subscribe(onNext: { item in
            print("SelectedItem: \(item.name)")
        }).disposed(by: bag)
        
        viewModel.fetchProductList()
    }


}

extension ProductViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

