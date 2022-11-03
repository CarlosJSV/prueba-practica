//
//  GraphInteractor.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import Foundation

class GraphInteractor: GraphInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: GraphInteractorOutputProtocol?
    var service: GraphServiceInputProtocol?

    func getData() {
        service?.getReport {Result in
            switch Result {
            case .success(let report):
                self.presenter?.setReport(report: report)

            case .failure(let error):
                self.presenter?.showErrorRequest(title: "Algo salio mal", message: error.localizedDescription)
            }
        }
    }
}
