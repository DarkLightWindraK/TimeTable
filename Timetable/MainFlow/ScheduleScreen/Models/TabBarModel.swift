import Foundation
import UIKit

enum TabBarModel {
    case timeTable
    
    var title: String {
        switch self {
        case .timeTable:
            return "Расписание"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .timeTable:
            return UIImage(systemName: "note.text")
        }
    }
    
    var selectedImage: UIImage? {
        return image
    }
}
