import UIKit
import Alamofire

class NetworkService {
    
    
    let URL = "https://api.themoviedb.org/3/movie/popular?api_key=e24dd8d2f3822e3917d10c6570d7f574&language=en-US"
    typealias AlamofireResponse = ([Movie]?, Error?) -> Void
    
    func fetchMovies(completion: @escaping AlamofireResponse) {
        let request = AF.request(URL)
        request.responseJSON { (data) in
        
            guard let data = data.data else { return }
            
            do{
                let movies = try JSONDecoder().decode(Movies.self, from: data)
                completion(movies.results, nil)
            }catch {
                print("Error decoding == \(error)")
            }
        }
    }
    
}
