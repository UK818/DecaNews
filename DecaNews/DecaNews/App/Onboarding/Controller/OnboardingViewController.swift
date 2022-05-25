//
//  OnboardingViewController.swift
//  DecaNews
//
//  Created by Geniusjames on 17/01/2022.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    // MARK: -
    var viewModel: OnboardingViewModel!
    var didCompleteOnboarding: CoordinatorTransition?
    
    // MARK: - Outlets
    @IBOutlet var indicators: [UILabel]!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOnLoad()
    }
    
    private func setupOnLoad() {
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        proceedButton.addTarget(self, action: #selector(proceedToDashboard), for: .touchUpInside)
    }
    
    @objc private func proceedToDashboard() {
        didCompleteOnboarding?()
        viewModel.completeOnboarding()
    }
    
    private func updateView(with slide: OnboardingSlide) {
        titleLabel.text = slide.title
        descriptionLabel.text = slide.desctiption
        let proceedImage = UIImage(imageLiteralResourceName: slide.imageName)
        proceedButton.setImage(proceedImage, for: .normal)
    }
    
    @IBAction func skipButtonPressed(_ sender: Any) {
        proceedToDashboard()
    }
}

extension OnboardingViewController: Storyboardable {
    static var storyboard: Storyboard { .onboarding }
}

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.viewIdentifier, for: indexPath) as? OnboardingCollectionViewCell
        else { return UICollectionViewCell() }
        cell.configureViewCell(with: viewModel.slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        updateView(with: viewModel.slides[indexPath.row])
        indicators.enumerated().forEach { (index, indicator) in
            indicator.backgroundColor = indexPath.row == index ? .black : .gray
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width - 5
        let itemHeight = collectionView.bounds.height
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
