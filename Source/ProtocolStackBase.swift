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


/**
 ProtocolStack base class.
 
 A base class used to cap a protocol stack.
 */
open class ProtocolStackBase: ProtocolStack, PortDelegate {
    
    // MARK: - Properties
    public weak var delegate: ProtocolStackDelegate?
    public let      port    : Port
    
    // MARK: - Private Properties
    private var completion: ((Error?) -> Void)? //: Start completion handler.
    
    // MARK: - Initializers
    
    /**
     Initialize instance with port.
     
     - Parameters:
        - port: The top of the port stack.
     */
    public init(_ port: Port)
    {
        self.port = port
        port.delegate = self
    }
    
    // MARK: - Lifecycle
    
    /**
     Shutdown protocol.
     
     - Parameters:
        - completion:
     */
    open func shutdown(for reason: Error?)
    {
        port.shutdown(for: reason)
    }
    
    /**
     Start protocol.
     
     - Parameters:
     - completion:
     */
    open func start(completionHandler completion: @escaping (Error?)->Void)
    {
        self.completion = completion
        port.start()
    }
    
    /**
     Complete startup.
     
     Used to complete the startup process by invoking the completion handler
     that was passed into the start() method.
     
     - Parameters:
        - error: The result to be passed to the completion handler.
     */
    open func complete(_ error: Error?)
    {
        if let completion = self.completion {
            DispatchQueue.main.async { completion(error) }
            self.completion = nil
        }
    }
    
    // MARK: - PortDelegate
    
    /**
     Port did initialize.
     */
    public func portDidInitialize(_ port: Port, with error: Error?)
    {
        complete(error)
        
        if let delegate = self.delegate {
            DispatchQueue.main.async { delegate.protocolStackDidInitialize(self, with: error) }
        }
    }
    
    /**
     Port did close.
     */
    open func portDidClose(_ port: Port, for reason: Error?)
    {
        if let delegate = self.delegate {
            DispatchQueue.main.async { delegate.protocolStackDidClose(self, for: reason) }
        }
    }
    
    /**
     Port did receive data.
     
     - Parameters:
     - port: Caller
     - data: The data being received from the port.
     */
    open func port(_ port: Port, didReceive data: Data)
    {
    }
    
    
}


// End of File
