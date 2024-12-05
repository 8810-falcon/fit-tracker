//
//  TrainingHistory.swift
//  fit-tracker
//
//  Created by 小椋　隼 on 2024/10/30.
//

import Foundation

struct TrainingHistory {
    
    // トレーニングメニュー名
    let trainingMenuName: String
    
    // トレーニング実施日YYYYMMDD
    let trainingDate: String
    
    // トレーニングセット
    var trainingSetList: [TrainingSet]
    
    struct TrainingSet {
        // 重量
        var weight: Double
        
        // 回数
        var rep: Int
    }
}
