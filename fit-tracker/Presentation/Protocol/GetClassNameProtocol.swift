//
//  GetClassNameProtocol.swift
//  fit-tracker
//
//  Created by 小椋　隼 on 2024/10/30.
//

import UIKit

protocol GetClassNameProtocol {
    static var className: String { get }
}

extension GetClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
}
