import Dependencies
import Foundation
import PhoneNumberKit
import PhoneNumberKitDependency
import enum PhoneNumberKit.PhoneNumberType

public extension PhoneNumberKitClient {
	static func live(phoneNumberKit: PhoneNumberKitProtocol = PhoneNumberKit()) -> Self {
		.init(
			parseSingle: { request in
				let number = try phoneNumberKit.parse(
					request.phoneNumberString,
					withRegion: request.region ?? phoneNumberKit.defaultRegionCode(),
					ignoreType: request.ignoreType
				)
				
				return PhoneNumber(numberString: number.numberString, countryCode: number.countryCode, leadingZero: number.leadingZero, nationalNumber: number.nationalNumber, numberExtension: number.numberExtension, type: .init(type: number.type), regionID: number.regionID)
			},

			parseMultiple: { request in
				let numbers = phoneNumberKit.parse(
					request.phoneNumberStrings,
					withRegion: request.region ?? phoneNumberKit.defaultRegionCode(),
					ignoreType: request.ignoreType,
					shouldReturnFailedEmptyNumbers: request.shouldReturnFailedEmptyNumbers
				)
				return numbers.map { number in PhoneNumber(numberString: number.numberString, countryCode: number.countryCode, leadingZero: number.leadingZero, nationalNumber: number.nationalNumber, numberExtension: number.numberExtension, type: .init(type: number.type), regionID: number.regionID) }
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

extension PhoneNumberKitDependency.PhoneNumberType {
	init(type: PhoneNumberType) {
		switch type {
		case .fixedLine:
			self = .fixedLine
		case .mobile:
			self = .mobile
		case .fixedOrMobile:
			self = .fixedOrMobile
		case .pager:
			self = .pager
		case .personalNumber:
			self = .personalNumber
		case .premiumRate:
			self = .premiumRate
		case .sharedCost:
			self = .sharedCost
		case .tollFree:
			self = .tollFree
		case .voicemail:
			self = .voicemail
		case .voip:
			self = .voip
		case .uan:
			self = .uan
		case .unknown:
			self = .unknown
		case .notParsed:
			self = .notParsed
		}
	}
}
