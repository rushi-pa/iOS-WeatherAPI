//
//  CellCV.swift
//  Weather-API
//
//  Created by Rushi Patel on 2021-04-02.
//

import Foundation
import UIKit

class CellCV: UICollectionViewCell {
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var tit : UILabel!
    @IBOutlet weak var bgcol : UIView!
    override func awakeFromNib() {
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
    }
}
