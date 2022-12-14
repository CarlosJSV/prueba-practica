//
//  HomePresenter.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import Foundation
import UIKit

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
    init(interface : HomeViewProtocol, interactor : HomeInteractorInputProtocol, wireFrame : HomeWireFrameProtocol) {
        self.view = interface
        self.interactor = interactor
        self.wireFrame = wireFrame
    }
    
}

extension HomePresenter: HomePresenterProtocol {
    func uploadPhoto(image: UIImage, name: String) {
        interactor?.uploadPhoto(image: image, name: name)
    }
    
    func openGraphModule() {
        wireFrame?.openGraphModule()
    }
    
    func openPhotoModal(image: UIImage?) {
        wireFrame?.openPhotoModal(image: image)
    }
    
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func finishUploadImage() {
        view?.finishUploadImage()
    }
    
    // TODO: implement interactor output methods
    func showAlert(title: String, message: String) {
        wireFrame?.showAlert(title: title, message: message)
    }
    
}
