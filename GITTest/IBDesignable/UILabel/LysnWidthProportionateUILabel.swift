//
//  LysnWidthProportionateUILabel.swift
//  LysnClientApp
//
//  Created by Bhushan Biniwale on 03/07/20.
//  Copyright © 2020 Cybage Softwares. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class LysnWidthProportionateUILabel : UILabel {
    
    // MARK: - Instance Properties
    
    /// It is the standard font size against standard width, default it is set to 1.0
    @IBInspectable var standardFontSize : CGFloat = 1.0 {
        didSet {
            if let proportionateFont = proportionateFont() {
                super.font = proportionateFont
            }
        }
    }
    
    /// It is the standard label width, against it font is defined for the label.
    @IBInspectable var standardLabelWidth : CGFloat = 1.0 {
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
    
    
    /// It tells about the font where font size is proportionate to runtime width of the label.
    ///
    /// - Returns: Font.
    private func proportionateFont() -> UIFont? {
        let dynamicWidth = frame.size.width
        let proportionateFontSize = ( standardFontSize / standardLabelWidth ) * dynamicWidth
        return font.withSize(proportionateFontSize)
    }
}
