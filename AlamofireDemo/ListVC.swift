//
//  ListVC.swift
//  AlamofireDemo
//
//  Created by Codiant Mac  on 4/3/17.
//  Copyright © 2017 Codiant Software Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    var arr = [[String:AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (res) in
            if ((res.result.value) != nil){
                let str = JSON(res.result.value!)
                if let resData = str["contacts"].arrayObject {
                    self.arr = resData as! [[String:AnyObject]]
                }
                if self.arr.count > 0 {
                    self.tblView.reloadData()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        var dict = arr[indexPath.row]
        cell.textLabel?.text = dict["name"] as! String?
        cell.detailTextLabel?.text = dict["email"] as! String?
        return cell
    }
}
