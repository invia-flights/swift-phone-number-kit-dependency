import Dependencies
import Foundation
import PhoneNumberKit

public protocol PhoneNumberKitProtocol {
	func parse(_ numberString: String, withRegion region: String, ignoreType: Bool) throws
		-> PhoneNumber

	func parse(
		_ numberStrings: [String],
		withRegion region: String,
		ignoreType: Bool,
		shouldReturnFailedEmptyNumbers: Bool
	) -> [PhoneNumber]

	func defaultRegionCode() -> String
}

