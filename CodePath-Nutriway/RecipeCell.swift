//
//  RecipeCell.swift
//  CodePath-Nutriway
//
//  Created by Admin Mac on 4/22/22.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var isVegetarian: UILabel!
    @IBOutlet weak var isVegan: UILabel!
    @IBOutlet weak var isGluten: UILabel!
    @IBOutlet weak var isHealthy: UILabel!
    @IBOutlet weak var isKeto: UILabel!
    @IBOutlet weak var isDairy: UILabel!
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var favorited : Bool = false
    var recipeID : Int = -1
    
    @IBAction func favoriteRecipe(_ sender: Any) {
        let tobeFavorited = !favorited
        if(tobeFavorited){
            self.setFavorite(true)
        } else {
            self.setFavorite(false)
        }
        
    }
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favoriteButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else{
            favoriteButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
