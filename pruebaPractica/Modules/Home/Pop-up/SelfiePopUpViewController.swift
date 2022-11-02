//
//  SelfiePopUpViewController.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//

import UIKit

protocol SelfiePopUpViewControllerDelegate {
    func setImage(image: UIImage)
}

class SelfiePopUpViewController: UIViewController {

    @IBOutlet weak var selfieImage: UIImageView!
    @IBOutlet weak var containerPopView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var takeButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    
    var image: UIImage?
    var delegate: SelfiePopUpViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        containerPopView.layer.cornerRadius = 12
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
        takeButton.layer.cornerRadius = takeButton.frame.height / 2
        showButton.layer.cornerRadius = showButton.frame.height / 2
        
        if let _ = self.image {
            showButton.isHidden = false
            takeButton.setTitle("Retomar", for: .normal)
        }
    }
    @IBAction func onClickClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func onClickShow(_ sender: Any) {
        if let image = self.image {
            self.selfieImage.isHidden = false
            self.showButton.isHidden = false
            DispatchQueue.main.async {
                self.selfieImage.image = image
            }
        }
    }
    
    @IBAction func onClickTake(_ sender: Any) {
                let vc = UIImagePickerController()
                vc.sourceType = .camera
                //vc.allowsEditing = true
                vc.cameraDevice = .front
                vc.delegate = self
                present(vc, animated: true)

    }
}

extension SelfiePopUpViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let image = info[.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        self.image = image
        self.showButton.isHidden = false
        takeButton.setTitle("Retomar", for: .normal)
        self.delegate?.setImage(image: image)
    }
}
