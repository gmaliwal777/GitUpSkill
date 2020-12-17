//
//  LysnHeightProportionateUIButton.swift
//  LysnClientApp
//
//  Created by Bhushan Biniwale on 03/07/20.
//  Copyright © 2020 Cybage Softwares. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class LysnHeightProportionateUIButton : UIButton {
    
    // MARK: - Instance properties
    
    /// It is the standard font size against standard height.
    @IBInspectable var standardFontSize: CGFloat = 1.0 {
        didSet {
            if let proportionateFont = proportionateFont() {
                titleLabel?.font = proportionateFont
            }
        }
    }
    
    /// It is the standard button height, against which standard font size is defined.
    @IBInspectable var standardButtonHeight: CGFloat = 1.0 {
        didSet {
            if let proportionateFont = proportionateFont() {
                titleLabel?.font = proportionateFont
            }
        }
    }
    
    // MARK: - UIButton class life cycle.
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let proportionateFont = proportionateFont() {
            titleLabel?.font = proportionateFont
        }
    }
    
    // MARK: - Instance Methods
    
    /// It tells about the font where font size is proportionate to standard height.
    ///
    /// - Returns: Font.
    private func proportionateFont() -> UIFont? {
        let dynamicButtonHeight = frame.size.height
        let proportionateFontSize = ( standardFontSize / standardButtonHeight ) * dynamicButtonHeight
        return titleLabel?.font.withSize(proportionateFontSize)
    }
}
