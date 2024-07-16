//
//  TeacherDetailsViewController.swift
//  app-test
//
//  Created by FDC-Jonard-NC-Web on 7/16/24.
//

import UIKit

class TeacherDetailsViewController: UIViewController {

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
