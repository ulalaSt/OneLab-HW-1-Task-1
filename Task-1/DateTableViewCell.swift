//
//  SecondTableViewCell.swift
//  Task-1
//
//  Created by user on 10.04.2022.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    static let identifier = "DateTableViewCell"
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        return label
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.date = Date()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(handler(sender:)), for: UIControl.Event.valueChanged)
        return datePicker
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        handler(sender: datePicker)
        contentView.addSubview(datePicker)
        contentView.addSubview(label)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))

        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(contentView.frame.height/7)
        }
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    @objc func handler(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = DateFormatter.Style.full
        timeFormatter.timeStyle = DateFormatter.Style.short
        let strDate = timeFormatter.string(from: datePicker.date).replacingOccurrences(of: " at", with: ",")
        label.text = strDate
    }

    
}
