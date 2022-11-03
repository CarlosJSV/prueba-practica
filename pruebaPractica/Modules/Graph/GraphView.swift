//
//  GraphView.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import Foundation
import UIKit

class GraphView: UIViewController {

    
    // MARK: Properties
    var presenter: GraphPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    var report: Report?
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    func setupUI() {
        
    }
}

extension GraphView: GraphViewProtocol {
    func setData(report: Report) {
        self.report = report
        self.tableView.reloadData("Sin reportes")
    }
    
    // TODO: implement view output methods
}


extension GraphView: UITableViewDelegate, UITableViewDataSource{
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GraphReportTableViewCell.nibName, forCellReuseIdentifier: GraphReportTableViewCell.identifier)
        tableView.separatorColor = .clear
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.report?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: GraphReportTableViewCell.identifier, for: indexPath) as? GraphReportTableViewCell else {
            return UITableViewCell()
        }
        if let test = self.report?.data[indexPath.row] {
            cell.setData(test: test)
        }
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = bgColorView

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
    }
}
