struct MovieDetailsViewModel {
    
    let info = MainInfoViewModel(
        progressPercentage: "76%",
        movieName: "Iron man 1",
        releaseDate: "05/02/2008 (US)",
        genresAndDuration: "Action, Science Fiction, Adventure  2h 6m"
    )
    
    let overview = OverviewViewModel(overview: "After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.")
    
    let actors = [
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
    
    let review = SocialViewModel(
        author: "The Peruvian Post",
        date: "February 17, 2020",
        review: "When director Jon Favreau and Sarah Halley cast Robert Downey Jr, they glimpsed something magnificent: a more-than-skilled actor who faultlessly portrayed the role of Tony Stark. Despite Favreau's initial decision in choosing a fresh face, he ended up delighted due to his charismatic, natural and comfortable attitude. He did not realise it yet, but he was moulding with the right measures a whole superhero cinematic universe which lasted until today and still goes for more. The filmmakers took the proper time to introduce a character whose production was undecided since New Line Pictures argu..."
    )
    
}
