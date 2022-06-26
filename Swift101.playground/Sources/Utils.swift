import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        get { return self.indices.contains(index) ? self[index] : nil }
    }
}
