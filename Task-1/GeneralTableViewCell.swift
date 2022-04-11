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
    
    func updateSubviews(right type: RightUI, left text: String){
        let label = UILabel()
        contentView.addSubview(label)
        label.text = text
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.height.equalToSuperview()
            make.top.equalToSuperview()
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
        case .picker(let array):
            guard !array.isEmpty else {
                print("Picker can not be Empty")
                return
            }
            contentView.addSubview(pickerButton)
            pickerButton.setTitle("\(array[0])", for: .normal)
            pickerButton.snp.makeConstraints { make in
                make.right.equalToSuperview().inset(20)
                make.centerY.equalToSuperview()
            }
            self.accessoryType = .disclosureIndicator
            pickerButton.addTarget(self, action: #selector(pickerButtonTapped), for: .touchUpInside)
//            pickerVC.modalPresentationStyle = .overCurrentContext
//            pickerVC.preferredContentSize = CGSize(width: 300, height: 300)
//            pickerVC.modalTransitionStyle = .crossDissolve
//
//            let pVC = pickerVC.popoverPresentationController
//            pVC?.permittedArrowDirections = .any
//            pVC?.delegate = self
//            pVC?.sourceView = pickerButton
//            pVC?.sourceRect = CGRect(x: 100, y: 100, width: 1, height: 1)
        case .segmentedControl(let array):
            let segmentedControl = UISegmentedControl(items: array)
            contentView.addSubview(segmentedControl)
            segmentedControl.selectedSegmentIndex = 1
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
        print("pickerButtonTapped")
    }
}
