//
//  MainViewController.swift
//  test_viper_profi
//
//  Created by Nikita Shumilin on 24.10.2021.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: Properties
    var output: MainViewOutput!
    
    var data: [MainViewModel]?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: Life cycle
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
    }
    
    deinit {
        print("\(type(of: self)) - \(#function)")
    }
}



// MARK: - ShareVideoReviewViewInput
extension MainViewController: MainViewInput {
    func setupInitialState() {
        print("\(type(of: self)) - \(#function)")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.name)
        
        setupViews()
    }
    
    func setupViews() {
        self.view.addSubview(tableView)
        
        let guide = self.view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
        ])
    }
    
    func setData(data: [MainViewModel]) {
        print("\(type(of: self)) - \(#function)")
        
        self.data = data
        self.tableView.reloadData()
    }
}


extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.name) as? MainTableViewCell,
              let vm = data?[indexPath.row]
        else { return UITableViewCell() }
        
        cell.configure(vm)
        
        return cell
    }
}
