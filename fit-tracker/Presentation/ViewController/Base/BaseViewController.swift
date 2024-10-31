//
//  BaseViewController.swift
//  fit-tracker
//
//  Created by 小椋　隼 on 2024/10/30.
//

import UIKit

/// ビューの基幹部分（TabBarとNavBar）を設定するVC
class BaseViewController: UITabBarController, GetClassNameProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBaseViewController()
    }
    
    // TabBarControllerの設定
    private func setupBaseViewController() -> Void {
        // TabBar押下時の見た目セットアップ
        tabBar.tintColor = UIColor.darkGray
        tabBar.backgroundColor = UIColor.systemBackground
        
        // ホーム画面タブ
        let homeSB = UIStoryboard(name: HomeViewController.className, bundle: nil)
        let homeVC = homeSB.instantiateViewController(withIdentifier: HomeViewController.className)
        let homeNC = setUpNavBar(rootVC: homeVC)
        
        // メニュー管理タブ
        let manageMenuSB = UIStoryboard(name: ManageMenuViewController.className, bundle: nil)
        let manageMenuVC = manageMenuSB.instantiateViewController(withIdentifier: ManageMenuViewController.className)
        let manageMenuNC = setUpNavBar(rootVC: manageMenuVC)
        
        // 履歴タブ
        let calendarSB = UIStoryboard(name: CalendarViewController.className, bundle: nil)
        let calendarVC = calendarSB.instantiateViewController(withIdentifier: CalendarViewController.className)
        
        // 設定タブ
        let settingSB = UIStoryboard(name: SettingViewController.className, bundle: nil)
        let settingVC = settingSB.instantiateViewController(withIdentifier: SettingViewController.className)
        
        viewControllers = [homeNC, manageMenuNC, calendarVC, settingVC]
    }
    
    // NavigationControllerとNavBarの見た目設定
    private func setUpNavBar(rootVC: UIViewController) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootVC)
        
        let appearance = UINavigationBarAppearance()
        // 背景を白に
        appearance.backgroundColor = UIColor.white
        // NavBarの下線を削除
        appearance.shadowColor = nil
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.standardAppearance = appearance
        
        return navigationController
    }
}
