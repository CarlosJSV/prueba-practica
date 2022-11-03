//
//  GraphWireFrame.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import Foundation
import UIKit

class GraphWireFrame: GraphWireFrameProtocol {

    weak var viewController: UIViewController?
    
    class func createGraphModule() -> UIViewController {
        let view = GraphView(nibName: "GraphView", bundle: nil)
        let interactor: GraphInteractorInputProtocol = GraphInteractor()
        let service: GraphServiceInputProtocol = GraphService()
        let wireFrame = GraphWireFrame()
        let presenter = GraphPresenter(interface: view, interactor: interactor, wireFrame: wireFrame)

        view.presenter = presenter
        interactor.presenter = presenter
        interactor.service = service
        wireFrame.viewController = view

        return view

    }
    
    func showAlertError(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.modalTransitionStyle = .crossDissolve
        alert.modalPresentationStyle = .overCurrentContext
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Aceptar", comment: "Default action"), style: .default, handler: { _ in
            self.viewController?.navigationController?.popViewController(animated: true)
        }))
        viewController?.present(alert, animated: true)
        
    }
    
}
