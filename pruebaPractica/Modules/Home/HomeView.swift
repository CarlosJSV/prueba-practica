//
//  HomeView.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import Foundation
import UIKit
import FirebaseDatabase

class HomeView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    var image: UIImage?
    var name: String?
    var ref: DatabaseReference!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setupReference()
    }
    
    private func setupUI() {
        sendButton.layer.cornerRadius = sendButton.frame.height / 2
        self.title = "Vista Inicio"
    }
    
    private func setupReference(){
        ref = Database.database().reference()

        ref.child("screenColors").child("HomeView").observe(DataEventType.value, with: {[weak self] snapshot in
            if let color = snapshot.value {
                self?.view.backgroundColor = UIColor(hexString: color as! String)
                self?.tableView.backgroundColor = UIColor(hexString: color as! String)
            }
        })
    }
    
    
    @IBAction func onClickSend(_ sender: Any) {
        if let image = image, let name = name {
            activityIndicator.startAnimating()
            sendButton.isEnabled = false
            presenter?.uploadPhoto(image: image, name: name)
        }else{
            presenter?.showAlert(title: "Advertencia", message: "Segurece de seleccinar una foto y haber ingresado su nombre")
        }
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
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as? TextFieldTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SelfieTableViewCell.identifier, for: indexPath) as? SelfieTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GraphTableViewCell.identifier, for: indexPath) as? GraphTableViewCell else {
                return UITableViewCell()
            }
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
    }
}
    

extension HomeView: HomeViewProtocol {
    func finishUploadImage() {
        sendButton.isEnabled = true
        activityIndicator.stopAnimating()
    }
    
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

