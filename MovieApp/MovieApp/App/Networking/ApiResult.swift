public enum ApiResult<Success, Failure> where Failure: Error{
    case success(Success)
    case failure(Failure)
}
