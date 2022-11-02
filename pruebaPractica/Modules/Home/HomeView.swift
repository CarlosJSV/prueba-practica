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
            print("hola")
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as? TextFieldTableViewCell
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: SelfieTableViewCell.identifier, for: indexPath) as? SelfieTableViewCell
            cell?.delegate = self
            return cell ?? UITableViewCell()
        case 2:
           let cell = tableView.dequeueReusableCell(withIdentifier: GraphTableViewCell.identifier, for: indexPath) as? GraphTableViewCell
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
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

extension HomeView: SelfiePopUpViewControllerDelegate {
    func setImage(image: UIImage) {
        print(image)
        self.image = image
    }
    
    
}

