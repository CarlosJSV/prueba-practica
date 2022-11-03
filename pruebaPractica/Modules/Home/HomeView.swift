//
//  HomeView.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    var image: UIImage?
    var name: String?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    private func setupUI() {
        sendButton.layer.cornerRadius = sendButton.frame.height / 2
    }
}

// MARK: UITableView protocols

extension HomeView: UITableViewDelegate, UITableViewDataSource{
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TextFieldTableViewCell.nibName, forCellReuseIdentifier: TextFieldTableViewCell.identifier)
        tableView.register(SelfieTableViewCell.nibName, forCellReuseIdentifier: SelfieTableViewCell.identifier)
        tableView.register(GraphTableViewCell.nibName, forCellReuseIdentifier: GraphTableViewCell.identifier)
        tableView.separatorColor = .clear
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as? TextFieldTableViewCell else {
                return UITableViewCell()
            }
            
            cell.delegate = self
  
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.white
            cell.selectedBackgroundView = bgColorView

            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SelfieTableViewCell.identifier, for: indexPath) as? SelfieTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.white
            cell.selectedBackgroundView = bgColorView
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GraphTableViewCell.identifier, for: indexPath) as? GraphTableViewCell else {
                return UITableViewCell()
            }
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.white
            cell.selectedBackgroundView = bgColorView
            return cell
        default:
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            presenter?.openGraphModule()
        }
    }

    }
    

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}

extension HomeView: SelfieTableViewCellDelegate {
    func takePhoto() {
        presenter?.openPhotoModal(image: self.image)
    }
}

extension HomeView: SelfiePopUpViewControllerDelegate, TextFieldTableViewCellDelegate {
    func setName(name: String) {
        self.name = name
    }
    
    func setImage(image: UIImage) {
        self.image = image
    }
    
}

