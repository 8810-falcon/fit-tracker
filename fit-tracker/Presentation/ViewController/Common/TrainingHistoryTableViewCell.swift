//
//  TrainingHistoryTableViewCell.swift
//  fit-tracker
//
//  Created by 小椋　隼 on 2024/10/30.
//

import UIKit

class TrainingHistoryTableViewCell: UITableViewCell, GetClassNameProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuLabel: UILabel!
    
    private var data: [TrainingHistory.TrainingSet] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureTableView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // 子テーブルビューの状態をリセット
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.reloadData()
    }
    
    func configureTableView() {
        
        tableView.isScrollEnabled = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: TrainingSetTableViewCell.className, bundle: nil), forCellReuseIdentifier: TrainingSetTableViewCell.className)
    }
    
    func configureCell(dataForCell: TrainingHistory) {
        
        menuLabel.text = dataForCell.trainingMenuName
        self.data = dataForCell.trainingSetList
        print(self.data)
        self.tableView.reloadData()
    }
}

extension TrainingHistoryTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(data.count)
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TrainingSetTableViewCell.className) as? TrainingSetTableViewCell ?? {
            assertionFailure("登録済みのセルが取得できない")
            return TrainingSetTableViewCell()
        }()
        
        cell.configureCell(dataForCell: data[indexPath.row], count: indexPath.row)
        print("セル更新")
        return cell
    }
}
