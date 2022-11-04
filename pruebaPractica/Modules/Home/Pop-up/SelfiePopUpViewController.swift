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
    @IBOutlet weak var galleryButton: UIButton!
    
    var imagePicker = UIImagePickerController()
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
        galleryButton.layer.cornerRadius = galleryButton.frame.height / 2
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
            selfieImage.isHidden = false
            showButton.isHidden = true
            
            DispatchQueue.main.async {
                self.selfieImage.image = image
            }
        }
    }
    
    @IBAction func onClickTake(_ sender: Any) {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.cameraDevice = .front
            vc.delegate = self
            present(vc, animated: true)
        }else{
            let alertWarning = UIAlertController(title: "Advertencia", message: "No cuenta con camara", preferredStyle: .alert)
            
            alertWarning.modalTransitionStyle = .crossDissolve
            alertWarning.modalPresentationStyle = .overCurrentContext
            alertWarning.addAction(UIAlertAction(title: NSLocalizedString("Aceptar", comment: "Default action"), style: .default, handler: { _ in
            NSLog("Accepted")
            }))
            
            self.present(alertWarning, animated: true)
        }
    
    }
    
    @IBAction func onClickGallery(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                 print("Button capture")

                 imagePicker.delegate = self
                 imagePicker.sourceType = .savedPhotosAlbum
                 imagePicker.allowsEditing = false

                 present(imagePicker, animated: true, completion: nil)
        }else{
            let alertWarning = UIAlertController(title: "Advertencia", message: "No se tiene permisos para acceder", preferredStyle: .alert)
            
            alertWarning.modalTransitionStyle = .crossDissolve
            alertWarning.modalPresentationStyle = .overCurrentContext
            alertWarning.addAction(UIAlertAction(title: NSLocalizedString("Aceptar", comment: "Default action"), style: .default, handler: { _ in
            NSLog("Accepted")
            }))
            
            self.present(alertWarning, animated: true)
        }
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
        if self.selfieImage.isHidden == false {
            DispatchQueue.main.async {
                self.selfieImage.image = image
            }
        }else{
            self.showButton.isHidden = false
        }
        takeButton.setTitle("Retomar", for: .normal)
        self.delegate?.setImage(image: image)
    }
    
}
