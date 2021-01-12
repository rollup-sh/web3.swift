//
//  SolidityUtil.swift
//  web3swift
//
//  Created by SPARK-Daniel on 2021/1/12.
//  Copyright © 2021 Argent Labs Limited. All rights reserved.
//

import Foundation


public struct SolidityUtil {
    
public static func solidityPack(types: [String], values: [String]) throws -> String {
        if types.count != values.count {
            throw ABIError.incorrectParameterCount
        }
        let rawTypes = try types.map { type -> ABIRawType in
            if type == "string" {
                return ABIRawType.FixedBytes(32)
            } else {
                guard let newType = ABIRawType(rawValue: type) else {
                    throw ABIError.invalidType
                }
                return newType
            }
        }
        
        var encodes:[ABIEncoder.EncodedValue] = []
        for i in 0..<rawTypes.count {
            if types[i] == "string" {
                let encode = try ABIEncoder.encodeRaw(values[i].data(using: .ascii)!, forType: rawTypes[i], padded: false)
                encodes.append(encode)
            } else {
                
                let encode = try ABIEncoder.encodeRaw(values[i], forType: rawTypes[i], padded: false, size: rawTypes[i].size)
                encodes.append(encode)
            }
            
        }
        let container: ABIEncoder.EncodedValue = .container(values: encodes, isDynamic: false, size: nil)
        return container.hexString
    }
    
    
}
