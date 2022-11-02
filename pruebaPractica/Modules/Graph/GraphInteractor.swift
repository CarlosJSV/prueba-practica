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

}

extension GraphInteractor: GraphServiceOutputProtocol {
    // TODO: Implement use case methods
}
