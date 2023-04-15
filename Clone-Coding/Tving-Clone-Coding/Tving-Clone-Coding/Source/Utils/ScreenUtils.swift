import Foundation
import UIKit

final class ScreenUtils {
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    static func getWidth(_ value: CGFloat) -> CGFloat {
        let width: CGFloat = 375.0
        return self.width / width
    }
    
    static func getHeight(_ value: CGFloat) -> CGFloat {
        let height: CGFloat = 812.0
        return self.height / height
    }
}
