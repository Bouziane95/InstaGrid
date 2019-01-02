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
    let logic = Logic()
    
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
    
    func full() -> Bool{
        //SquareOne ImageView
        let view1 = self.viewWithTag(1) as! UIImageView
        //SquareTwo ImageView
        let view2 = self.viewWithTag(2) as! UIImageView
        //SquareThree ImageView
        let view3 = self.viewWithTag(3) as! UIImageView
        //SquareFour ImageView
        let view4 = self.viewWithTag(4) as! UIImageView
        //RectTop ImageView
        let view5 = self.viewWithTag(5) as! UIImageView
        //RectBot ImageView
        let view6 = self.viewWithTag(6) as! UIImageView
        
        //Init the validation at false
        var checkSuccess = false
        
        switch self.type{
        case .one:
            checkSuccess = logic.checkIfFullThree(view3, view4, view5)
        case .two:
            checkSuccess = logic.checkIfFullThree(view1, view2, view6)
        case .three:
            checkSuccess = logic.checkIfFullFour(view1, view2, view3, view4)
        }
        
        return checkSuccess
        
    }
}
