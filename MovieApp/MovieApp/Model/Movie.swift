import UIKit

struct Movies: Codable {
    
    let results: [Movie]
    
}



struct Movie: Codable {
    var image : String
    var title : String
    var description : String
    
    enum CodingKeys: String, CodingKey {
        case image = "poster_path"
        case title = "original_title"
        case description = "overview"
    }
}
