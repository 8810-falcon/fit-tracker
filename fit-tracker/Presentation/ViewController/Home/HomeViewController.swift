//
//  HomeViewController.swift
//  fit-tracker
//
//  Created by 小椋　隼 on 2024/10/30.
//

import UIKit
import Foundation

class HomeViewController: UIViewController, GetClassNameProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    // データリスト
    var data: [TrainingHistory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        // Mockデータセット
        createMockData()
        
        configureTableView()
    }
    
    // TODO: 消す
    private func createMockData() {
        
        let history1 = TrainingHistory(
            trainingMenuName: "ベンチプレス",
            trainingDate: "2024/10/30",
            trainingSetList: [
                TrainingHistory.TrainingSet(weight: 70.0, rep: 8),
                TrainingHistory.TrainingSet(weight: 65.0, rep: 8),
                TrainingHistory.TrainingSet(weight: 60.0, rep: 12),
                TrainingHistory.TrainingSet(weight: 60.0, rep: 10),
            ]
        )
        data.append(history1)
        let history2 = TrainingHistory(
            trainingMenuName: "インクラインプレス",
            trainingDate: "2024/10/30",
            trainingSetList: [
                TrainingHistory.TrainingSet(weight: 65.0, rep: 8),
                TrainingHistory.TrainingSet(weight: 60.0, rep: 7),
                TrainingHistory.TrainingSet(weight: 50.0, rep: 10),
                TrainingHistory.TrainingSet(weight: 55.0, rep: 12),
            ]
        )
        data.append(history2)
        let history3 = TrainingHistory(
            trainingMenuName: "スクワット",
            trainingDate: "2024/10/30",
            trainingSetList: [
                TrainingHistory.TrainingSet(weight: 100.0, rep: 8),
                TrainingHistory.TrainingSet(weight: 80.0, rep: 8),
                TrainingHistory.TrainingSet(weight: 70.0, rep: 12),
                TrainingHistory.TrainingSet(weight: 60.0, rep: 10),
            ]
        )
        data.append(history3)
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
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TrainingHistoryTableViewCell.className) as? TrainingHistoryTableViewCell ?? {
            assertionFailure("登録済みのセルが取得できない")
            return TrainingHistoryTableViewCell()
        }()

        // セルに情報をセット
        cell.configureCell(dataForCell: data[indexPath.row])

        return cell
    }
}
