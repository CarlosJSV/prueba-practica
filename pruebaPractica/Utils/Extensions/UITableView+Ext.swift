//
//  UITableView+Ext.swift
//  pruebaPractica
//
//  Created by Satoritech 31 on 02/11/22.
//

import UIKit

extension UITableView {
    
    /// Allow to add a message when UITableView doesn't have any UITableCellView
    func setEmptyMessage(_ message: String) {
        if self.visibleCells.isEmpty {
            let messageLbl = UILabel(frame: CGRect(
                x: 0,
                y: 0,
                width: self.bounds.size.width,
                height: self.bounds.size.height
            ))
            
            messageLbl.text = message
            messageLbl.textColor = .black
            messageLbl.numberOfLines = 0
            messageLbl.textAlignment = .center
            messageLbl.sizeToFit()
            
            self.backgroundView = messageLbl
            self.separatorStyle = .none
        }
    }
    
    func resetBackground() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
    
    func reloadData(_ emptyMessage: String) {
        reloadData()
        
        if visibleCells.isEmpty {
            setEmptyMessage(emptyMessage)
        } else {
            resetBackground()
        }
    }
    
}
