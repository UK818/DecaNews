//
//  DetailsSettingsView.swift
//  DecaNews
//
//  Created by Decagon on 10/02/2022.
//

import UIKit

class DetailsSettingsView: UIView {
    var dismiss: (() -> Void)?
    var fontStyle = 0
    var fontSize = 20
    var brightness = 50
    var themeColor = 0
    private let fStyle = "fontStyle"
    private let fSize = "fontSize"
    private let bNess = "brightness"
    private let tColor = "themeColor"
    let serviceViewModel = DIContainer.makeServiceViewModel()
    let customViewLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.text = "Customize your view"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    let fontStyleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Font Style"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    let sansButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(named: "grey")
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Sans", for: .normal)
        button.tag = 0
        return button
    }()
    let serifButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(named: "grey")
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Serif", for: .normal)
        button.tag = 1
        return button
    }()
    let fontSizeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Font Size"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    let brightnessLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Brightness"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    let themeColorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Theme Color"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    let doneButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Done", for: .normal)
        return button
    }()
    let smallALabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "A"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    let bigALabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "A"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    let fontSizeSlider: UISlider = {
        let slider = UISlider(frame: .zero)
        let img = UIImage(systemName: "circle.fill")
        slider.setThumbImage(img, for: .normal)
        slider.thumbTintColor = .black
        slider.minimumTrackTintColor = .black
        slider.minimumValue = 16
        slider.maximumValue = 22
        return slider
    }()
    let fontSizeBackgroundView: UIView = {
        let uiview = SettingsBackgroundUIView()
        return uiview
    }()
    let brightnessBackgroundView: UIView = {
        let uiview = SettingsBackgroundUIView()
        return uiview
    }()
    let themeColorBackgroundView: UIView = {
        let uiview = SettingsBackgroundUIView()
        return uiview
    }()
    let minImageView: UIImageView = {
        let imgView = UIImageView(frame: .zero)
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = UIImage(systemName: "sun.min")
        imgView.tintColor = .black
        return imgView
    }()
    let maxImageView: UIImageView = {
        let imgView = UIImageView(frame: .zero)
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = UIImage(systemName: "sun.max")
        imgView.tintColor = .black
        return imgView
    }()
    let brightnessSlider: UISlider = {
        let slider = UISlider(frame: .zero)
        slider.setThumbImage(UIImage(systemName: "circle.fill"), for: .normal)
        slider.thumbTintColor = .black
        slider.minimumTrackTintColor = .black
        slider.minimumValue = 0
        slider.maximumValue = 100
        return slider
    }()
    let whiteColorButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.layer.cornerRadius = 20
        button.tag = 0
        return button
    }()
    let lightGreyColorButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 5
        button.layer.cornerRadius = 20
        button.tag = 1
        return button
    }()
    let darkGreyColorButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 5
        button.layer.cornerRadius = 20
        button.tag = 2
        return button
    }()
    let blackColorButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.layer.cornerRadius = 20
        button.tag = 3
        return button
    }()
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = 10
        addSubviews(fontSizeBackgroundView, brightnessBackgroundView, themeColorBackgroundView, customViewLabel, fontStyleLabel, sansButton, serifButton, fontSizeLabel, brightnessLabel, themeColorLabel, doneButton)
        fontSizeBackgroundView.addSubviews(smallALabel, bigALabel, fontSizeSlider)
        brightnessBackgroundView.addSubviews(minImageView, brightnessSlider, maxImageView)
        themeColorBackgroundView.addSubviews(whiteColorButton, lightGreyColorButton, darkGreyColorButton, blackColorButton)
        constrainCustomLabel()
        constrainfontStyleLabel()
        constrainSansSerifButtons()
        constrainfontSizeLabel()
        constrainFontSizeSlider()
        constrainBrightnessLabel()
        constrainBrightnessSlider()
        constrainThemeLabel()
        constrainThemeView()
        constrainDoneButton()
        sansSerifButtonsSetup()
        themeButtonsSetup()
        doneButton.addTarget(self, action: #selector(applySettings), for: .touchUpInside)
        setSettings()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setSettings() {
        if let settings = serviceViewModel.getSettings, let st = settings[fStyle], let si = settings[fSize], let bn = settings[bNess], let tc = settings[tColor] {
            fontStyle = st
            fontSize = si
            brightness = bn
            themeColor = tc
        } else {
            brightness = Int(brightnessSlider.value)
            fontSize = Int(fontSizeSlider.value)
        }
        toggleTheme(themeColor)
        toggleFont(fontStyle)
        brightnessSlider.value = Float(brightness)
        fontSizeSlider.value = Float(fontSize)
    }
    @objc func applySettings() {
        persistSettings()
        dismiss?()
    }
    func persistSettings() {
        var store = [String: Int]()
        store[fStyle] = fontStyle
        store[fSize] = Int(fontSizeSlider.value)
        store[tColor] = themeColor
        store[bNess] = Int(brightnessSlider.value)
        serviceViewModel.add(settings: store)
        UIScreen.main.brightness = CGFloat(Float(brightnessSlider.value) / 100.0)
    }
    func themeButtonsSetup() {
        whiteColorButton.addTarget(self, action: #selector(changeTheme), for: .touchUpInside)
        lightGreyColorButton.addTarget(self, action: #selector(changeTheme), for: .touchUpInside)
        darkGreyColorButton.addTarget(self, action: #selector(changeTheme), for: .touchUpInside)
        blackColorButton.addTarget(self, action: #selector(changeTheme), for: .touchUpInside)
    }
    @objc func changeTheme(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        themeColor = button.tag
        toggleTheme(button.tag)
    }
    func toggleTheme(_ tag: Int) {
        emptyAll()
        switch tag {
        case 0:
            setButtonImageAndTint(button: whiteColorButton)
        case 1:
            setButtonImageAndTint(button: lightGreyColorButton)
        case 2:
            setButtonImageAndTint(button: darkGreyColorButton)
        case 3:
            setButtonImageAndTint(button: blackColorButton)
        default:
            return
        }
    }
    func setButtonImageAndTint(button: UIButton) {
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.tintColor = .red
    }
    func emptyAll() {
        whiteColorButton.setImage(nil, for: .normal)
        lightGreyColorButton.setImage(nil, for: .normal)
        darkGreyColorButton.setImage(nil, for: .normal)
        blackColorButton.setImage(nil, for: .normal)
    }
    func sansSerifButtonsSetup() {
        sansButton.addTarget(self, action: #selector(changeFont), for: .touchUpInside)
        serifButton.addTarget(self, action: #selector(changeFont), for: .touchUpInside)
    }
    @objc func changeFont(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        fontStyle = button.tag
        toggleFont(button.tag)
    }
    func toggleFont(_ tag: Int) {
        if tag == 0 {
            sansButton.setTitleColor(.red, for: .normal)
            serifButton.setTitleColor(.black, for: .normal)
        } else {
            sansButton.setTitleColor(.black, for: .normal)
            serifButton.setTitleColor(.red, for: .normal)
        }
    }
}
extension DetailsSettingsView {
    func constrainCustomLabel() {
        customViewLabel.centerXInSuperview()
        customViewLabel.anchored(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
    }
    func constrainfontStyleLabel() {
        fontStyleLabel.anchored(top: customViewLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 32, left: 16, bottom: 0, right: 0))
    }
    func constrainSansSerifButtons() {
        print(String(Int(frame.width)) + " is width")
        sansButton.anchored(top: fontStyleLabel.bottomAnchor, leading: fontStyleLabel.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
        sansButton.constrainWidth(constant: (327 - 34) / 2)
        serifButton.anchored(top: fontStyleLabel.bottomAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 16))
        serifButton.constrainWidth(constant: (327 - 34) / 2)
        
    }
    func constrainfontSizeLabel() {
        fontSizeLabel.anchored(top: sansButton.bottomAnchor, leading: sansButton.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
    }
    func constrainFontSizeSlider() {
        fontSizeBackgroundView.anchored(top: fontSizeLabel.bottomAnchor, leading: fontSizeLabel.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 16))
        fontSizeBackgroundView.constrainHeight(constant: 40)
        smallALabel.anchored(top: fontSizeBackgroundView.topAnchor, leading: fontSizeBackgroundView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 0))
        bigALabel.anchored(top: fontSizeBackgroundView.topAnchor, leading: nil, bottom: nil, trailing: fontSizeBackgroundView.trailingAnchor, padding: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 4))
        fontSizeSlider.constrainWidth(constant: 207)
        fontSizeSlider.constrainHeight(constant: 6)
        fontSizeSlider.centerYInSuperview()
        fontSizeSlider.centerXInSuperview()
    }
    func constrainBrightnessLabel() {
        brightnessLabel.anchored(top: fontSizeBackgroundView.bottomAnchor, leading: fontSizeBackgroundView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
    }
    func constrainBrightnessSlider() {
        brightnessBackgroundView.anchored(top: brightnessLabel.bottomAnchor, leading: brightnessLabel.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 16))
        brightnessBackgroundView.constrainHeight(constant: 40)
        minImageView.anchored(top: nil, leading: fontSizeBackgroundView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0))
        minImageView.centerYInSuperview()
        maxImageView.anchored(top: nil, leading: nil, bottom: nil, trailing: fontSizeBackgroundView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8))
        maxImageView.centerYInSuperview()
        brightnessSlider.constrainWidth(constant: 207)
        brightnessSlider.constrainHeight(constant: 6)
        brightnessSlider.centerYInSuperview()
        brightnessSlider.centerXInSuperview()
    }
    func constrainThemeLabel() {
        themeColorLabel.anchored(top: brightnessBackgroundView.bottomAnchor, leading: brightnessBackgroundView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
    }
    func constrainThemeView() {
        themeColorBackgroundView.anchored(top: themeColorLabel.bottomAnchor, leading: brightnessLabel.leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 16))
        themeColorBackgroundView.constrainHeight(constant: 56)
        whiteColorButton.anchored(top: nil, leading: themeColorBackgroundView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        whiteColorButton.constrainWidth(constant: 40)
        whiteColorButton.constrainHeight(constant: 40)
        whiteColorButton.centerYInSuperview()
        lightGreyColorButton.anchored(top: nil, leading: whiteColorButton.trailingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 0))
        lightGreyColorButton.constrainWidth(constant: 40)
        lightGreyColorButton.constrainHeight(constant: 40)
        lightGreyColorButton.centerYInSuperview()
        darkGreyColorButton.anchored(top: nil, leading: lightGreyColorButton.trailingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 0))
        darkGreyColorButton.constrainWidth(constant: 40)
        darkGreyColorButton.constrainHeight(constant: 40)
        darkGreyColorButton.centerYInSuperview()
        blackColorButton.anchored(top: nil, leading: nil, bottom: nil, trailing: themeColorBackgroundView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20))
        blackColorButton.constrainWidth(constant: 40)
        blackColorButton.constrainHeight(constant: 40)
        blackColorButton.centerYInSuperview()
    }
    func constrainDoneButton() {
        doneButton.anchored(top: nil, leading: themeColorBackgroundView.leadingAnchor, bottom: bottomAnchor, trailing: themeColorBackgroundView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 24, right: 0))
        doneButton.constrainHeight(constant: 48)
    }
}
