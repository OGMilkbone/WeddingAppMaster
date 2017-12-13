//
//  CountdownViewController.swift
//  WeddingAppMaster
//
//  Created by jwilson on 10/12/17.
//  Copyright © 2017 jwilson. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {
    @IBOutlet weak var countdown: UILabel!
    
    var timer = Timer()
    //var secondsFromGMTMST: Int { return TimeZone.init(abbreviation: "MST")!.secondsFromGMT() }
    // So maybe mountian Daylight time would fix the problem of Phoenix not using Daylight savings time
    //I do recognize that there shouldnt actually be any real diffrence between if they use DST or not in the long run
    //var secondsFromGMTMDT: Int { return TimeZone.init(abbreviation: "MDT")!.secondsFromGMT() }
    var secondsFromGMTCurrent: Int { return TimeZone.current.secondsFromGMT() }
    //Trying to figure out if swift has a seprate timezone for Phoenix IT DOES!?!?!?!?!?! WHAT!!! DOPE
    var secondsFromGMTPhoenix: Int { return TimeZone.init(identifier: "America/Phoenix")!.secondsFromGMT() }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //print("MST", secondsFromGMTMST)
        print("Current", secondsFromGMTCurrent)
        //print("MDT", secondsFromGMTMDT)
        print("Phoenix", secondsFromGMTPhoenix)
        fetchData()
        view.backgroundColor = #colorLiteral(red: 0.07322113961, green: 0.2554511726, blue: 0.09455534071, alpha: 1)
        countdown.text = nil
        countdown.textColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        // OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  Undo that after I figure out wether to add or subtract or what the fuck I do with the offset
        Timer.scheduledTimer(timeInterval: 1,target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    @objc func tick(){
        let date = NSDate()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second, .year, .month, .day, .timeZone], from: date as Date)
        let currentDate = calendar.date(from: components)
        let userCalendar = Calendar.current
        let weddingDate = NSDateComponents()
        weddingDate.year = 2018
        weddingDate.month = 6
        weddingDate.day = 02
        weddingDate.hour = 13
        weddingDate.minute = 00
        weddingDate.second = 00
        weddingDate.timeZone = TimeZone.init(identifier: "America/Phoenix")
        let weddingDay = userCalendar.date(from: weddingDate as DateComponents)!
        let weddingDayDifference = calendar.dateComponents([.month, .day, .hour, .minute, .second, .timeZone], from: currentDate!, to: weddingDay)
        
        //this gets the diffrence between timezones
        //I am having alot of trouble deciding if I should be adding or subtracting or what.
        //I think I should be taking the offset of local minus Phoenix's cuz like the earth spinning or something...
        let offset = (secondsFromGMTCurrent - secondsFromGMTPhoenix) / 3600
        
        let monthsTill = weddingDayDifference.month
        let daysTill = weddingDayDifference.day
        let hoursTill = weddingDayDifference.hour! + offset
        let minutesTill = weddingDayDifference.minute
        let secondsTill = weddingDayDifference.second
        
        //print("off by", offset)
        //So this accounts for Timezone diffrence I figure that we want to add the offset cuz I gotta wait two hours my time for it to be that same time in Phoenix                                 Could be wrong though if so I'll change it, no big deal             I should ask Bolot about this.
        print("Months:", monthsTill ?? "N/A", "Days:", daysTill ?? "N/A", "Hours", hoursTill ?? "N/A", "Minutes:", minutesTill ?? "N/A", "Seconds", secondsTill ?? "N/A")
        countdown.text = "\(monthsTill ?? 0) Months, \(daysTill ?? 0) Days \n \(hoursTill ?? 0) H, \(minutesTill ?? 0) Min, \(secondsTill ?? 0) Sec"
        
    }
    
    func fetchData() {
        let url = URL(string: "https://raw.githubusercontent.com/OGMilkbone/WeddingApp/master/WeddingParty.json")!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, err) in
            let data = data!
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            let array = json as! [[String: Any]]
            //let partyMembers = array.map { Member(dictionary: $0) }
            //print(partyMembers)
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
