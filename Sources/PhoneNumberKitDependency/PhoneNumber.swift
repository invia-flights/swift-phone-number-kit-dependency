//
//  File.swift
//  
//
//  Created by Quico Moya on 28.02.23.
//

import Foundation

public struct PhoneNumber: Equatable {
	public init(numberString: String = "", countryCode: UInt64 = 0, leadingZero: Bool = false, nationalNumber: UInt64 = 0, numberExtension: String? = nil, type: PhoneNumberType, regionID: String? = nil) {
		self.numberString = numberString
		self.countryCode = countryCode
		self.leadingZero = leadingZero
		self.nationalNumber = nationalNumber
		self.numberExtension = numberExtension
		self.type = type
		self.regionID = regionID
	}
	
	public static func notPhoneNumber() -> PhoneNumber {
		return PhoneNumber(numberString: "", countryCode: 0, leadingZero: false, nationalNumber: 0, numberExtension: nil, type: .notParsed, regionID: nil)
	}
	
	public let numberString: String
	public let countryCode: UInt64
	public let leadingZero: Bool
	public let nationalNumber: UInt64
	public let numberExtension: String?
	public let type: PhoneNumberType
	public let regionID: String?
}
