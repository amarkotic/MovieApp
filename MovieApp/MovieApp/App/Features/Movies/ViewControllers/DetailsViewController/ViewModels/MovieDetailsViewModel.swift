struct MovieDetailsViewModel {
    
    let progressPercentage = "76%"
    let movieName = "Iron man 1"
    let releaseDate = "05/02/2008 (US)"
    let genresAndDuration = "Action, Science Fiction, Adventure  2h 6m"
    let overview = "After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil."
    let actors = [
        CastCollectionViewModel(
            nameLabel: "Robert Downey Jr.",
            roleLabel: "Tony Stark/Iron Man",
            imageName: "RobertDowney"),
        CastCollectionViewModel(
            nameLabel: "Robert Jr.",
            roleLabel: "Tony Stark/Iron Man",
            imageName: "RobertDowney"),
        CastCollectionViewModel(
            nameLabel: "Robert Downey Jr.",
            roleLabel: "Tony Stark/Iron Man",
            imageName: "RobertDowney"),
        CastCollectionViewModel(
            nameLabel: "Robert Jr.",
            roleLabel: "Tony Stark/Iron Man",
            imageName: "RobertDowney")
    ]
    
}
