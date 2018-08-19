//
//  VisualEffectViewContiner.swift
//  Oy'na 2
//
//  Created by Mailanov Adilbek on 8/15/18.
//  Copyright © 2018 Mailanov Adilbek. All rights reserved.
//

import UIKit

class VisualEffectViewContiner: UIVisualEffectView {

    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setParametrs()
        setModifiers()
    }
    
    private func setParametrs() {
        
    }
    
    private func setModifiers() {
        let modifierViewList: [ModifierView] = [
            ModifierViewCornerRadius(radius: Constant.CORNER_RADIUS.low!)
        ]
        
        ModifierViewFactory.deploy(view: self, modifierViewList: modifierViewList)
    }
}
