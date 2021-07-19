public enum ApiError: Error {
    case general
    case clientError
    case serverError
    case noData
    case dataDecodingError
}
