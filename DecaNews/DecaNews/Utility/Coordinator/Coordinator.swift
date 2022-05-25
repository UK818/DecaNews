//
//  Coordinator.swift
//  DecaNews
//
//  Created by Decagon on 16/01/2022.
//

import UIKit

typealias Observable<T> = ((T) -> Void)
typealias CoordinatorTransition = (() -> Void)

class Coordinator: NSObject, UINavigationControllerDelegate {
    
    var didFinish: Observable<Coordinator>?
    
    var childCoordinators: [Coordinator] = []
    
    override init() { }
    
    func start() {}
    
    func finish() {
        didFinish?(self)
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) { }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) { }
    
    func pushCoordinator(_ coordinator: Coordinator, completion: (() -> Void)? = nil) {
        coordinator.didFinish = { [weak self] (coordinator) in
            self?.popCoordinator(coordinator)
            completion?()
        }
        
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    func popCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
