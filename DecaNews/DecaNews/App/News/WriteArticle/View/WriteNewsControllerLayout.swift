//
//  WriteNewsControllerLayout.swift
//  DecaNews
//
//  Created by JustifiedTech on 2/22/22.

import Foundation
import UIKit

class WriteNewsControllerLayout: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        setUpScrollView()
        setUpContentView()
        setupStyle()
        setUpView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UILabels
    
    var uploadTitle: UILabel = {
        var label = UILabel()
        return label
    }()
    
    var uploadLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    lazy var topicLabel: UILabel = {
        var label = UILabel()
        return label
    }()

    // MARK: - UITextFields
    
    var titleField: TextFieldPadding = {
        let textField = TextFieldPadding()
        return textField
    }()
    
    var topicField: TextFieldPadding = {
        let textField = TextFieldPadding()
        return textField
    }()
    
    // MARK: - UITextView
    
    var contentField: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.smartDashesType = .default
        textView.dataDetectorTypes = .all
        textView.smartQuotesType = .yes
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.systemGray.withAlphaComponent(0.2).cgColor
        textView.textAlignment = .natural
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.heightAnchor.constraint(equalToConstant: 170).isActive = true
        return textView
    }()
    
    // MARK: - UIImageView
    lazy var coverImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
//        image.image = UIImage(named: "profile")
        image.layer.cornerRadius = 10
        image.layer.borderWidth = 1
        image.layer.masksToBounds = true
        image.layer.borderColor = .init(gray: 200, alpha: 1)
        return image
    }()
    
    // MARK: - UIView
    
    lazy var imageView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.systemGray.withAlphaComponent(0.2).cgColor
        view.backgroundColor = UIColor.systemGray.withAlphaComponent(0)
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - UIStackView
    
    lazy var titleStack: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(titleField)
        return stackView
    }()
    
    lazy var topicStack: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(topicLabel)
        stackView.addArrangedSubview(topicField)
        return stackView
    }()
    
    lazy var contentStack: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(contentLabel)
        stackView.addArrangedSubview(contentField)
        return stackView
    }()
    
    // MARK: - UIButton
   lazy var uploadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
       button.setImage(UIImage(systemName: "icloud.and.arrow.up"), for: .normal)
       button.tintColor = .black
        return button
        
    }()
    
    lazy var publishButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Publish", for: .normal)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.backgroundColor = UIColor(named: "black")
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - Functions

    func uniformFieldStyle(_ field: TextFieldPadding, _ placeHolder: String) {
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocorrectionType = .no
        field.layer.borderWidth = 0.2
        field.layer.cornerRadius = 10
        field.placeholder = placeHolder
        field.rightViewMode = .always
        field.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func uniformStackStyle(_ stackView: UIStackView) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.contentMode = .scaleToFill
        stackView.spacing = 10
    }
    
    func uniformLabelStyle(_ label: UILabel, _ text: String) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    func activateConstraint(_ list: [NSLayoutConstraint]) {
            NSLayoutConstraint.activate(list)
    }
    
    func setupStyle() {
        topicField.rightView = arrow_downward
        uniformFieldStyle(titleField, "Write title")
        uniformFieldStyle(topicField, "Add topic")
        uniformStackStyle(titleStack)
        uniformStackStyle(topicStack)
        uniformStackStyle(contentStack)
        uniformLabelStyle(uploadTitle, "Upload cover image")
        uniformLabelStyle(titleLabel, "Title")
        uniformLabelStyle(contentLabel, "Content")
        uniformLabelStyle(topicLabel, "Topic")
        uniformLabelStyle(uploadLabel, "Upload PDF, PNG, JPG, MP4 (max 5MB)")
    }
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setUpScrollView() {
        scrollView.addSubview(contentView)
        self.addSubview(scrollView)
        let layout = self.safeAreaLayoutGuide
        activateConstraint([
            scrollView.topAnchor.constraint(equalTo: layout.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: layout.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: layout.trailingAnchor)
        ])
    }
    
    func setUpContentView() {
        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        contentViewCenterY.priority = .defaultLow
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: self.heightAnchor)
        contentViewHeight.priority = .defaultLow
      
        activateConstraint([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentViewCenterY,
            contentViewHeight
        ])
    }
    
    func setUpView() {
        contentView.addSubviews(uploadTitle, coverImage, imageView, titleStack, contentStack, topicStack, uploadButton, uploadLabel, publishButton)
        
        backgroundColor = .white
        
        activateConstraint([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            uploadTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            uploadTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            uploadTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            coverImage.topAnchor.constraint(equalTo: uploadTitle.bottomAnchor, constant: 10),
            coverImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            coverImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            coverImage.heightAnchor.constraint(equalToConstant: 200),
            
            imageView.topAnchor.constraint(equalTo: uploadTitle.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            uploadButton.topAnchor.constraint(equalTo: uploadTitle.bottomAnchor, constant: 50),
            uploadButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            uploadButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            uploadLabel.topAnchor.constraint(equalTo: uploadButton.bottomAnchor, constant: 20),
            uploadLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            uploadLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
    
            titleStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),

            topicStack.topAnchor.constraint(equalTo: contentStack.bottomAnchor, constant: 10),
            topicStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            topicStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            contentStack.topAnchor.constraint(equalTo: titleStack.bottomAnchor, constant: 10),
            contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            contentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            publishButton.topAnchor.constraint(equalTo: topicStack.bottomAnchor, constant: 15),
            publishButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            publishButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
}
