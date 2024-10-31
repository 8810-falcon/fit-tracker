//
//  SplashViewController.swift
//  fit-tracker
//
//  Created by 小椋　隼 on 2024/10/30.
//

import UIKit

/// スプラッシュビュー用VC
class SplashViewController: UIViewController, GetClassNameProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TabBarControllerとNavigationControllerを設定
        let vc = BaseViewController()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {

            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first {
                window.rootViewController = vc
                window.makeKeyAndVisible()
            }
        }
        
    }
}
