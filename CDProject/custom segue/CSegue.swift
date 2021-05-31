//
//  CSegue.swift
//  CDProject
//
//  Created by Hamdi moh on 5/27/21.
//  Copyright © 2021 com.iug. All rights reserved.
//

import UIKit

class CSegue: UIStoryboardSegue {
    
    override func perform() {
        destination.transitioningDelegate = self
    }
    
    

}

extension CSegue : UIViewControllerTransitioningDelegate{
    
}

class moveToHomeSegue : NSObject , SignUpVC {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 2.0
    }
    
}
