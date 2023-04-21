import UIKit

extension UIButton {
    func setButtonBorder(radius: CGFloat,
                         borderWidht: CGFloat,
                         borderColor: CGColor) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidht
        self.layer.borderColor = borderColor
    }
    
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
