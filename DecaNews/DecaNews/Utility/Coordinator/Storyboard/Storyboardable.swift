//
//  Storyboardable.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 18/02/2022.
//

import UIKit

protocol Storyboardable {
    static var storyboard: Storyboard { get }
    static var storyboardBundle: Bundle { get }
    static var storyboardIdentifier: String { get }
    static func instantiate() -> Self
}

extension Storyboardable where Self: UIViewController {
    
    static var storyboardBundle: Bundle {
        return .main
    }
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        guard let viewController = UIStoryboard(name: storyboard.identifier, bundle: storyboardBundle).instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to Instantiate View Controller With Storyboard Identifier \(storyboardIdentifier)")
        }
        return viewController
    }
}
