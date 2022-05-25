//
//  PreviewController.swift
//  DecaNews
//
//  Created by JustifiedTech on 2/21/22.
//
import Foundation
import UIKit

class PreviewController: UIViewController {
    
    private let viewLayout = PreviewControllerLayout()
    var news: PreviewModel?
    
    var goBack: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Preview"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "black")
        setValues()
        //        setupLayoutConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        setupLayoutConstraints()
    }
    
    func setValues() {
        viewLayout.newsTitle.text = news?.title
        viewLayout.newsDetails.text = news?.content
        viewLayout.newsCover.image = news?.image
        
    }
    
    fileprivate func setupLayoutConstraints() {
        view.addSubview(viewLayout)
        viewLayout.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([viewLayout.topAnchor.constraint(equalTo: view.topAnchor),
                                     viewLayout.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     viewLayout.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     viewLayout.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                                    ])
    }
    
    @objc func back() {
        goBack?()
    }
}
