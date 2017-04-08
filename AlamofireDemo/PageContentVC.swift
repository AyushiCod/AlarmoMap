//
//  PageContentVC.swift
//  AlamofireDemo
//
//  Created by Codiant Mac  on 4/4/17.
//  Copyright © 2017 Codiant Software Technologies Pvt Ltd. All rights reserved.
//

import UIKit

class PageContentVC: UIViewController {

    var pageIndex : Int = 0
    var strImg : String!

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named:strImg)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
