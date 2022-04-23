//
//  ProgressViewController.swift
//  CodePath-Nutriway
//
//  Created by Admin Mac on 4/23/22.
//

import UIKit
import Parse

class ProgressViewController: UIViewController {
    
    @IBOutlet weak var caloriesAmount: UILabel!
    @IBOutlet weak var fatAmount: UILabel!
    @IBOutlet weak var proteinAmount: UILabel!
    @IBOutlet weak var carbsAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateNutrition()
    }
    
    func updateNutrition(){
        var calories = 0
        var fat = 0
        var protein = 0
        var carbs = 0
        var calquery = ""
        var fatquery = ""
        var carbquery = ""
        var proteinquery = ""
        
        let query = PFQuery(className: "FoodIntakes")
        query.whereKey("username", equalTo: PFUser.current())
        query.findObjectsInBackground { (objects, error) in
            if objects?.count != 0 {
                for object in objects ?? []{
                    calquery = object["calories"] as! String
                    calories = calories + Int(calquery)!
                    self.caloriesAmount.text = String(calories)
                    fatquery = object["fat"] as! String
                    fat = fat + Int(fatquery)!
                    self.fatAmount.text = String(fat)
                    carbquery = object["carbs"] as! String
                    carbs = carbs + Int(carbquery)!
                    self.carbsAmount.text = String(carbs)
                    proteinquery = object["protein"] as! String
                    protein = protein + Int(proteinquery)!
                    self.proteinAmount.text = String(protein)

            
                }
            }
        }
        
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
