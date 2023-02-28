import PhoneNumberKit
@testable import PhoneNumberKitDependencyLive
import XCTest
@testable import PhoneNumberKitDependency

final class PhoneNumberKitDependencyTests: XCTestCase {
	func testParseSingle() throws {
		var phoneNumberKit = TestPhoneNumberKit()
		phoneNumberKit._parseSingle = { _, _, _ in
			.notPhoneNumber()
		}
		phoneNumberKit._defaultRegion = { "de" }

		let sut: PhoneNumberKitClient = .live(phoneNumberKit: phoneNumberKit)
		let result = try sut.parseSingle(.init(phoneNumberString: "123456"))
		XCTAssertEqual(result, .notPhoneNumber())
	}

	func testParseMultiple() throws {
		var phoneNumberKit = TestPhoneNumberKit()
		phoneNumberKit._defaultRegion = { "de" }
		phoneNumberKit._parseMultiple = { _, _, _, _ in
			[
				.notPhoneNumber(),
				.notPhoneNumber(),
			]
		}

		let sut: PhoneNumberKitClient = .live(phoneNumberKit: phoneNumberKit)
		let result = sut.parseMultiple(.init(phoneNumberStrings: ["123456", "123123"]))
		XCTAssertEqual(result, [.notPhoneNumber(), .notPhoneNumber()])
	}
}
