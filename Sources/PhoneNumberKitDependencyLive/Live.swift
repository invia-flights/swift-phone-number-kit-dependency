import Dependencies
import Foundation
import PhoneNumberKit
import PhoneNumberKitDependency

public extension PhoneNumberKitClient {
	static func live(phoneNumberKit: PhoneNumberKitProtocol = PhoneNumberKit()) -> Self {
		.init(
			parseSingle: { request in
				try phoneNumberKit.parse(
					request.phoneNumberString,
					withRegion: request.region ?? phoneNumberKit.defaultRegionCode(),
					ignoreType: request.ignoreType
				)
			},

			parseMultiple: { request in
				phoneNumberKit.parse(
					request.phoneNumberStrings,
					withRegion: request.region ?? phoneNumberKit.defaultRegionCode(),
					ignoreType: request.ignoreType,
					shouldReturnFailedEmptyNumbers: request.shouldReturnFailedEmptyNumbers
				)
			}
		)
	}
}

extension PhoneNumberKit: PhoneNumberKitProtocol {
	public func defaultRegionCode() -> String {
		Self.defaultRegionCode()
	}
}

extension PhoneNumberKitClient: DependencyKey {
	public static var liveValue: PhoneNumberKitClient = .live()
}
