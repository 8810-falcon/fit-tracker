//
//  TrainingHistoryTableViewCell.swift
//  fit-tracker
//
//  Created by 小椋　隼 on 2024/10/30.
//

import UIKit

class TrainingHistoryTableViewCell: UITableViewCell, GetClassNameProtocol {
    
    // 部位表示用View
    @IBOutlet weak var trainingPartView: UIView!
    // 部位
    @IBOutlet weak var trainigPartLabel: UILabel!
    // メニュー名
    @IBOutlet weak var menuName: UILabel!
    // セット情報
    @IBOutlet weak var setData: UILabel!
    
    /// トレーニング履歴セル種別
    enum CellType {
        /// 部位見出しあり、メニュー名あり
        case withBodyPart
        /// 部位見出しなし、メニュー名あり
        case withMenuName
        /// 部位見出しなし、メニュー名なし
        case withoutMenuName
    }
    
    /// トレーニング履歴セル用のViewModel
    struct TrainingHistoryCellModel {
        /// 部位
        let part: String
        /// メニュー名
        let menuName: String
        /// 重さ
        private let weight: Double
        /// 回数
        private let rep: Int
        /// セット情報（表示用）
        var setData: String {
            return "\(weight)kg × \(rep)reps"
        }
        /// トレーニング履歴セル種別
        let cellType: CellType
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(cellModel: TrainingHistoryCellModel) {
        
        switch cellModel.cellType {
        case .withBodyPart:
            self.trainigPartLabel.text = cellModel.part
            self.menuName.text = cellModel.menuName
        case .withMenuName:
            self.trainingPartView.isHidden = true
            self.menuName.text = cellModel.menuName
        case .withoutMenuName:
            self.trainigPartLabel.isHidden = true
            self.menuName.isHidden = true
        }
        self.setData.text = cellModel.setData
    }
    
}
