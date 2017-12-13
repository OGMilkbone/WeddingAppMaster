//
//  LocationViewController.swift
//  WeddingAppMaster
//
//  Created by jwilson on 10/19/17.
//  Copyright © 2017 jwilson. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    var photoURL = URL(string: "https://raw.githubusercontent.com/OGMilkbone/WeddingApp/master/StRose.jpg")
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageService.shared.imageForURL(url: photoURL) { (image, url) in
            if url == self.photoURL {
                self.imageView.image = image
            }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
}
    
    
}

