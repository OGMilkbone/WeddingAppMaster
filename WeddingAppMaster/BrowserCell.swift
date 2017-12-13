//
//  BrowserCell.swift
//  WeddingAppMaster
//
//  Created by jwilson on 10/12/17.
//  Copyright © 2017 jwilson. All rights reserved.
//

import UIKit

class BrowserCell: UICollectionViewCell {
    
    var menu: Menu?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(menu: Menu) {
        self.menu = menu
        nameLabel.text = menu.name
        let swithboard = menu.switchboard
        //contextLabel.text = "\(recipie.steps.count) steps"
        ImageService.shared.imageForURL(url: menu.imageURL) { (image, url) in
            if url == self.menu?.imageURL {
                self.imageView.image = image
            }
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    //@IBOutlet weak var nameLabel: UILabel!
    
    //@IBOutlet weak var stepsLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    //@IBOutlet weak var imageView: UIImageView!
    
}
