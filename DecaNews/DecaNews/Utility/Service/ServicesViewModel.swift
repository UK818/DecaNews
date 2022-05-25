//
//  ViewModel.swift
//  DecaNews
//
//  Created by mac on 16/01/2022.
//

import Foundation

final class ServicesViewModel {
    
    let firebaseService: AuthServiceRepository
    
    private let defaultsStorage = UserDefaults.standard
    private let topicStorage = "selectedTopics"
    private let onboardingStorage = "onboarded"
    private let signedInStorage = "signedInStatus"
    private let settingsStorage = "settings"
    
    private let fStyle = "fontStyle"
    private let fSize = "fontSize"
    private let bNess = "brightness"
    private let tColor = "themeColor"

    init(firebaseService: AuthServiceRepository) {
        self.firebaseService = firebaseService
    }
    
    var getTopics: [String]? {
        return find(topicStorage) as [String]?
    }

    var getOnboardedStatus: Bool {
        if find(onboardingStorage) as Bool? != nil {
            return true
        }
        return false
    }

    var getSignedStatus: Bool {
        if let signedInStatus = find(signedInStorage) as Bool? {
            return signedInStatus
        }
        return false
    }

    var getSettings: [String: Int]? {
        return find(settingsStorage) as [String: Int]?
    }
    
    var getFontSize: Int {
        guard let settings = getSettings, let fontSize = settings[fSize] else {
            return 16
        }
        return fontSize
    }
    
    var getFontStyle: String {
        guard let settings = getSettings, let fontStyle = settings[fStyle] else {
            return "Sans"
        }
        return fontStyle == 0 ? "Sans" : "Serif"
    }
    
    var getThemeColor: String {
        guard let settings = getSettings, let themeColor = settings[tColor] else {
            return "white"
        }
        return themeColor <= 1 ? "white" : "black"
    }
    
    var getBrightness: Int {
        guard let settings = getSettings, let brightness = settings[bNess] else {
            return 50
        }
        return brightness
    }

    func add(topics: [String]) {
        add(topics, topicStorage)
    }

    func addOnboarded() {
        add(true, onboardingStorage)
    }

    func signIn() {
        add(true, signedInStorage)
    }

    func signOut() {
        add(false, signedInStorage)
    }

    func add(settings: [String: Int]) {
        add(settings, settingsStorage)
    }

    func add<T: Encodable>(_ items: T, _ storage: String) {
        let encodedItems = try? JSONEncoder().encode(items)
        guard let encodedItems = encodedItems else {
            return
        }
        defaultsStorage.set(encodedItems, forKey: storage)
    }

    func find<T: Decodable>(_ key: String) -> T? {
        guard let data = defaultsStorage.object(forKey: key) as? Data else {
            return nil
        }
        let decodedItem = try? JSONDecoder().decode(T.self, from: data)
        return decodedItem
    }
}
