//
//  GraphView.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import Foundation
import UIKit

class GraphView: UIViewController {

    @IBOutlet weak var takeButton: UIButton!
    
    // MARK: Properties
    var presenter: GraphPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
    }
}

extension GraphView: GraphViewProtocol {
    // TODO: implement view output methods
}
