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
    func setData(report: Report)
}

protocol GraphWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createGraphModule() -> UIViewController
    func showAlertError(_ title: String, _ message: String)
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
    func showErrorRequest(title: String, message: String)
    func setReport(report: Report)
}

protocol GraphInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: GraphInteractorOutputProtocol? { get set }
    var service: GraphServiceInputProtocol? { get set }
    
    func getData()
}


protocol GraphServiceInputProtocol: AnyObject {
    // INTERACTOR -> SERVICE
    func getReport(completion: @escaping(_ response: Result<Report, APIRequest.HTTPErrors>) -> Void)
}

