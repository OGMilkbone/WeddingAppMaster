//
//  PartyViewController.swift
//  WeddingAppMaster
//
//  Created by jwilson on 10/19/17.
//  Copyright © 2017 jwilson. All rights reserved.
//

import UIKit

class PartyViewController: UIViewController {
    
    var menu: Menu?
    var OGUrl: URL?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchData()
    }
    
    func fetchData() {
        let url = OGUrl!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, err) in
            let data = data!
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            let array = json as! [[String: Any]]
            // ToDo: decide what I want done with the data in this array
            
            
//            DispatchQueue.main.async {
//                self.verticalStackView.reloadData()
//            }
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


