import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isContainEnglish() -> Bool {
        let pattern = "[A-Za-z]+"
        guard let isContain = self.range(of: pattern, options: .regularExpression) else { return false}
        return true
    }
    
    func isContainNumber() -> Bool {
        let pattern = ".*[0-9]+.*"
        guard let isContain = self.range(of: pattern, options: .regularExpression) else { return false}
        return true
    }
    
    func isContainNumberAndAlphabet() -> Bool {
        let pattern = "^[0-9a-zA-Z]*$"
        guard let isContain = self.range(of: pattern, options: .regularExpression) else { return false}
        return true
    }
}
