import Dependencies
import PhoneNumberKit

public struct PhoneNumberKitClient {
	public init(
		parseSingle: @escaping (ParseSingleNumberRequest) throws -> PhoneNumber,
		parseMultiple: @escaping (ParseMultipleNumbersRequest) -> [PhoneNumber]
	) {
		self.parseSingle = parseSingle
		self.parseMultiple = parseMultiple
	}

	public let parseSingle: (ParseSingleNumberRequest) throws -> PhoneNumber
	public let parseMultiple: (ParseMultipleNumbersRequest) -> [PhoneNumber]
}

extension PhoneNumberKitClient: TestDependencyKey {
	public static var testValue: PhoneNumberKitClient = .init(
		parseSingle: unimplemented("parseSingle"),
		parseMultiple: unimplemented("parseMultiple")
	)
}
