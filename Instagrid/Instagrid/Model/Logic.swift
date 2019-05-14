//
//  Logic.swift
//  Instagrid
//
//  Created by admin on 31/12/2018.
//  Copyright © 2018 Bouziane. All rights reserved.
//

import Foundation
import UIKit


class Logic{
    func checkOrientation() -> Bool{
        var landscapeOrientation = false
        if UIDevice.current.orientation.isLandscape{
            landscapeOrientation = true
        }else{
            landscapeOrientation = false
        }
        return landscapeOrientation
    }
    
    func convertUiViewToImage(from view: PasteView) -> UIImage?{
        
        //Define the zone we want to capture
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        
        //Capture the image
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    //Function to check if an UIImageView has an image inside
    func checkIfImageIsLoaded(view: UIImageView) -> Bool{
        var imageLoaded = false
        if view.image != nil{
            print("There is an image already")
            imageLoaded = true
        } else{
            imageLoaded = false
        }
        return imageLoaded
    }
    
    //Function to check if 3 images paste is full
    func checkIfFullThree(_ view1: UIImageView, _ view2: UIImageView, _ view3: UIImageView) -> Bool{
        var checkSuccess = false
        if view1.image != nil && view2.image != nil && view3.image != nil{
            checkSuccess = true
        } else{
            checkSuccess = false
        }
        
        return checkSuccess
    }
    
    //Function to check if 4 images paste is full
    func checkIfFullFour(_ view1: UIImageView, _ view2: UIImageView, _ view3: UIImageView, _ view4: UIImageView) -> Bool{
        var checkSuccess = false
        if view1.image != nil && view2.image != nil && view3.image != nil && view4.image != nil{
            checkSuccess = true
        } else{
            checkSuccess = false
        }
        return checkSuccess
    }
}
