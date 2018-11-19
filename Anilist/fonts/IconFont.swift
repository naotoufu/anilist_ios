//
//  IconFont.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/19.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
import UIKit
public final class IconFont {
    public class func string(fromIcon icon: FontIcon, size: CGFloat = CGFloat(12), color: UIColor?) -> NSAttributedString? {
        
        guard let font = IconFont.iconFont(size) , let string = stringForIcon(icon) else { return nil }
        
        var attributes = [NSAttributedString.Key : AnyObject]()
        attributes[NSAttributedString.Key.font] = font
        
        if let color = color {
            attributes[NSAttributedString.Key.foregroundColor] = color
        }
        
        return NSAttributedString(string: string, attributes: attributes)
    }
    
    public class func image(fromIcon icon: FontIcon, size: CGFloat, color: UIColor?) -> UIImage? {
        
        if size == 0.0 {
            return nil
        }
        
        guard let symbol = string(fromIcon: icon, size: size, color: color) else { return nil }
        
        let mutableSymbol = NSMutableAttributedString(attributedString: symbol)
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        mutableSymbol.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, mutableSymbol.length))
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        mutableSymbol.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    private class func iconFont(_ size: CGFloat) -> UIFont? {
        if size == 0.0 {
            return nil
        }
        let iconfont = "Linearicons-Free"
        loadMyCustomFont(iconfont)
        return UIFont(name: iconfont, size: size)
    }
    
    private class func loadMyCustomFont(_ name:String) {
        guard let fontPath = Bundle(for: IconFont.self).path(forResource: name, ofType: "ttf") else {
            return
        }
        
        var error: Unmanaged<CFError>?
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: fontPath)) , let provider = CGDataProvider(data: data as CFData) else {
            return
        }
        
        let font = CGFont(provider)
        CTFontManagerRegisterGraphicsFont(font!, &error)
        if error != nil {
            return
        }
    }
    
    private class func stringForIcon(_ icon : FontIcon) -> String? {
        
        var rawIcon = icon.rawValue;
        let xPtr = withUnsafeMutablePointer(to: &rawIcon, { $0 })
        return String(bytesNoCopy: xPtr, length:MemoryLayout<UInt32>.size, encoding: String.Encoding.utf32LittleEndian, freeWhenDone: false)
    }
}

public enum FontIcon: UInt32 {
    case search = 0xe86f
    case list = 0xe872
}
