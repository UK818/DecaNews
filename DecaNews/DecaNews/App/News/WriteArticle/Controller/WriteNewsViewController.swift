//
//  WriteNewsViewController.swift
//  DecaNews
//
//  Created by JustifiedTech on 2/21/22.
//

import Foundation
import UIKit

class WriteNewsViewController: UIViewController {
    
    private let viewLayout = WriteNewsControllerLayout()
   
    var imageData: Data?
    var image: UIImage?
    var writeNewsViewModel: WriteNewsViewModel?
    var news: PreviewModel?
    var imageUrl: String = ""
    
    // MARK: - Coordinator Closures
    var navigateToPreview: CoordinatorTransition?
    var navigateToPickTopic: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Write News"
        setupNavBarButtons()
        setActionsEvents()
        setupLayoutConstraints()
        setValues()
    }
 
    func setupNavBarButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Preview", style: .plain, target: self, action: #selector(preview))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "deepPeach")
    }
    
    @objc func preview() {
        news = PreviewModel(title: viewLayout.titleField.text ?? "Hell", content: viewLayout.contentField.text ?? "Content", topic: viewLayout.topicField.text, image: image)
        navigateToPreview?()
    }
    
    @objc func pickTopic() {
        navigateToPickTopic?()
    }
    
    @objc func pickImage() {
      showImagePickerControllerActionSheet()
    }
    
    @objc func loadTopics() {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        AlertService.showAlert(style: .alert, title: "Choose topic", message: "Make", actions: [cancelAction], completion: nil)
    }
    
    func setActionsEvents() {
        viewLayout.publishButton.addTarget(self, action: #selector(publishNews), for: .touchUpInside)
        viewLayout.uploadButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        viewLayout.topicField.addTarget(self, action: #selector(pickTopic), for: .allTouchEvents)
    }

    func setValues() {
        if viewLayout.coverImage.image != nil {
            viewLayout.uploadLabel.text = "Change Image"
            viewLayout.uploadLabel.font  = UIFont.preferredFont(forTextStyle: .body)
            viewLayout.uploadLabel.textColor = UIColor(named: "themeWhite")
            viewLayout.uploadButton.imageView?.tintColor = UIColor(named: "themeWhite")
            viewLayout.imageView.backgroundColor = UIColor(named: "black")?.withAlphaComponent(0.5)
       }
    }
    
    @objc func publishNews() {
        print("loading")
         writeNewsViewModel?
            .uploadImage(image: imageData!, completionHandler: uploadData(_:))
         if imageUrl != "" {
             print("uploading..")
             writeNewsViewModel?
                 .saveToFirebase(title: viewLayout.titleField.text ?? "title", topic: viewLayout.topicField.text ?? "topic", content: viewLayout.contentField.text ?? "Content", cover: imageUrl, saveData(_:))
         }

        print("done")
    }

    func saveData(_ result: Result<String, Error>) {
        switch result {
        case .success(let id):
           print(id)
            resetAllField()
        case .failure(let error):
            print("\(error.localizedDescription)")
        }
    }
    
    func uploadData(_ result: Result<String, Error>) {
        switch result {
        case .success(let id):
            imageUrl = id
        case .failure(let error):
            print("\(error.localizedDescription)")
        }
    }
    
    func resetAllField() {
        viewLayout.titleField.text = ""
        viewLayout.contentField.text = ""
        viewLayout.topicField.text = ""
        imageData = nil
        image = nil
        imageUrl = ""
    }

    fileprivate func setupLayoutConstraints() {
        view.addSubview(viewLayout)
        viewLayout.fillSuperview()
    }
}

extension WriteNewsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func showImagePickerControllerActionSheet() {
        let photoLibraryAction = UIAlertAction(title: "Choose from library ", style: .default) { (_) in
                   self.showImagePickerController(sourceType: .photoLibrary)
               }
               let cameraAction = UIAlertAction(title: "Use camera", style: .default) { (_) in
                   self.showImagePickerController(sourceType: .camera)
               }
               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
               AlertService.showAlert(style: .actionSheet, title: nil, message: nil, actions: [photoLibraryAction, cameraAction, cancelAction], completion: nil)
    }
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            viewLayout.coverImage.image = editedImage
            image = editedImage
            imageData = editedImage.pngData()
        } else  if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            viewLayout.coverImage.image = originalImage
            image = originalImage
            imageData = originalImage.pngData()
        }
        
        dismiss(animated: true, completion: setValues)
    }
}
