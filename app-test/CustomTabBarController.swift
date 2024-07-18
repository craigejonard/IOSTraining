//
//  CustomTabBarController.swift
//  app-test
//
//  Created by FDC-Jonard-NC-Web on 7/18/24.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        let teacherListVC = setupTab(for: TeacherListViewController(),
                                     with: .red,
                                     title: "First",
                                     imageName: "1.circle",
                                     tag: 0)
        
        let productListVC = setupTab(for: ProductsViewController(),
                                     with: .green,
                                     title: "Second",
                                     imageName: "2.circle",
                                     tag: 1)
        
        let settingsVC = setupTab(for: SettingsViewController(),
                                     with: .blue,
                                     title: "Third",
                                     imageName: "3.circle",
                                     tag: 2)
        
        viewControllers = [teacherListVC, productListVC, settingsVC]
    }
    
    func setupTab(for viewController: UIViewController,
                  with color: UIColor,
                  title: String,
                  imageName: String,
                  tag: Int) -> UIViewController {
        
        viewController.view.backgroundColor = color
        viewController.tabBarItem = UITabBarItem(title: title,
                                                 image: UIImage(systemName: imageName),
                                                 tag: tag)
    
        return viewController
    }

}
