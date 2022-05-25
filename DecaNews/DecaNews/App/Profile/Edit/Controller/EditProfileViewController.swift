//
//  EditProfilePageViewController.swift
//  DecaNews
//
//  Created by Decagon on 14/02/2022.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

final class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var fireStore: FireStorePersistence?
    var fireService: FirebaseService?
    var persistence = FireStorePersistence(collectionName: "userDetails")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOnLoad()
    }
    
    func setupOnLoad() {
        let user = fireService?.userDetails
        nameTextField.text = user?.displayName
        emailTextField.text = user?.email
    }
    
    func updateUserDetails() {
        let user = fireService?.userDetails
        user?.updateEmail(to: emailTextField.text ?? "", completion: nil)
        let setDetails = UserSetDetails(phoneNumber: phoneNumberTextField.text ?? "", bio: bioTextView.text ?? "", name: nameTextField.text ?? "")
        persistence.add(item: setDetails)
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Open camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        updateUserDetails()
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.sourceType = .camera
            image.mediaTypes = [UTType.image.identifier]
            self.present(image, animated: true, completion: nil)
            
        }
    }
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.sourceType = .photoLibrary
            image.delegate = self
            image.mediaTypes = [UTType.image.identifier]
            self.present(image, animated: true, completion: nil)
        }
    }
}

extension EditProfileViewController: Storyboardable {
    static var storyboard: Storyboard { .profile }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let editingImage = info[UIImagePickerController.InfoKey(rawValue: convertInfoKey(UIImagePickerController.InfoKey.editedImage))] as? UIImage {
            userAvatar.image = editingImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func convertImageToDict (_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map { key, value in (key.rawValue, value) })
    }
    
    func convertInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
    }
}
