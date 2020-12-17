//
//  LysnWidthProportionateUIButton.swift
//  LysnClientApp
//
//  Created by Bhushan Biniwale on 10/07/20.
//  Copyright © 2020 Cybage Softwares. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class LysnWidthProportionateUIButton : UIButton {
    
    // MARK: - Instance Properties
    
    /// It is the standard font size against standard height.
    @IBInspectable var standardFontSize: CGFloat = 1.0 {
        didSet {
            if let proportionateFont = proportionateFont() {
                titleLabel?.font = proportionateFont
            }
        }
    }
    
    /// It is the standard button height, against which standard font size is defined.
    @IBInspectable var standardButtonWidth: CGFloat = 1.0 {
        didSet {
            if let proportionateFont = proportionateFont() {
                titleLabel?.font = proportionateFont
            }
        }
    }
    
    
    // MARK: - UILabel class life cycle.
    
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
        let dynamicWidth = frame.size.width
        let proportionateFontSize = ( standardFontSize / standardButtonWidth ) * dynamicWidth
        return titleLabel?.font.withSize(proportionateFontSize)
    }
}
