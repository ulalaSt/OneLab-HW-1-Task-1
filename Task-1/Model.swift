//
//  Model.swift
//  Task-1
//
//  Created by user on 11.04.2022.
//

import Foundation

enum Row {
    case general(RightUI, String)
    case date
}
enum RightUI {
    case none
    case switcher
    case picker([String])
    case segmentedControl([String])
}
