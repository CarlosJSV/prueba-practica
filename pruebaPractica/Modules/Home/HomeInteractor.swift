//
//  HomeInteractor.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//  
//

import UIKit
import FirebaseStorage

class HomeInteractor: HomeInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var service: HomeServiceInputProtocol?
    let storage = Storage.storage()

    func uploadPhoto(image: UIImage, name: String) {
        let storageRef = Storage.storage().reference()
        
        let imageData = image.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else {
            return
        }
        
        let fileRef = storageRef.child("images/\(name.replacingOccurrences(of: " ", with: "-"))\(UUID().uuidString).jpg")
        
        let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata, error in
            if error == nil && metadata != nil {
                self.presenter?.showAlert(title: "Éxito", message: "La imagen se ha subido")
            }else{
                self.presenter?.showAlert(title: "Error", message: "Error al subir imagen")
            }
            self.presenter?.finishUploadImage()
        }
        
    }
}
