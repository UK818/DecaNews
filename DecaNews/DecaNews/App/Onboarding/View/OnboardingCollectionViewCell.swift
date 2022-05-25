//
//  OnboardingCollectionViewCell.swift
//  DecaNews
//
//  Created by Geniusjames on 22/01/2022.
//

import UIKit

final class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var onboardingBackgroundPicture: UIImageView!
    
    func configureViewCell(with slide: OnboardingSlide) {
        onboardingBackgroundPicture.image = UIImage(imageLiteralResourceName: slide.backDropImage)
    }
}
