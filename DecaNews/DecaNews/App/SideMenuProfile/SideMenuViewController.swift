//
//  SideMenuViewController.swift
//  DecaNews
//
//  Created by Decagon on 08/02/2022.
//

import UIKit
import SideMenu

class SideMenuViewController: UIViewController, MenuControllerDelegate {
    private var sideMenu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuTableViewController(with: itemList)
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        menu.delegate = self
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    @IBAction func didTapSideMenu(_ sender: Any) {
        present(sideMenu!, animated: true)
    }
    func didSelectMenuItem(named: String) {
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            switch named {
            case "Home":
                self?.view.backgroundColor = .blue
            case "Saved News":
                self?.view.backgroundColor = .red
            case "Write News":
                self?.view.backgroundColor = .white
            case "Membership":
                self?.view.backgroundColor = .gray
            default:
                return
            }
        })
    }
    
    var itemList: [String] = ["Home",
                              "Saved News",
                              "Write News",
                              "Membership",
                              "Help",
                              "Settings",
                              "Logout",
                              "Version 1.0"
    ]
}
