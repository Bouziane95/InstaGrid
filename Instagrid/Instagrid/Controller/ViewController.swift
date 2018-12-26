//
//  ViewController.swift
//  Instagrid
//
//  Created by admin on 04/12/2018.
//  Copyright © 2018 Bouziane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    //LOGIC INITIALIZATION
    
    let pasteView = PasteView()
    
    
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
    

}
