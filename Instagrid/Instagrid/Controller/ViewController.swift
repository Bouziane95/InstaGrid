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
    let image = UIImagePickerController()
    var imagePicked = 0
    var orientation = false
    let logic = Logic()
    
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
    
   
    
    //@IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Init UI with the layout one and the button one selected
        showLayout(id:1)
        buttonOneHover.isHidden = false
        buttonTwoHover.isHidden = true
        buttonThreeHover.isHidden = true
    
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(dragPaste(swipe:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(dragPaste(swipe:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        self.view.addGestureRecognizer(swipeLeft)
        
        orientation = logic.checkOrientation()
        if orientation{
            let landscapeRawValue = UIInterfaceOrientation.landscapeLeft.rawValue
            UIDevice.current.setValue(landscapeRawValue, forKey: "orientation")
        } else {
            
        }
    }
    
    
    
    @objc func swipeGesture(sender: UIGestureRecognizer){
        if let swipeGesture = sender as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                let activityVC = UIActivityViewController(activityItems: [self.paste], applicationActivities: nil)
                activityVC.popoverPresentationController?.sourceView = self.view
                self.present(activityVC, animated: true, completion: nil)
            default:
                break
            }
        }
        
    }
    
    //BUTTON INTERACTIONS
    
    //show layout One and highlight button one
    @IBAction func selectLayoutOne(){
        showLayout(id:1)
        buttonOneHover.isHidden = false
        buttonTwoHover.isHidden = true
        buttonThreeHover.isHidden = true
    }
    //show layout two and highlight button two
    @IBAction func selectLayoutTwo(){
        showLayout(id:2)
        buttonOneHover.isHidden = true
        buttonTwoHover.isHidden = false
        buttonThreeHover.isHidden = true
    }
    //show layout three and highlight button three
    @IBAction func selectLayoutThree(){
        showLayout(id:3)
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
    
    
    //Access to the photo library for each button and ask the permission of access
    fileprivate func presentPhotoPickerController() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true)
    }
    
    fileprivate func LibraryAccessRestricted() {
        let alert = UIAlertController(title: "Photo Library access restricted", message: "Photo Library is rectricted and cannot be accessed", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    func restrictions(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status{
                case .authorized:
                    self.presentPhotoPickerController()
                    
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized{
                        self.presentPhotoPickerController()
                    }
                    
                case .restricted:
                    self.LibraryAccessRestricted()
                    
                    
                case .denied:
                    let alert = UIAlertController(title: "Photo Library access denied", message: "Previously denied, please change your settings if you want to change this", preferredStyle: .alert)
                    let goToSettingsAction = UIAlertAction(title: "Go to settings", style: .default){ (action) in
                        DispatchQueue.main.async {
                            let url = URL(string: UIApplication.openSettingsURLString)!
                            UIApplication.shared.open(url, options: [:])
                        }
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    
                    alert.addAction(goToSettingsAction)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true)
                }
            }
        }
        
    }
    @IBAction func addPhotoS1(_ sender: UIButton) {
        imagePicked = 1
        restrictions()
    }
    
    @IBAction func addPhotoS2(_ sender: UIButton) {
        imagePicked = 2
        restrictions()
    }
    
    @IBAction func addPhotoS3(_ sender: UIButton) {
        imagePicked = 3
        restrictions()
    }
    
    @IBAction func addPhotoS4(_ sender: UIButton) {
        imagePicked = 4
        restrictions()
    }
    
    @IBAction func addPhotoRectT(_ sender: UIButton) {
        imagePicked = 5
        restrictions()
    }
    
    @IBAction func addPhotoRectB(_ sender: UIButton) {
        imagePicked = 6
        restrictions()
    }
    
    private func popAlert(title : String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {(action) in alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true)
    }
    
    private func share(){
        if  paste.full(){
            transformPaste()
            saveAndShare()
        } else{
            popAlert(title: "Caution", message: "All the spaces are not filled")
        }
    }
    
    private func saveAndShare(){
        let imageToSave = logic.convertUiViewToImage(from: paste)
        let activityC = UIActivityViewController(activityItems: [imageToSave!], applicationActivities: nil)
        present(activityC, animated: true)
    }
    
    @objc private func dragPaste(swipe: UISwipeGestureRecognizer){
        orientation = logic.checkOrientation()
        if orientation == false && swipe.direction == .up{
            share()
        } else if orientation == true && swipe.direction == .left{
            share()
        } else{
            popAlert(title: "Ouch", message: "This swipe is not allowed in this orientation")
        }
    }
    
    //Animation the paste view when you share ( swipe up ) and goes back ( y: -600 )
    private func transformPaste(){
        let transform = CGAffineTransform(translationX: 0, y: -600)
        UIView.animate(withDuration: 0.3, animations: {self.paste.transform = transform}) {(success) in if success {self.resetPaste()}}
    }
    
    //For reset the photos after the share
   private func resetPaste(){
        self.image1.isHidden = true
        self.image2.isHidden = true
        self.image3.isHidden = true
        self.image4.isHidden = true
        self.image5.isHidden = true
        self.image6.isHidden = true
        self.image1.image = nil
        self.image2.image = nil
        self.image3.image = nil
        self.image4.image = nil
        self.image5.image = nil
        self.image6.image = nil
        self.image1.isHidden = false
        self.image2.isHidden = false
        self.image3.isHidden = false
        self.image4.isHidden = false
        self.image5.isHidden = false
        self.image6.isHidden = false
        
        UIView.animate(withDuration: 0.7, delay: 0.5, options: [], animations: {self.paste.transform = .identity})
    }
    
}

//IMPORT IMAGE
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
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
                print("Error while loading the photo")
            }
            dismiss(animated: true, completion: nil)
        }
    }
}
