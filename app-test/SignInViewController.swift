//
//  SignInViewController.swift
//  app-test
//
//  Created by FDC-Jonard-NC-Web on 7/16/24.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func productListBtn(_ sender: Any) {
        let VC = ProductsViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func LoginOutletBtn(_ sender: Any) {
        let VC = CustomTabBarController()
//        VC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(VC, animated: true)
//        self.present(VC, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
