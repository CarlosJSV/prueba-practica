//
//  GraphTableViewCell.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//

import UIKit

protocol GraphTableViewCellDelegate {
    func setName(userName: String)
}

class GraphTableViewCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var containerView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        containerView.layer.cornerRadius = 12
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 0.4
        
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowRadius = 4.0
    }
    
}



