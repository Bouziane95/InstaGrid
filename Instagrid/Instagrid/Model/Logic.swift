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
            print("Landscape")
        }else{
            print("Portrait")
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
}
