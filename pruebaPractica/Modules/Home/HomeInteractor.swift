//
//  HomeInteractor.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var service: HomeServiceInputProtocol?

}

extension HomeInteractor: HomeServiceOutputProtocol {
    // TODO: Implement use case methods
}
