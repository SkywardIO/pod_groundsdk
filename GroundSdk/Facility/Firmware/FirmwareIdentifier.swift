// Copyright (C) 2019 Parrot Drones SAS
//
//    Redistribution and use in source and binary forms, with or without
//    modification, are permitted provided that the following conditions
//    are met:
//    * Redistributions of source code must retain the above copyright
//      notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright
//      notice, this list of conditions and the following disclaimer in
//      the documentation and/or other materials provided with the
//      distribution.
//    * Neither the name of the Parrot Company nor the names
//      of its contributors may be used to endorse or promote products
//      derived from this software without specific prior written
//      permission.
//
//    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
//    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
//    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
//    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
//    PARROT COMPANY BE LIABLE FOR ANY DIRECT, INDIRECT,
//    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
//    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
//    OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
//    AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//    OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
//    OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
//    SUCH DAMAGE.

import Foundation

/// An object that uniquely identifies a device firmware.
@objcMembers
@objc(GSFirmwareIdentifier)
public class FirmwareIdentifier: NSObject {

    /// Device model on which the firmware can be applied.
    public let deviceModel: DeviceModel

    /// Version of the firmware.
    public let version: FirmwareVersion

    /// Debug description.
    override public var description: String {
        return "\(deviceModel): \(version)"
    }

    /// Constructor.
    ///
    /// - Parameters:
    ///   - deviceModel: device model onto which this firmware applies
    ///   - version: firmware version
    public init(deviceModel: DeviceModel, version: FirmwareVersion) {
        self.deviceModel = deviceModel
        self.version = version
    }

    override public var hash: Int {
         return version.hashValue &* 31 &+ deviceModel.hashValue
    }

    public static func == (lhs: FirmwareIdentifier, rhs: FirmwareIdentifier) -> Bool {
        return lhs.deviceModel == rhs.deviceModel && lhs.version == rhs.version
    }

    public override func isEqual(_ object: Any?) -> Bool {
        if let identifier = object as? FirmwareIdentifier {
            return self == identifier
        } else {
            return false
        }
    }
}
