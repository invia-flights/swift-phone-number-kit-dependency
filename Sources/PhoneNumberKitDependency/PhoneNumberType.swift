import Foundation

public enum PhoneNumberType: String, Codable {
	case fixedLine
	case mobile
	case fixedOrMobile
	case pager
	case personalNumber
	case premiumRate
	case sharedCost
	case tollFree
	case voicemail
	case voip
	case uan
	case unknown
	case notParsed
}
