//
//  NewRecipeViewController.swift
//  CodePath-Nutriway
//
//  Created by Leslie Segovia on 4/22/22.
//

import UIKit
import AlamofireImage

class NewRecipeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var RecipeNameLabel: UILabel!
    @IBOutlet weak var RecipeNameTextField: UITextField!
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var DescriptionTextField: UITextField!
    
    @IBOutlet weak var NutritionLabel: UILabel!
    
    @IBOutlet weak var CaloriesTextField: UITextField!
    @IBOutlet weak var FatTextField: UITextField!
    @IBOutlet weak var ProteinTextField: UITextField!
    @IBOutlet weak var CarbsTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func onAddImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 322, height: 322)
        let scaledImage = image.af.imageScaled(to: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
        
    }
    
//    @IBAction func submitNewRecipe(_ sender: Any) {
//        
//    }
}
