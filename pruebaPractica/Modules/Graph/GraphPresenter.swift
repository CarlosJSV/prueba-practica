//
//  GraphPresenter.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import Foundation

class GraphPresenter  {
    
    // MARK: Properties
    weak var view: GraphViewProtocol?
    var interactor: GraphInteractorInputProtocol?
    var wireFrame: GraphWireFrameProtocol?
    
    init(interface : GraphViewProtocol, interactor : GraphInteractorInputProtocol, wireFrame : GraphWireFrameProtocol) {
        self.view = interface
        self.interactor = interactor
        self.wireFrame = wireFrame
    }
    
    
}

extension GraphPresenter: GraphPresenterProtocol {
    func openPhotoModal() {
        
    }
    

    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getData()
    }
}

extension GraphPresenter: GraphInteractorOutputProtocol {
    func setReport(report: Report) {
        view?.setData(report: report)
    }
    
    func showErrorRequest(title: String, message: String) {
        wireFrame?.showAlertError(title, message)
    }
    
    // TODO: implement interactor output methods
}
