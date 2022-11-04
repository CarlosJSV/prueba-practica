//
//  HomeProtocols.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    func finishUploadImage()
}

protocol HomeWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
    func openPhotoModal(image: UIImage?)
    func openGraphModule()
    func showAlert(title: String, message: String)
}

protocol HomePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func openPhotoModal(image: UIImage?)
    func openGraphModule()
    func uploadPhoto(image: UIImage, name: String)
    func showAlert(title: String, message: String)

}

protocol HomeInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func showAlert(title: String, message: String)
    func finishUploadImage()
}

protocol HomeInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var service: HomeServiceInputProtocol? { get set }
    func uploadPhoto(image: UIImage, name: String)
}

protocol HomeServiceInputProtocol: AnyObject {
    // INTERACTOR -> SERVICE
}
