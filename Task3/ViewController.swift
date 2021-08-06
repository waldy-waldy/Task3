//
//  ViewController.swift
//  Task3
//
//  Created by neoviso on 8/6/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    var countries: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for localeCode in NSLocale.isoCountryCodes {
            let current = NSLocale.current as NSLocale
            let countryName = current.displayName(forKey: NSLocale.Key.countryCode, value: localeCode)!
            countries.append(countryName)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView.estimatedRowHeight = 44.0
        //tableView.rowHeight = UITableView.automaticDimension
        
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CountryTableCell = self.tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryTableCell
        cell.countryNameLabel.text = countries[indexPath.row]
        return cell
    }
    

}

