//
//  AtireViewController.swift
//  WeddingAppMaster
//
//  Created by jwilson on 10/19/17.
//  Copyright © 2017 jwilson. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class AttireViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let ref = Database.database().reference()
        ref.setValue("black")
        ref.observe(.value, with: { snapshot in
            print(snapshot.value)
        })
    }
    
    
    
}

