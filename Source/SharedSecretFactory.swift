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
 SharedSecret factory.
 */
public class SharedSecretFactory: CredentialsFactory {
    
    // MARK: - Instantiation
    
    /**
     Create credentials for identity.
     */
    public func instantiate(for identity: Identity) -> Credentials
    {
        return SharedSecret(for: identity);
    }
    
    /**
     Create credentials from profile.
     */
    public func instantiate(from profile: JSON, for identity: Identity) -> Credentials
    {
        return instantiate(for: identity);
    }
    
}


// End of File
