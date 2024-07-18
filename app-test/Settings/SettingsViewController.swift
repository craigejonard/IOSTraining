//
//  SettingsViewController.swift
//  app-test
//
//  Created by FDC-Jonard-NC-Web on 7/18/24.
//

import UIKit

struct Setting {
    let name: String
    let img: UIImage
}

class SettingsViewController: UIViewController {

    var settings: [Setting] = [
        Setting(name: "Dark Mode", img: UIImage(named: "moonicon")!)
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "SettingsViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "SettingsViewCell")
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsViewCell", for: indexPath) as? SettingsViewCell {
            cell.settingsLabel.text = settings[indexPath.row].name
            cell.settingsImg.image = settings[indexPath.row].img
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    
}
