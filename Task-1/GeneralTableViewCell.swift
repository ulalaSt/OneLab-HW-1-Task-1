//
//  FirstTableViewCell.swift
//  Task-1
//
//  Created by user on 10.04.2022.
//

import UIKit
import SnapKit
class GeneralTableViewCell: UITableViewCell {
    static let identifier = "GeneralTableViewCell"
    var updated = false
    var switcher: UISwitch = {
        let switcher = UISwitch()
        return switcher
    }()
    var pickerVC: UIViewController = {
        let pickerVC = UIViewController()
        return pickerVC
    }()
    var pickerButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.lightGray, for: .normal)
        return button
    }()
    var label = UILabel()
    var segmentedControl = UISegmentedControl()
    
    func updateSubviews(right type: RightUI, left text: String){
        updated = true
        contentView.addSubview(label)
        label.text = text
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.height.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        switch type {
        case .none:
            break
            
        case .switcher:
            contentView.addSubview(switcher)
            switcher.snp.makeConstraints { make in
                make.right.equalToSuperview().inset(20)
                make.centerY.equalToSuperview()
            }
            switcher.addTarget(self, action: #selector(switchTapped(_:)), for: .touchUpInside)
            
        case .picker(let array):
            contentView.addSubview(pickerButton)
            if !array.isEmpty {
                pickerButton.setTitle("\(array[0])", for: .normal)
            }
            self.accessoryType = .disclosureIndicator
            pickerButton.snp.makeConstraints { make in
                make.right.equalToSuperview().inset(20)
                make.centerY.equalToSuperview()
            }
            pickerButton.addTarget(self, action: #selector(pickerButtonTapped), for: .touchUpInside)
        
        case .segmentedControl(let array):
            let segmentedC = UISegmentedControl(items: array)
            self.segmentedControl = segmentedC
            segmentedControl.selectedSegmentIndex = 0
            segmentedControl.selectedSegmentTintColor = .systemBlue
            segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
            segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
            contentView.addSubview(segmentedControl)

            segmentedControl.snp.makeConstraints { make in
                make.right.equalToSuperview().inset(20)
                make.centerY.equalToSuperview()
            }
        }
    }
    @objc private func segmentedValueChanged(_ sender: UISegmentedControl) {
        if let text = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            print(text)
        }
    }
    @objc private func pickerButtonTapped(){
        print("Never >")
    }
    @objc private func switchTapped(_ switcher: UISwitch){
        if switcher.isOn {
            print("Switch on")
        } else {
            print("Switch off")
        }
    }
}
