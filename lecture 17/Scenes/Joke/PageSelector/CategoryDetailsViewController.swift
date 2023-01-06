//
//  CategoryDetailsViewController.swift
//  lecture 17
//
//  Created by omari katamadze on 05.01.23.
//

import UIKit

class CategoryDetailsViewController: UIViewController {
    var jokeAPIManager : JokesAPIManagerProtocol?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    var text : String = ""
    var type : CategoriesType = .animal
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = "type"
        fetchDrinks(with: type)
    }
    

static    func getInstance (type : CategoriesType) -> CategoryDetailsViewController{
        
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "CategoryDetailsViewController") as! CategoryDetailsViewController
        vc.type = type
         return vc
    }
    
    private func fetchDrinks(with type: CategoriesType = .animal) {
           jokeAPIManager = JokesAPIManager()
           
        jokeAPIManager?.fetchJoke(with: type, completion: { result in
            switch result {
            case .success(let joke):
                self.titleLabel.text = "⭐️ \(type) ⭐️"
                self.textLabel.text = joke.text
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
       
       }

    @IBAction func didTabfetch(_ sender: Any) {
        fetchDrinks(with: type)
    }
}
