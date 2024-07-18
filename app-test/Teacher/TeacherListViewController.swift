//
//  TeacherListViewController.swift
//  app-test
//
//  Created by FDC-Jonard-NC-Web on 7/16/24.
//

import UIKit

struct Teacher {
    let name: String
    let country: String
    let image: UIImage
}

class TeacherListViewController: UIViewController {

    var teachers: [Teacher] = [
        Teacher(name: "Eri Ng", country: "United Stated", image: UIImage(named: "ering")!),
        Teacher(name: "Doug Gie", country: "Philippines", image: UIImage(named: "dougie")!)
    ]
    
    var ads: [UIImage] = [
        UIImage(named: "ad1")!,
        UIImage(named: "ad2")!
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TeacherCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "TeacherCell")
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AdsBannerCell")
        // Do any additional setup after loading the view.
    }

}

extension TeacherListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // We have two sections: one for ads and one for teachers
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return ads.count // Number of ads
        } else {
            return teachers.count // Number of teachers
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // Ads section
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdsBannerCell", for: indexPath)
            cell.imageView?.image = ads[indexPath.row]
            return cell
        } else {
            // Teachers section
            if let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell", for: indexPath) as? TeacherCell {
                cell.accessoryType = .disclosureIndicator
                cell.teacherName.text = teachers[indexPath.row].name
                cell.teacherCountry.text = teachers[indexPath.row].country
                cell.teacherImage.image = teachers[indexPath.row].image
                return cell
            }
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            // Only handle selection for teacher cells
            let teacherDetailVC = TeacherDetailsViewController()
            teacherDetailVC.delegate = self
            teacherDetailVC.teacher = teachers[indexPath.row]
            navigationController?.pushViewController(teacherDetailVC, animated: true)
        }
    }
    
    // If you want headers for each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Ads"
        } else {
            return "Teachers"
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.section == 1 {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
                self?.confirmDelete(at: indexPath, completionHandler: completionHandler)
            }
            
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            configuration.performsFirstActionWithFullSwipe = false
            
            return configuration
        }
        return nil // No swipe actions for ads
    }
    
    func deleteItem(at indexPath: IndexPath) {
        teachers.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func confirmDelete(at indexPath: IndexPath, completionHandler: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: "Confirm Delete", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
                
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
            // Perform the delete action
            self?.deleteItem(at: indexPath)
            completionHandler(true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            completionHandler(false)
        }
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

extension TeacherListViewController: TeacherDetailsViewControllerDelegate {
    func didReportTeacher() {
        print("Teacher reported")
    }
    
    func didAddToFavorite() {
        print("Teacher favorited 2")
    }
    
    
}
