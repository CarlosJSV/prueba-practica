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
}

protocol HomeWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
    func openPhotoModal(image: UIImage?)
    func openGraphModule()
}

protocol HomePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func openPhotoModal(image: UIImage?)
    func openGraphModule()

}

protocol HomeInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol HomeInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var service: HomeServiceInputProtocol? { get set }
}

protocol HomeServiceInputProtocol: AnyObject {
    // INTERACTOR -> SERVICE
    var interactor: HomeServiceOutputProtocol? { get set }
}

protocol HomeServiceOutputProtocol: AnyObject {
    // SERVICE -> INTERACTOR
}
