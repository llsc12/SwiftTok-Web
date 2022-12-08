
import Foundation

extension Data {
    var toString: String? {
        return String(data: self, encoding: .utf8)
    }
}
