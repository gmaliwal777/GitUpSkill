//
//  LysnHeightProportionateUILabel.swift
//  LysnClientApp
//
//  Created by Bhushan Biniwale on 03/07/20.
//  Copyright © 2020 Cybage Softwares. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class LysnHeightProportionateUILabel : UILabel {
    
    // MARK: - Instance properties
    
    /// It is the standard font size against standard height.
    @IBInspectable var standardFontSize: CGFloat = 1.0 {
        didSet {
            if let proportionateFont = proportionateFont() {
                super.font = proportionateFont
            }
        }
    }
    
    /// It is the standard label height against which standard font size is defined.
    @IBInspectable var standardLabelHeight: CGFloat = 1.0 {
        didSet {
            if let proportionateFont = proportionateFont() {
                super.font = proportionateFont
            }
        }
    }
    
    // MARK: - UILabel class life cycle.
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let proportionateFont = proportionateFont() {
            super.font = proportionateFont
        }
    }
    
    // MARK: - Instance Methods
    
    
    /// It tells about the font where font size is proportionate to standard height.
    ///
    /// - Returns: Font.
    private func proportionateFont() -> UIFont? {
        
        let dynamicHeight = frame.size.height
        let proportionateFontSize = Float(( standardFontSize / standardLabelHeight ) * dynamicHeight)
        return font.withSize(CGFloat(proportionateFontSize))
    }
}
