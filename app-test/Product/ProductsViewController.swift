//
//  ProductsViewController.swift
//  app-test
//
//  Created by FDC-Jonard-NC-Web on 7/17/24.
//

import UIKit

struct Product {
    let productImg: UIImage
    let productName: String
}

class ProductsViewController: UIViewController {

    var products: [Product] = [
        Product(productImg: UIImage(named: "surf")!, productName: "Surf"),
        Product(productImg: UIImage(named: "ariel")!, productName: "Ariel")
    ]
    
    @IBOutlet weak var productView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productView.delegate = self
        productView.dataSource = self
        
        let nib = UINib(nibName: "ProductCell", bundle: nil)
        self.productView.register(nib, forCellWithReuseIdentifier: "ProductCell")
        // Do any additional setup after loading the view.
    }
    
    
}

extension ProductsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            cell.product = products[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let item_width = (collectionView.bounds.width-20)/3
//        return CGSize(width: item_width, height: item_width)
        
        let numberOfColumns: Int
        let deviceWidth = view.frame.width
        
        if deviceWidth > 600 {
            numberOfColumns = 4
        } else {
            numberOfColumns = 2
        }
        
        let spacing: CGFloat = 10
        let totalSpacing = (CGFloat(numberOfColumns - 1) * spacing)
        let itemWidth = (deviceWidth - totalSpacing) / CGFloat(numberOfColumns)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productDetail = ProductDetailViewController()
        
    }
    
    
}
