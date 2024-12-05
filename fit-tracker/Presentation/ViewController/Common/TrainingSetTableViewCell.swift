//
//  TrainingSetTableViewCell.swift
//  fit-tracker
//
//  Created by 小椋　隼 on 2024/11/24.
//

import UIKit

class TrainingSetTableViewCell: UITableViewCell, GetClassNameProtocol {

    @IBOutlet weak var setCount: UILabel!
    @IBOutlet weak var setData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("セットセルが初期化")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(dataForCell: TrainingHistory.TrainingSet, count: Int) {
        setCount.text = String(count)
        setData.text = "\(dataForCell.weight)kg × \(dataForCell.rep)reps"
    }
}
