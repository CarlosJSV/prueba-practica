//
//  SelfieTableViewCell.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//

import UIKit

protocol SelfieTableViewCellDelegate {
    func takePhoto()
}

class SelfieTableViewCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var selfieButton: UIButton!
    @IBOutlet weak var selfieImage: UIImageView!
    
    var delegate: SelfieTableViewCellDelegate?
    public var image: UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        //setImage()
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
        
        selfieButton.layer.cornerRadius = 12
    }
    
    public func setImage() {
        if let image = self.image {
            self.selfieImage.isHidden = false
            DispatchQueue.main.async {
                self.selfieImage.image = image
            }
        }
    }
    
    @IBAction func onClickTakePhoto(_ sender: Any) {
        delegate?.takePhoto()
    }

}
