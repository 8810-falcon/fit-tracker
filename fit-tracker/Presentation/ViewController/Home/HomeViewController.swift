//
//  HomeViewController.swift
//  fit-tracker
//
//  Created by 小椋　隼 on 2024/10/30.
//

import UIKit

class HomeViewController: UIViewController, GetClassNameProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    // データリスト
    var data: [TrainingHistory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
    }
    
    private func configureNavBar() {
        let titleView = UIView()
        
        let imageView = UIImageView(image: UIImage(named: "logo_image"))
        imageView.contentMode = .scaleAspectFit
        
        titleView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            
            // 高さを指定
            imageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        navigationItem.titleView = titleView
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: TrainingHistoryTableViewCell.className, bundle: nil), forCellReuseIdentifier: TrainingHistoryTableViewCell.className)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
