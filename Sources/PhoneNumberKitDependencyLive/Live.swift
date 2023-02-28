//
//  File.swift
//  
//
//  Created by Quico Moya on 28.02.23.
//

import Foundation
import PhoneNumberKit
import PhoneNumberKitDependency
import Dependencies

extension PhoneNumberKitClient {
	public static func live(phoneNumberKit: PhoneNumberKitProtocol = PhoneNumberKit()) -> Self {
		.init(
			parseSingle: { request in
				try phoneNumberKit.parse(request.phoneNumberString, withRegion: request.region ?? phoneNumberKit.defaultRegionCode(), ignoreType: request.ignoreType)
			},
			
			parseMultiple: { request in
				phoneNumberKit.parse(request.phoneNumberStrings, withRegion: request.region ?? phoneNumberKit.defaultRegionCode(), ignoreType: request.ignoreType, shouldReturnFailedEmptyNumbers: request.shouldReturnFailedEmptyNumbers)
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

