//
//  TaskProgressIndicator.swift
//  DecaNews
//
//  Created by Geniusjames on 16/03/2022.
//

import Foundation
import SVProgressHUD

final class HUD {
    class func show() {
        DispatchQueue.main.async {
            SVProgressHUD.setDefaultStyle(.custom)
            SVProgressHUD.setDefaultMaskType(.custom)
            SVProgressHUD.setBackgroundColor(.gray)
            SVProgressHUD.setForegroundColor(.white)
            SVProgressHUD.setBackgroundLayerColor(.black.withAlphaComponent(0.15))
            SVProgressHUD.show()
        }
    }
    
    class func hide() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
