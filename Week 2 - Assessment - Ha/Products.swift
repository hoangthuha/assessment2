import Foundation
import UIKit

class Products {
    var name : String = ""
    var launchDate : String = ""
    var image: UIImage = UIImage(named : "") ?? UIImage()
    var link : String = ""
    
    init(link : String) {
    self.link = link
    }
    
    init(name: String, launchDate : String, imageName : String, link : String) {
        self.name = name
        self.launchDate = launchDate
        self.link = link
        if let productImage = UIImage(named: imageName) {
            self.image = productImage
        }
    }
}


