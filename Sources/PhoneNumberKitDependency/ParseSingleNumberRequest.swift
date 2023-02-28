//
//  File.swift
//  
//
//  Created by Quico Moya on 28.02.23.
//

import Foundation

public struct ParseSingleNumberRequest {
	public init(phoneNumberString: String, region: String? = nil, ignoreType: Bool = false) {
		self.phoneNumberString = phoneNumberString
		self.region = region
		self.ignoreType = ignoreType
	}
	
	public let phoneNumberString: String
	public let region: String?
	public let ignoreType: Bool
}

