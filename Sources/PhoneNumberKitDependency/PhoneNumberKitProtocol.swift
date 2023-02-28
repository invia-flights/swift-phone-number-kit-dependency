//
//  File.swift
//  
//
//  Created by Quico Moya on 28.02.23.
//

import Foundation
import PhoneNumberKit
import Dependencies

public protocol PhoneNumberKitProtocol {
	func parse(_ numberString: String, withRegion region: String, ignoreType: Bool) throws -> PhoneNumber
	
	func parse(_ numberStrings: [String], withRegion region: String, ignoreType: Bool, shouldReturnFailedEmptyNumbers: Bool) -> [PhoneNumber]
	
	func defaultRegionCode() -> String
}

struct TestPhoneNumberKit: PhoneNumberKitProtocol {
	var _defaultRegion: () -> String = unimplemented("_defaultRegion")
	
	var _parseSingle: (_ numberString: String, _ region: String, _ ignoreType: Bool) throws -> PhoneNumber = unimplemented("_parseSingle")
	
	var _parseMultiple: (_ numberStrings: [String], _ region: String, _ ignoreType: Bool, _ shouldReturnFailedEmptyNumbers: Bool) -> [PhoneNumber] = unimplemented("_parseMultiple")

	func parse(_ numberString: String, withRegion region: String, ignoreType: Bool) throws -> PhoneNumber {
		try _parseSingle(numberString, region, ignoreType)
	}
	
	func parse(_ numberStrings: [String], withRegion region: String, ignoreType: Bool, shouldReturnFailedEmptyNumbers: Bool) -> [PhoneNumber] {
		_parseMultiple(numberStrings, region, ignoreType, shouldReturnFailedEmptyNumbers)
	}
	
	func defaultRegionCode() -> String {
		_defaultRegion()
	}
}
