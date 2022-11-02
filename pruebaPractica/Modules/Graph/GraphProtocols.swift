//
//  GraphProtocols.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import Foundation
import UIKit

protocol GraphViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: GraphPresenterProtocol? { get set }
}

protocol GraphWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createGraphModule() -> UIViewController
}

protocol GraphPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: GraphViewProtocol? { get set }
    var interactor: GraphInteractorInputProtocol? { get set }
    var wireFrame: GraphWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol GraphInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol GraphInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: GraphInteractorOutputProtocol? { get set }
    var service: GraphServiceInputProtocol? { get set }
}


protocol GraphServiceInputProtocol: AnyObject {
    // INTERACTOR -> SERVICE
    var interactor: GraphServiceOutputProtocol? { get set }
}

protocol GraphServiceOutputProtocol: AnyObject {
    // SERVICE -> INTERACTOR
}
