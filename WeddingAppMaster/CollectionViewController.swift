//
//  CollectionViewController.swift
//  WeddingAppMaster
//
//  Created by jwilson on 10/12/17.
//  Copyright © 2017 jwilson. All rights reserved.
//

import UIKit
import SafariServices
import Firebase
class CollectionViewController: UIViewController {
    
    var submenus: [Menu] = []
    //let ref = Database.database().reference(withPath: "Wedding-items")
    
    @IBOutlet weak var collectionView: UICollectionView!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        fetchData()
    }
    
    func fetchData() {
        let url = URL(string: "https://raw.githubusercontent.com/OGMilkbone/WeddingApp/master/Menu.json")!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, err) in
            let data = data!
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            let array = json as! [[String: Any]]
            self.submenus = array.map { Menu(dictionary: $0) }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        task.resume()
    }
    
    
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return submenus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrowserCell", for: indexPath) as! BrowserCell
        cell.configure(menu: submenus[indexPath.item])
        return cell
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate {
    // add more view controllers as I make them
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentMenu = self.submenus[indexPath.item]
        let sb: Int = currentMenu.switchboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let url = URL(string: "https://www.amazon.com/wedding/megan-mickley-john-wilson-scottsdale-june-2018/registry/CUMEVAPB9W33")!
        let safariVC = SFSafariViewController(url: url)
        let vc: UIViewController
//        let countdownViewController = storyboard.instantiateViewController(withIdentifier: "CountdownViewController") as! CountdownViewController
//        let vc: [UIViewController] = [ountdownViewController, safariVC, ]
        switch sb {
        case 0:
            vc = storyboard.instantiateViewController(withIdentifier: "CountdownViewController") as! CountdownViewController
        case 1:
            vc = safariVC
        case 2:
            vc = storyboard.instantiateViewController(withIdentifier: "PartyViewController") as! PartyViewController
            //vc.menu = submenus[indexPath.item]
        case 3:
            vc = storyboard.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController
        case 4:
            vc = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        case 5:
            vc = storyboard.instantiateViewController(withIdentifier: "AttireViewController") as! AttireViewController
        default:
            vc = safariVC
        }
        
        
        
        //let menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
//        vc.menu = submenus[indexPath.item]
        //present(vc, animated: true, completion: nil)
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
