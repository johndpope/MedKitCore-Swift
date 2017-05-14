/*
 -----------------------------------------------------------------------------
 This source file is part of MedKitCore.
 
 Copyright 2017 Jon Griffeth
 
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


import Foundation;


/**
 DeviceProtocol protocol.
 
 Describes a backend device protocol with associated connection factories.
 */
public protocol DeviceProtocol: class {
    
    // MARK: - Properties
    var description   : String                  { get }
    var identifier    : String                  { get }
    var name          : String                  { get }
    var priority      : Int                     { get }
    var version       : String                  { get }

    // MARK: - Factories
    var clientFactory : ClientConnectionFactory { get }
    var serverFactory : ServerConnectionFactory { get }
    
}


// End of File
