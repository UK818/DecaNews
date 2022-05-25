//
//  MenuDelegate.swift
//  DecaNews
//
//  Created by Decagon on 08/02/2022.
//

import Foundation
protocol MenuControllerDelegate: AnyObject {
    func didSelectMenuItem(named: String)
}
