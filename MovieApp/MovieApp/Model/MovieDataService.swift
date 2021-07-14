import UIKit

class MovieDataService {
    
    func fetchMovies() -> [Movie] {
        [
                 Movie(image: UIImage(named: "ironman1"), title: "Iron Man (2008)", description: "After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil."),
                 Movie(image: UIImage(named: "ironman2"), title: "Iron Man 2 (2010)", description: "With the world now aware of his dual life as the armored superhero Iron Man, billionaire inventor Tony Stark faces pressure from the government..."),
                 Movie(image: UIImage(named: "ironman3"), title: "Iron Man 3 (2013)", description: "With the world now aware of his dual life as the armored superhero Iron Man, billionaire inventor Tony Stark faces pressure from the government....")
        ]
    }
    
}
