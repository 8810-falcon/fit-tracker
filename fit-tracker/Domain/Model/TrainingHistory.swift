//
//  TrainingHistory.swift
//  fit-tracker
//
//  Created by 小椋　隼 on 2024/10/30.
//

import Foundation

struct TrainingHistory {
    
    // トレーニング部位
    var part: String
    
    // トレーニングメニューリスト
    var trainingMenuList: [TrainingMenu]
    
    struct TrainingMenu {
        
        // トレーニングメニュー名
        var trainingMenuName: String
        
        // トレーニングセット
        var trainingSetList: [TrainingSet]
        
        struct TrainingSet {
            // 重量
            var weight: Double
            
            // 回数
            var rep: Int
        }
    }
}
