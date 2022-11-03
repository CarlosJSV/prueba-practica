//
//  GraphReportTableViewCell.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//

import UIKit


class GraphReportTableViewCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var pieView: RoundedChart!
    @IBOutlet weak var questionLabel: UILabel!
    
    private var randomValue: CGFloat { CGFloat.random(7) }
    private var segmentsCount = 4
    private let colors: [UIColor] = [.blue, .systemPink, .yellow,
                                     .red, .green, .purple]
    private var values: [(CGFloat, UIColor)]! {
        didSet {
            pieView.setup(values: values)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setValues(for: segmentsCount)
    }
    private func setValues(for count: Int) {
        values = (0...count - 1).map { (randomValue, colors[$0]) }
    }
    
    public func setData(test: Test) {
        self.questionLabel.text = test.question
        self.segmentsCount = test.answer.count
    }
    
}
