//
//  TeacherDetailsViewController.swift
//  app-test
//
//  Created by FDC-Jonard-NC-Web on 7/16/24.
//

import UIKit

protocol TeacherDetailsViewControllerDelegate{
    func didReportTeacher(_ teacher: Teacher)
    func didAddToFavorite()
}

extension TeacherDetailsViewControllerDelegate {
    func didAddToFavorite() {}
}

class TeacherDetailsViewController: UIViewController {
    
    var delegate: TeacherDetailsViewControllerDelegate?
    var teacher: Teacher?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var teacherCountry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let teacher = teacher {
            imageView.image = teacher.image
            teacherName.text = teacher.name
            teacherCountry.text = teacher.country
        }
        
        let reportButton = UIBarButtonItem(title: "Report",
                                           style: .plain,
                                           target: self,
                                           action: #selector(didTapReport))
        
        let favoriteButton = UIBarButtonItem(title: "Favorite",
                                             style: .plain,
                                             target: self,
                                             action: #selector(didTapFavorite))
        
        self.navigationItem.rightBarButtonItems = [
            reportButton,
            favoriteButton
        ]
    }

    @objc private func didTapReport() {
        self.delegate?.didReportTeacher()
    }
    
    @objc private func didTapFavorite() {
        self.delegate?.didAddToFavorite()
    }

}
