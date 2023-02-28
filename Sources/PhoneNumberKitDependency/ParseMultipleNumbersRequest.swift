import Foundation

public struct ParseMultipleNumbersRequest {
	public init(
		phoneNumberStrings: [String],
		region: String? = nil,
		ignoreType: Bool = false,
		shouldReturnFailedEmptyNumbers: Bool = false
	) {
		self.phoneNumberStrings = phoneNumberStrings
		self.region = region
		self.ignoreType = ignoreType
		self.shouldReturnFailedEmptyNumbers = shouldReturnFailedEmptyNumbers
	}

	public let phoneNumberStrings: [String]
	public let region: String?
	public let ignoreType: Bool
	public let shouldReturnFailedEmptyNumbers: Bool
}
