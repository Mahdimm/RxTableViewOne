//
//  ProductTableViewCell.swift
//  RxTableViewOne
//
//  Created by Mahdi Mahjoobe on 12/10/18.
//  Copyright © 2018 Mahdi Mahjoobe. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        holderView.layer.cornerRadius = 10
        productImg.layer.cornerRadius = productImg.frame.width / 2
        productImg.clipsToBounds = true
    }
    
    var item: Product! {
        didSet {
            setProductData()
        }
    }

    private func setProductData() {
        productImg.image = UIImage(named: item.imageName)
        nameLbl.text = item.name
        priceLbl.text = item.price
    }
}
