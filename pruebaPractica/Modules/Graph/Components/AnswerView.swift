//
//  AnswerView.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//

import UIKit

class AnswerView: UIView {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var secondAnswerSv: UIStackView!
    
    override func draw(_ rect: CGRect) {
        firstView.layer.cornerRadius = 10
        secondView.layer.cornerRadius = 10
    }
    static func loadViewFromNib() -> AnswerView {
        let nib = UINib(nibName: "AnswerView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! AnswerView
    }

}
