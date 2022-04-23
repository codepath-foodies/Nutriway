//
//  FeedViewController.swift
//  CodePath-Nutriway
//
//  Created by Admin Mac on 4/22/22.
//

import UIKit
import AlamofireImage
import Parse

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var recipes = [[String:Any]]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipeCell
        let recipe = recipes[indexPath.row]
        let name = recipe["title"] as! String
        let image = recipe["image"] as? String ?? "https://spoonacular.com/recipeImages/664288-556x370.jpg"
        let imageURL = URL(string: image)
        cell.recipeName.text = name
        cell.recipeImage.af.setImage(withURL: imageURL!)
        let vegetarian = recipe["vegetarian"] as! NSNumber
        let vegan = recipe["vegan"] as! NSNumber
        let glutenfree = recipe["glutenFree"] as! NSNumber
        let dairyfree = recipe["dairyFree"] as! NSNumber
        let healthy = recipe["veryHealthy"] as! NSNumber
        let cheap = recipe["cheap"] as! NSNumber
        cell.isVegetarian.text = vegetarian.stringValue == "1" ? "Yes" : "No"
        cell.isVegan.text = vegan.stringValue == "1" ? "Yes" : "No"
        cell.isGluten.text = glutenfree.stringValue == "1" ? "Yes" : "No"
        cell.isDairy.text = dairyfree.stringValue == "1" ? "Yes" : "No"
        cell.isHealthy.text = healthy.stringValue == "1" ? "Yes" : "No"
        cell.isKeto.text = cheap.stringValue == "1" ? "Yes" : "No"
                
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://api.spoonacular.com/recipes/random?apiKey=\(API_KEY)&number=20")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                print(error.localizedDescription)
             } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 self.recipes = dataDictionary["recipes"] as! [[String:Any]]
                 self.tableView.reloadData()

             }
        }
        task.resume()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let cell = sender as? UITableViewCell else { return }
        let indexPath = tableView.indexPath(for: cell)!
        let recipe = recipes[indexPath.row]
            
        let detailsViewController = segue.destination as! RecipeDetailsViewController
        detailsViewController.recipe = recipe
        tableView.deselectRow(at: indexPath, animated: true)
    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
