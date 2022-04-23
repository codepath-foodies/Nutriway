//
//  RecipeDetailsViewController.swift
//  CodePath-Nutriway
//
//  Created by Admin Mac on 4/15/22.
//

import UIKit
import Foundation
import Parse

class RecipeDetailsViewController: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeInstructions: UILabel!
    
    @IBOutlet weak var carbsAmount: UILabel!
    @IBOutlet weak var proteinAmount: UILabel!
    @IBOutlet weak var fatAmount: UILabel!
    @IBOutlet weak var caloriesAmount: UILabel!
    
    var recipe: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let recipeId = recipe["id"] as! Int
        let stringId = String(recipeId)
        let url = URL(string: "https://api.spoonacular.com/recipes/\(stringId)/nutritionWidget.json/?apiKey=\(API_KEY)")
        
        var request = URLRequest(url: url!,
                                cachePolicy: .useProtocolCachePolicy,
                                timeoutInterval: 10.0)

        
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil && data != nil {
                do {
                    let dictionary = try (JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any])!
                    DispatchQueue.main.async{
                    
                        self.carbsAmount.text = dictionary["carbs"] as? String
                        self.proteinAmount.text = dictionary["protein"] as? String
                        self.fatAmount.text = dictionary["fat"] as? String
                        self.caloriesAmount.text = dictionary["calories"] as? String
                    }
                    
                }
                catch{
                    print("Error parsing response data")
                }
            }
        }
        
        recipeName.text = recipe["title"] as? String
        let imageURL = URL(string: recipe["image"] as? String ?? "https://spoonacular.com/recipeImages/664288-556x370.jpg")
        recipeImage.af.setImage(withURL: imageURL!)
        recipeInstructions.text = recipe["instructions"] as? String

        dataTask.resume()
        
    }
    
    
    @IBAction func addNutrition(_ sender: Any) {
        let foodIntake = PFObject(className: "FoodIntakes")
        if let number = Int(caloriesAmount.text?.components(separatedBy: CharacterSet.decimalDigits.inverted).joined() ?? "0") {
            foodIntake["calories"] = String(number)
        }
        if let number = Int(fatAmount.text?.components(separatedBy: CharacterSet.decimalDigits.inverted).joined() ?? "0") {
            foodIntake["fat"] = String(number)
        }
        if let number = Int(proteinAmount.text?.components(separatedBy: CharacterSet.decimalDigits.inverted).joined() ?? "0") {
            foodIntake["protein"] = String(number)
        }
        if let number = Int(carbsAmount.text?.components(separatedBy: CharacterSet.decimalDigits.inverted).joined() ?? "0") {
            foodIntake["carbs"] = String(number)
        }
        foodIntake["foodId"] = recipe["id"] as! Int
        foodIntake["username"] = PFUser.current()!
        
        foodIntake.saveInBackground { (success, error) in
            if success{
                print("Intake saved")
            } else {
                print("Error saving")
            }
        }
        self.dismiss(animated: true, completion: nil)
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
