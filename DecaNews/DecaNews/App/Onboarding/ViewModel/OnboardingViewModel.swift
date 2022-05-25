//
//  OnboardingViewModel.swift
//  DecaNews
//
//  Created by Geniusjames on 19/01/2022.
//

import Foundation

final class OnboardingViewModel {
    
    let userStore: UserPersistenceStore
    
    init(store: UserPersistenceStore) {
        self.userStore = store
    }
    
    var slides: [OnboardingSlide] {
        return makeSlides()
    }
    
    private func makeSlides() -> [OnboardingSlide] {
        [OnboardingSlide(title: "Discover Curated News", desctiption: "Keep up-to-date with the actual and valid news everyday", imageName: "button0", backDropImage: "onboarding0"),
         OnboardingSlide(title: "Update News Everyday", desctiption: "Get the recent news everyday with DecaNews", imageName: "button1", backDropImage: "onboarding1"),
         OnboardingSlide(title: "Browse by Categories", desctiption: "Get the recent news everyday with DecaNews", imageName: "button2", backDropImage: "onboarding2")
        ]
    }
    
    func completeOnboarding() {
        userStore.setUserOnboardingStatus()
    }
}
