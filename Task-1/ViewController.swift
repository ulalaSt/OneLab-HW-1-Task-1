//
//  ViewController.swift
//  Task-1
//
//  Created by user on 10.04.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var viewModel = ViewModel()
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .secondarySystemBackground
        table.register(GeneralTableViewCell.self, forCellReuseIdentifier: GeneralTableViewCell.identifier)
        table.register(DateTableViewCell.self, forCellReuseIdentifier: DateTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .tertiarySystemBackground
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func configure(){
        title = viewModel.title
        view.backgroundColor = .secondarySystemBackground
        
        let rightButton = UIBarButtonItem(title: viewModel.rightText,
                                          style: .done,
                                          target: self,
                                          action: #selector(rightFunction))
        navigationItem.rightBarButtonItem = rightButton

        let leftButton = UIBarButtonItem(title: viewModel.leftText,
                                         style: .done ,
                                         target: self,
                                         action: #selector(leftFunction))
        navigationItem.leftBarButtonItem = leftButton

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.sectionHeaderHeight = 0
    }
        
    @objc private func rightFunction(){
        print(viewModel.rightText)
    }
    
    @objc private func leftFunction(){
        print(viewModel.leftText)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = viewModel.sections[indexPath.section][indexPath.row]
        
        switch row {
        case .general(let rightUI, let text):
            let cell = tableView.dequeueReusableCell(withIdentifier: GeneralTableViewCell.identifier, for: indexPath) as! GeneralTableViewCell
            cell.updateSubviews(right: rightUI, left: text)
            return cell
            
        case .date:
            let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.identifier, for: indexPath) as! DateTableViewCell
            cell.backgroundColor = .white
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = viewModel.sections[indexPath.section][indexPath.row]
        switch row {
        case .general(_, _):
            return viewModel.heightForGeneralCell
        case .date:
            return viewModel.heightForDateCell
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.heightForGeneralCell/2
    }
}

