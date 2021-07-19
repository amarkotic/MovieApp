enum NetworkResult<Success, Failure> where Failure: Error {
    
    case success(Success)
    case failure(Failure)
    
}
