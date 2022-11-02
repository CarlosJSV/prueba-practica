//
//  TextFieldTableViewCell.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//

import UIKit

protocol ReusableCell {
    static var identifier: String { get }
    static var nibName: UINib { get }
}

extension ReusableCell {
    static var identifier: String {
        return String(describing: self)
    }
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}


class TextFieldTableViewCell: UITableViewCell, ReusableCell {


    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameTf: UITextField!
    
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
        
        nameTf.delegate = self
        nameTf.layer.cornerRadius = 12
    }
    
    
    
}

extension TextFieldTableViewCell {
    func validateName(_ textField: UITextField, _ range: NSRange, _ string: String) -> Bool {
        let regEx = "[A-Za-zÁÉÍÓÚáéíóúñÑ ]"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        if predicate.evaluate(with: string) || string == ""{
            return true
        }
        
        return false
    }
}


// MARK: - Delegates
extension TextFieldTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case nameTf:
            return self.validateName(textField, range, string)
        default:
            return false
        }
    }
}
