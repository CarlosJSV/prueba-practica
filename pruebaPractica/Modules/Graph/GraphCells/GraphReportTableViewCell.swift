//
//  GraphReportTableViewCell.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//

import UIKit
import FirebaseDatabase

class GraphReportTableViewCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var pieView: RoundedChart!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerSv: UIStackView!
    
    private var answers: [Answer]!
    private let colors: [UIColor] = [.blue, .red, .yellow,
                                     .orange, .green, .purple]
    var tempValues: [(CGFloat, UIColor)] = []
    var ref: DatabaseReference!

    private var values: [(CGFloat, UIColor)]! {
        didSet {
            pieView.setup(values: values)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupReference()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        values = tempValues
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        answerSv.subviews.forEach({ $0.removeFromSuperview() })
        tempValues = []
    }
    
    private func setupReference(){
        ref = Database.database().reference()

        ref.child("screenColors").child("GraphView").observe(DataEventType.value, with: {[weak self] snapshot in
            if let color = snapshot.value {
                self?.backgroundColor = UIColor(hexString: color as! String)
            }
        })
    }
    
    public func setData(test: Test) {
        self.questionLabel.text = test.question
        self.answers = test.answer
        setAnswer()
    }
    
    private func setAnswer() {
        for index in stride(from: 0, to: answers.count, by: 2){
            
            tempValues.append((CGFloat(answers[index].value),colors[index]))

            let v = AnswerView.loadViewFromNib()
            v.firstLabel.text = "\(answers[index].label) \(answers[index].value)%"
            v.firstView.backgroundColor = colors[index]
            if index + 1 <= answers.count{
                v.secondLabel.text = "\(answers[index + 1].label) \(answers[index + 1].value)%"
                v.secondView.backgroundColor = colors[index + 1]

            tempValues.append((CGFloat(answers[index + 1].value),colors[index + 1]))

            }else{
                v.secondAnswerSv.isHidden = true
            }
            answerSv.addArrangedSubview(v)
        }
    }
    
}
