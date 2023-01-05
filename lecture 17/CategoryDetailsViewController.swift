//
//  CategoryDetailsViewController.swift
//  lecture 17
//
//  Created by omari katamadze on 05.01.23.
//

import UIKit

class CategoryDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var index : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = "\(index)"
    }
    

static    func getInstance (index : Int) -> CategoryDetailsViewController{
        
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "CategoryDetailsViewController") as! CategoryDetailsViewController
        vc.index = index
         return vc
    }

}
