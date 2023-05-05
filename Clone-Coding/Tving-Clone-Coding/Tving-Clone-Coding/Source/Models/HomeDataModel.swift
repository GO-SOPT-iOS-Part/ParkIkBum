import Foundation
import UIKit

struct HomeDataModel {
    let data: [HomeData]
}

struct HomeData {
    let sectionTitle: String
    let data: [dataClass]
}

struct dataClass {
    let image: UIImage
    let title: String
    let rank: Int?
    let maker: String?
    let rating: Float?
}
