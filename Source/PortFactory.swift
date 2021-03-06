/*
 -----------------------------------------------------------------------------
 This source file is part of MedKitCore.
 
 Copyright 2016-2018 Jon Griffeth
 
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
import SecurityKit


/**
 PortFactory protocol.
 
 TODO: Needs a better name.
 */
public protocol PortFactory: class {
    
    // MARK: - Properties
    var domain   : String { get }
    var priority : Int    { get }
    var reachable: Bool   { get }
    
    // MARK: - Instantiation
    
    /**
     Instantiate client connection.
     
     Instantiates a new client connection representing the principal.
     
     - Parameters:
        - principal: The principal represented by the connection.
     
     - Returns:
        Returns a reference to the new connection if successful.  A return
        value of nil indicates failure.
     */
    func instantiateConnection(to device: DeviceBackend, using principalManager: PrincipalManager) -> ClientConnection?
    
}


// End of File
