import Foundation
import UIKit

final class ScreenUtils {
    
    static func getWidth(_ value: CGFloat) -> CGFloat {
        let width = UIScreen.main.bounds.width
        let standartWidth: CGFloat = 375.0
        return width / standartWidth * value
    }
    
    static func getHeight(_ value: CGFloat) -> CGFloat {
        let height = UIScreen.main.bounds.height
        let standardHeight: CGFloat = 812.0
        return height / standardHeight * value
    }
}
