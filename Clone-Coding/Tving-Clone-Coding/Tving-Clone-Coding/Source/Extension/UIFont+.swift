import UIKit

struct AppFontName {
    static let thin = "Pretendard-Thin"
    static let light = "Pretendard-Light"
    static let regular = "Pretendard-Regular"
    static let medium = "Pretendard-Medium"
    static let bold = "Pretendard-Bold"
    static let semiBold = "Pretendard-SemiBold"
    static let extraBold = "Pretendard-ExtraBold"
    static let extraLight = "Pretendard-ExtraLight"
    static let black = "Pretendard-Black"
}

extension UIFont {
    
    @objc class func pretendedThinFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.thin, size: ScreenUtils.getWidth(size))!
    }
    
    @objc class func pretendedLightFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.light, size: ScreenUtils.getWidth(size))!
    }
    
    @objc class func pretendedRegularFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: ScreenUtils.getWidth(size))!
    }
    
    @objc class func pretendedMediumFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.medium, size: ScreenUtils.getWidth(size))!
    }
    
    @objc class func pretendeBoldFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: ScreenUtils.getWidth(size))!
    }
    
    @objc class func pretendedSemiBoldFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.semiBold, size: ScreenUtils.getWidth(size))!
    }
    
    @objc class func pretendedExtraBoldFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.extraBold, size: ScreenUtils.getWidth(size))!
    }
    
    @objc class func pretendedExtraLightFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.extraLight, size: ScreenUtils.getWidth(size))!
    }
    
    @objc class func pretendedHeavyFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.black, size: ScreenUtils.getWidth(size))!
    }
}
