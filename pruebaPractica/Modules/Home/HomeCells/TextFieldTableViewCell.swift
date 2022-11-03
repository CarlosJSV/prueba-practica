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

protocol TextFieldTableViewCellDelegate {
    func setName(name: String)
}


class TextFieldTableViewCell: UITableViewCell, ReusableCell {


    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameTf: UITextField!
    
    var delegate: TextFieldTableViewCellDelegate?
    
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
        return predicate.evaluate(with: string) || string == ""
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
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        delegate?.setName(name: nameTf.text ?? "")
        
    }
}
