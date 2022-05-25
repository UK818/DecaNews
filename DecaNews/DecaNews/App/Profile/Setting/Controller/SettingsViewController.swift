//
//  SettingsViewController.swift
//  DecaNews
//
//  Created by Decagon on 23/02/2022.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var didSelectSettingsOption: ((SettingOptions) -> Void)?
    
    @IBOutlet weak var tableView: UITableView!
    
    private let settingItems = SettingOptions.allCases
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
////
//    private func registerCell() {
//        let cell = UINib(nibName: "SettingsTableViewCell",
//                            bundle: nil)
//        self.tableView.register(cell,
//                                forCellReuseIdentifier: "SettingsTableViewCell")
//    }
//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        settingItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsSecondCell.identifier, for: indexPath) as? SettingsSecondCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = settingItems[indexPath.row].displayname
           
            return cell
        } else {

           guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell
            else {
                return UITableViewCell()
            }
            cell.titleLabel.text = settingItems[indexPath.row].displayname
            if settingItems[indexPath.row].displayname == "Logout" {
                cell.titleLabel.textColor = UIColor(named: "deepPeach")
            }
            let category = settingItems[indexPath.row].selection
            cell.selectionLabel.text = category
            return cell
        }
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as? SettingsTableViewCell else {
//            return UITableViewCell()}
//        cell.titleLabel.text = settingItems[indexPath.row].displayname
//        return cell
    }
    private func selectSetting(at index: Int) {
        let selectedSetting = settingItems[index]
        dismiss(animated: false) { [weak self] in
            self?.didSelectSettingsOption?(selectedSetting)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectSetting(at: indexPath.row)
    }
}

extension SettingsViewController: Storyboardable {
    static var storyboard: Storyboard { .settings }
}
