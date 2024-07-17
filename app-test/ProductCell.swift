//
//  ProductCell.swift
//  app-test
//
//  Created by FDC-Jonard-NC-Web on 7/17/24.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    
    var product: Product? {
        didSet {
            displayData()
        }
    }
    override func awakeFromNib() {
        
        productLabel.text = product?.productName
        
        super.awakeFromNib()
        productLabel.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        // Initialization code
        
    }
    
    func displayData() {
        guard let product = product else {
            return
        }
        
        productLabel.text = product.productName
        productImage.image = product.productImg
    }
}
