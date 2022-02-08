//
//  ATElementData.swift
//  AnimateText
//
//  Created by jasu on 2022/02/06.
//  Copyright (c) 2022 jasu All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is furnished
//  to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
//  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
//  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import SwiftUI

/// Informational data required for each element animation.
public struct ATElementData {
    
    /// Individual element `String`.
    public let element: String
    
    /// The type used to split text.
    public let type: ATUnitType
    
    /// The position of Element.
    public let index: Int
    
    /// The length of text.
    public let count: Int
    
    /// The value used for animation. (0 ~ 1)
    public var value: Double
    
    /// The size of the Text view.
    public var size: CGSize
    
    /// Correction to a value between 0.001 and 1.0.
    public var scale: Double {
        return correctValue(value)
    }
    
    /// Correction to a value between 1.0 and 0.001.
    public var invScale: Double {
        return correctValue(1.0 - value)
    }
    
    /// The inversion of the value used in the animation. (1 ~ 0)
    public var invValue: Double {
        return 1.0 - value
    }
    
    /// The value of the position of the current character in the entire text.
    /// A value between 0 and 1.
    public var locValue: Double {
        return correctValue(Double(index) / Double(count - 1))
    }
    
    /// Correction to a value between 0.001 and 1.0.
    private func correctValue(_ value: Double) -> Double {
        let newValue = max(value, 0.001)
        return min(newValue, 1.0)
    }
}
