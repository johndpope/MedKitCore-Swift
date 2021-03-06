/*
 -----------------------------------------------------------------------------
 This source file is part of MedKitCore.

 Copyright 2018 Jon Griffeth

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 -----------------------------------------------------------------------------
 */


import Foundation


/**
 TXT Encoding Storage

 - Requirement: RFC-6763
 */
class TXTEncodingStorage {

    // MARK: - Properties
    var data: Data { return NetService.data(fromTXTRecord: txt) }

    // MARK: - Private
    private var txt: [String : Data]

    // MARK: - Initializers

    init()
    {
        txt = [String : Data]()
    }

    // MARK: - Setters

    func setValue(_ value: Data, forKey key: CodingKey) throws
    {
        if txt[key.stringValue] == nil {
            txt[key.stringValue] = value
        }
        else {
            throw EncodingError.invalidValue(key, EncodingError.Context(codingPath: [], debugDescription: "Duplicate key."))
        }
    }

}


// End of File
