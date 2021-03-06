/*
 -----------------------------------------------------------------------------
 This source file is part of MedKit Device Simulator.
 
 Copyright 2017-2018 Jon Griffeth
 
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


public class DataLogItem {
    
    public enum Direction {
        case send
        case receive

        public var string: String {
            switch self {
            case .send :
                return "Send"
                
            case .receive :
                return "Recv"
            }
        }
    }
    
    public let      sequence       : Int             //: Sequence number.
    public let      direction      : Direction       //: Transmission direction.
    public let      time           : TimeInterval    //: Time stamp.
    public let      data           : Data            //: Data
    public lazy var decoder        : DataDecoder = self.decoderFactory.instantiateDecoder()
    
    // MARK: - Private
    private let decoderFactory : DataDecoderFactory  //: DataDecoder factory.
    
    public init(sequence: Int, direction: Direction, time: TimeInterval, data: Data, decoderFactory: DataDecoderFactory = DataDecoderDefaultFactory.main)
    {
        self.sequence       = sequence
        self.decoderFactory = decoderFactory
        self.direction      = direction
        self.time           = time
        self.data           = data
    }
    
}


// End of File
