//
//  HomeWireFrame.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {

    weak var viewController: UIViewController?
    
    class func createHomeModule() -> UIViewController {
        
            let view = HomeView(nibName: "HomeView", bundle: nil)
            let interactor: HomeInteractorInputProtocol & HomeServiceOutputProtocol = HomeInteractor()
            let service: HomeServiceInputProtocol = HomeService()
            let wireFrame = HomeWireFrame()
            let presenter = HomePresenter(interface: view, interactor: interactor, wireFrame: wireFrame)

            view.presenter = presenter
            interactor.presenter = presenter
            interactor.service = service
            service.interactor = interactor
            wireFrame.viewController = view
            
            return view
        
    }
    
    func openPhotoModal(image: UIImage?) {
        let vc = SelfiePopUpViewController(nibName: "SelfiePopUpViewController", bundle: nil)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        vc.image = image
        if let view = viewController as? SelfiePopUpViewControllerDelegate {
            vc.delegate = view
        }
        viewController?.present(vc, animated: true)
    }
    
    func openGraphModule() {
        viewController?.navigationController?.pushViewController(GraphWireFrame.createGraphModule(), animated: false)
    }

}
