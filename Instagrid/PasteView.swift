//
//  PasteView.swift
//  Instagrid
//
//  Created by admin on 19/12/2018.
//  Copyright © 2018 Bouziane. All rights reserved.
//

import UIKit

class PasteView: UIView {

    //Enum of the 3 initial Layouts
    enum Layouts: Int{
        case one = 1
        case two = 2
        case three = 3
    }
    
    //Init the PasteView with the layout one
    var type:Layouts = .one
    
    /* This function return an array of bool that say which square or rect view is hidden or not for each view is selected
     I have done an array with this order : RectTop, RectBot, squareOne, squareTwo, squareThree, squareFour */
    
    func getLayoutInfo(name:Int) -> [Bool]{
        switch name{
        case 1:
            return [false,true,true,true,false,false]
        case 2:
            return [true,false,false,false,true,true]
        case 3:
            return [true,true,false,false,false,false]
        default:
            return [false,true,true,true,false,false]
            
        }
    }
    
   
    

}
