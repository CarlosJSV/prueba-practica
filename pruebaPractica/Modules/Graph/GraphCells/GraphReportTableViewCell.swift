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
    @IBOutlet weak var answerSv: UIStackView!
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        answerSv.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    private func setValues(for count: Int) {
        values = (0...count - 1).map { (randomValue, colors[$0]) }
        //values.append((1.0, colors[0]))
    }
    
    public func setData(test: Test) {
        self.questionLabel.text = test.question
        self.segmentsCount = test.answer.count
        
        test.answer.forEach({_ in
            let v = AnswerView.loadViewFromNib()
            
            answerSv.addArrangedSubview(v)
        })
        

    }
    
}
