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
    
  /*  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let removed = UITableViewRowAction(style: .default, title: "\nRemove") { action, indexPath in }
//        remove.image = UIImage(named: "remove")
        
        removed.backgroundColor = UIColor(patternImage: UIImage(named: "remove")!)
        
        let editAction = UITableViewRowAction(style: .default, title: "") { (tableViewAction, index) in
            
        }
        
        let image:UIImage = UIImage(named: "remove")!
        image.withRenderingMode(UIImageRenderingMode.automatic)
        
        let size = image.size.applying(CGAffineTransform(scaleX: 0.29, y: 0.3))
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        image.draw(in: CGRect(origin: CGPoint.zero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        editAction.backgroundColor = UIColor(patternImage: scaledImage!)

        return [editAction]
    }*/
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let delete = TableViewRowAction(style: UITableViewRowActionStyle.default, title: "         ") { action, indexPath in }
        delete.image = UIImage(named: "remove")
        
//        let sharing = TableViewRowAction(style: UITableViewRowActionStyle.default, title: "         ") { action, indexPath in }
//        sharing.backgroundColor = UIColor.lightGray
//        sharing.image = UIImage(named: "remove")
        
        return [delete]
    }
}

class TableViewRowAction: UITableViewRowAction
{
    var image: UIImage?
    
    func _setButton(button: UIButton)
    {
        if let image = image, let titleLabel = button.titleLabel
        {
            let labelString = NSString(string: titleLabel.text!)
            let titleSize = labelString.size(attributes: [NSFontAttributeName: titleLabel.font])
            
            button.tintColor = UIColor.white
            button.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
            button.imageEdgeInsets.right = -titleSize.width
        }
    }
}
