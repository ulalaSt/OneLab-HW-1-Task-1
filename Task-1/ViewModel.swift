//
//  ViewModel.swift
//  Task-1
//
//  Created by user on 10.04.2022.
//

import Foundation
import UIKit

class ViewModel {
    let title = "Create Reminder"
    let rightText = "Done"
    let leftText = "Cancel"
    
    let heightForGeneralCell = 40.0
    let heightForDateCell = 280.0
    
    let sections: [[Row]] = [
        [.general(.none, "Get Groceries")],
        [.general(.switcher, "Remind me on a day"),
            .date,
            .general(.picker(["Never", "Every day", "Every week", "Every month", "Every year"]), "Repeat")],
        [.general(.switcher, "Remind me at a location")],
        [.general(.segmentedControl(["None", "!", "!!", "!!!"]), "Priority"), .general(.none, "Notes")]
    ]
}
