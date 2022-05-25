//
//  SortByUIView.swift
//  DecaNews
//
//  Created by Decagon on 15/02/2022.
//

import UIKit

class SortByUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    private let searchNewsViewModel: SearchNewsViewModel
    var closePopUp: (() -> Void)?
    var populateTable: (() -> Void)?
    
    let cancelButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
//        button.imageView?.image = UIImage(systemName: "xmark")
        return button
    }()
    let sortByTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Sort By"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    let lineView: UIView = {
        let uiView = UIView(frame: .zero)
        uiView.backgroundColor = .gray
        return uiView
    }()
    
    let popularButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Popular", for: .normal)
        button.tag = 0
        return button
    }()
    let newestButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Newest", for: .normal)
        button.tag = 1
        return button
    }()
    let oldestButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Oldest", for: .normal)
        button.tag = 2
        return button
    }()
    let popularCheckMarkImage: CheckMarkImageView = {
        let imgView = CheckMarkImageView()
        return imgView
    }()
    let newestCheckMarkImage: CheckMarkImageView = {
        let imgView = CheckMarkImageView()
        return imgView
    }()
    let oldestCheckMarkImage: CheckMarkImageView = {
        let imgView = CheckMarkImageView()
        return imgView
    }()
    let resetButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 12
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Reset", for: .normal)
        return button
    }()
    let applyButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 12
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Apply", for: .normal)
        return button
    }()
    init(searchNewsViewModel: SearchNewsViewModel) {
        self.searchNewsViewModel = searchNewsViewModel
        super.init(frame: .zero)
        backgroundColor = .white
        addToView()
        constrainUpper()
        constrainMiddle()
        constrainBottom()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addToView() {
        addSubviews(cancelButton, sortByTextLabel, lineView, popularButton, oldestButton, newestButton, popularCheckMarkImage, oldestCheckMarkImage, newestCheckMarkImage, resetButton, applyButton)
        cancelButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        applyButton.addTarget(self, action: #selector(apply), for: .touchUpInside)
        popularButton.addTarget(self, action: #selector(selectPattern), for: .touchUpInside)
        oldestButton.addTarget(self, action: #selector(selectPattern), for: .touchUpInside)
        newestButton.addTarget(self, action: #selector(selectPattern), for: .touchUpInside)
        
        setCheckMark(0)
    }
    @objc
    func close() {
        closePopUp?()
    }
    @objc
    func reset() {
        searchNewsViewModel.setCurrentSortPattern(.popular)
        populateTable?()
        closePopUp?()
    }
    @objc
    func apply() {
        searchNewsViewModel.sort()
        populateTable?()
        closePopUp?()
    }
    @objc
    func selectPattern(_ sender: UIButton) {
        searchNewsViewModel.setCurrentSortPattern(SearchSortBy(rawValue: sender.tag) ?? .popular)
        setCheckMark(sender.tag)
    }

    func constrainUpper() {
        cancelButton.anchored(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 0))
        cancelButton.constrainWidth(constant: 24)
        cancelButton.constrainHeight(constant: 24)
        sortByTextLabel.anchored(top: cancelButton.topAnchor, leading: nil, bottom: nil, trailing: nil)
        sortByTextLabel.centerXInSuperview()
        lineView.anchored(top: sortByTextLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0))
        lineView.constrainHeight(constant: 2)
    }
    func constrainMiddle() {
        popularButton.anchored(top: lineView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 20, left: 24, bottom: 0, right: 0))
        popularCheckMarkImage.anchored(top: popularButton.topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 24))
        newestButton.anchored(top: popularButton.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 20, left: 24, bottom: 0, right: 0))
        newestCheckMarkImage.anchored(top: newestButton.topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 24))
        oldestButton.anchored(top: newestButton.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 20, left: 24, bottom: 0, right: 0))
        oldestCheckMarkImage.anchored(top: oldestButton.topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 24))
    }
    func constrainBottom() {
        resetButton.anchored(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: 24, bottom: 40, right: 0))
        resetButton.constrainHeight(constant: 48)
        resetButton.constrainWidth(constant: 155)
        applyButton.anchored(top: nil, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 24))
        applyButton.constrainHeight(constant: 48)
        applyButton.constrainWidth(constant: 155)
    }
    
    func setCheckMark(_ tag: Int) {
        switch tag {
        case 0:
            popularCheckMarkImage.setCheckMark(true)
            oldestCheckMarkImage.setCheckMark(false)
            newestCheckMarkImage.setCheckMark(false)
        case 1:
            popularCheckMarkImage.setCheckMark(false)
            oldestCheckMarkImage.setCheckMark(false)
            newestCheckMarkImage.setCheckMark(true)
        case 2:
            popularCheckMarkImage.setCheckMark(false)
            oldestCheckMarkImage.setCheckMark(true)
            newestCheckMarkImage.setCheckMark(false)
        default: return
        }
    }
}
