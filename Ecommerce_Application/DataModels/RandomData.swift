//
//  RandomData.swift
//  Ecommerce_Application
//
//  Created by Sejal on 12/03/23.
//

import Foundation
import UIKit

class RandomData {
    
    let uiImages = [UIImage(named: "shopping1"),UIImage(named: "shopping2"),UIImage(named: "shopping3"),UIImage(named: "shopping4"),UIImage(named: "shopping5"),UIImage(named: "shopping6"),UIImage(named: "shopping7"),UIImage(named: "shopping8"),UIImage(named: "shopping9"),UIImage(named: "shopping10") ]
    
    let uiColors = [UIColor(hexString: "#0097A7"),UIColor(hexString: "#B2EBF2")]
    
    func getRandomUIImage() -> UIImage? {
        let num = Int.random(in: 0...uiImages.count-1)
        return uiImages[num]
    }
    
    func getRandomUIImage(index: Int) -> UIImage{
        return uiImages[index]!
    }
    
    func getRandomUIColour() -> UIColor{
        let index = Int.random(in: 0...uiColors.count-1)
        return uiColors[index]
    }
}



extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
