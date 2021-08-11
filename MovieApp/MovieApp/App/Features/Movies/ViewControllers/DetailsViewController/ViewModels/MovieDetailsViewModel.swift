struct MovieDetailsViewModel {
    
    let info = MainInfoViewModel(
        progressPercentage: "76%",
        movieName: "Iron man 1",
        releaseDate: "05/02/2008 (US)",
        genresAndDuration: "Action, Science Fiction, Adventure  2h 6m"
    )
    
    let overview = OverviewViewModel(overview: "After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.")
    
    let actors = ActorsViewModel(
        actors: [
            ActorViewModel(
                nameLabel: "Robert Downey Jr.",
                roleLabel: "Tony Stark/Iron Man",
                imageName: "RobertDowney"
            ),
            ActorViewModel(
                nameLabel: "Robert Jr.",
                roleLabel: "Tony Stark/Iron Man",
                imageName: "RobertDowney"
            ),
            ActorViewModel(
                nameLabel: "Robert Downey Jr.",
                roleLabel: "Tony Stark/Iron Man",
                imageName: "RobertDowney"
            ),
            ActorViewModel(
                nameLabel: "Robert Jr.",
                roleLabel: "Tony Stark/Iron Man",
                imageName: "RobertDowney"
            )
        ]
    )
    
}
