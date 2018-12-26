//
//  ViewController.swift
//  Instagrid
//
//  Created by admin on 04/12/2018.
//  Copyright © 2018 Bouziane. All rights reserved.
//
import Photos
import UIKit

class ViewController: UIViewController {
    
    //LOGIC INITIALIZATION
    
    let pasteView = PasteView()
    //let image = UIImagePickerController()
    //var imagePicked = 0
    
    // VARIABLES DECLARATIONS
    
    //buttons déclarations
    @IBOutlet weak var layoutOneButton: UIButton!
    @IBOutlet weak var layoutTwoButton: UIButton!
    @IBOutlet weak var layoutThreeButton: UIButton!
    
    //buttons hover declaration
    @IBOutlet weak var buttonOneHover : UIImageView!
    @IBOutlet weak var buttonTwoHover : UIImageView!
    @IBOutlet weak var buttonThreeHover : UIImageView!
    //View paste
    @IBOutlet weak var paste: PasteView!
    //Paste Squares and Rect
    @IBOutlet private var squareOne: UIView!
    @IBOutlet private var squareTwo: UIView!
    @IBOutlet private var squareThree: UIView!
    @IBOutlet private var squareFour: UIView!
    @IBOutlet private var rectTop: UIView!
    @IBOutlet private var rectBot: UIView!
    //Image containers
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Init UI with the layout one and the button one selected
        showLayout(id:1)
        paste.type = .one
        buttonOneHover.isHidden = false
        buttonTwoHover.isHidden = true
        buttonThreeHover.isHidden = true
    }
    
    //BUTTON INTERACTIONS
    
    //show layout One and highlight button one
    @IBAction func selectLayoutOne(){
        showLayout(id:1)
        paste.type = .one
        buttonOneHover.isHidden = false
        buttonTwoHover.isHidden = true
        buttonThreeHover.isHidden = true
    }
    //show layout two and highlight button two
    @IBAction func selectLayoutTwo(){
        showLayout(id:2)
        paste.type = .two
        buttonOneHover.isHidden = true
        buttonTwoHover.isHidden = false
        buttonThreeHover.isHidden = true
    }
    //show layout three and highlight button three
    @IBAction func selectLayoutThree(){
        showLayout(id:3)
        paste.type = .three
        buttonOneHover.isHidden = true
        buttonTwoHover.isHidden = true
        buttonThreeHover.isHidden = false
    }
    
    func showLayout(id:Int){
        let displays = pasteView.getLayoutInfo(name: id)
        rectTop.isHidden = displays[0]
        rectBot.isHidden = displays[1]
        squareOne.isHidden = displays[2]
        squareTwo.isHidden = displays[3]
        squareThree.isHidden = displays[4]
        squareFour.isHidden = displays[5]
    }
    
    
    @IBAction func addPhotoS1(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status{
                case .authorized:
                    let myPickerController = UIImagePickerController()
                    myPickerController.sourceType = .photoLibrary
                    self.present(myPickerController, animated: true)
                default:
                    break
               /* case .notDetermined:
                    <#code#>
                case .restricted:
                    <#code#>
                case .denied:
                    <#code#>*/
                }
            }
        }
    }
    
    @IBAction func addPhotoS2(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status{
                case .authorized:
                    let myPickerController = UIImagePickerController()
                    myPickerController.sourceType = .photoLibrary
                    self.present(myPickerController, animated: true)
                default:
                    break
                    /* case .notDetermined:
                     <#code#>
                     case .restricted:
                     <#code#>
                     case .denied:
                     <#code#>*/
                }
            }
        }
    }
    
    @IBAction func addPhotoS3(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status{
                case .authorized:
                    let myPickerController = UIImagePickerController()
                    myPickerController.sourceType = .photoLibrary
                    self.present(myPickerController, animated: true)
                default:
                    break
                    /* case .notDetermined:
                     <#code#>
                     case .restricted:
                     <#code#>
                     case .denied:
                     <#code#>*/
                }
            }
        }
    }
    
    @IBAction func addPhotoS4(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status{
                case .authorized:
                    let myPickerController = UIImagePickerController()
                    myPickerController.sourceType = .photoLibrary
                    self.present(myPickerController, animated: true)
                default:
                    break
                    /* case .notDetermined:
                     <#code#>
                     case .restricted:
                     <#code#>
                     case .denied:
                     <#code#>*/
                }
            }
        }
    }
    
    @IBAction func addPhotoRectB(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status{
                case .authorized:
                    let myPickerController = UIImagePickerController()
                    myPickerController.sourceType = .photoLibrary
                    self.present(myPickerController, animated: true)
                default:
                    break
                    /* case .notDetermined:
                     <#code#>
                     case .restricted:
                     <#code#>
                     case .denied:
                     <#code#>*/
                }
            }
        }
    }
    
    @IBAction func addPhotoRectT(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status{
                case .authorized:
                    let myPickerController = UIImagePickerController()
                    myPickerController.sourceType = .photoLibrary
                    self.present(myPickerController, animated: true)
                default:
                    break
                    /* case .notDetermined:
                     <#code#>
                     case .restricted:
                     <#code#>
                     case .denied:
                     <#code#>*/
                }
            }
        }
    }
    

    
    /*
    //IMPORT IMAGE
    
    func imagePickerController(){
        switch imagePicked{
        case 1:
            image1.image = image
        case 2:
            image2.image = image
        case 3:
            image3.image = image
        case 4:
            image4.image = image
        case 5:
            image5.image = image
        case 6:
            image6.image = image
        default:
            print("erreur")
        }
    }
    
    func importImageFromAlbum(_ image: UIImagePickerController){
        image.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
    }

    @IBAction func importImage(_ sender : UIButton){
        imagePicked = 1
        importImageFromAlbum(image)
        self.present(image, animated: true){
            self.image1.isHidden = false
        }
        
    }
    
    @IBAction func importImage2(_ sender : UIButton){
        imagePicked = 2
        importImageFromAlbum(image)
        self.present(image, animated: true){
            self.image2.isHidden = false
        }
        
    }
    
    @IBAction func importImage3(_ sender : UIButton){
        imagePicked = 3
        importImageFromAlbum(image)
        self.present(image, animated: true){
            self.image3.isHidden = false
        }
        
    }
    
    @IBAction func importImage4(_ sender : UIButton){
        imagePicked = 4
        importImageFromAlbum(image)
        self.present(image, animated: true){
            self.image4.isHidden = false
        }
        
    }
    
    @IBAction func importImage5(_ sender : UIButton){
        imagePicked = 5
        importImageFromAlbum(image)
        self.present(image, animated: true){
            self.image5.isHidden = false
        }
        
    }
    
    @IBAction func importImage6(_ sender : UIButton){
        imagePicked = 6
        importImageFromAlbum(image)
        self.present(image, animated: true){
            self.image6.isHidden = false
        }
        
    }
    
    */
    
    

}
