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
    

    class func createGraphModule() -> UIViewController {
        let view = GraphView(nibName: "GraphView", bundle: nil)
        let interactor: GraphInteractorInputProtocol & GraphServiceOutputProtocol = GraphInteractor()
        let service: GraphServiceInputProtocol = GraphService()
        let wireFrame: GraphWireFrameProtocol = GraphWireFrame()
        let presenter = GraphPresenter(interface: view, interactor: interactor, wireFrame: wireFrame)

        view.presenter = presenter
        interactor.presenter = presenter
        interactor.service = service
        service.interactor = interactor
        
        return view

    }
    
}
