//
//  ViewController.swift
//  TableView-Demo2
//
//  Created by Liu, Lynn on 16/10/2017.
//  Copyright © 2017 Liu, Lynn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var namesDic: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        let path = bundle.path(forResource: "names", ofType: "plist")
        print("\(String(describing: path))")
        namesDic = NSDictionary(contentsOfFile: path!)
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        return (namesDic?.allKeys.count)!
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return (namesDic?.allKeys[section] as! String)
    }
    
    public func sectionIndexTitles(for tableView: UITableView) -> [String]?{
        return (namesDic?.allKeys as! [String])
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let names: NSArray = namesDic?.object(forKey: namesDic?.allKeys[section] ?? "null") as! NSArray
        return (names.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:"cell")
        let names: NSArray = namesDic?.object(forKey: namesDic?.allKeys[indexPath.section] ?? "null") as! NSArray
        cell.textLabel?.text = names[indexPath.row] as? String
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

