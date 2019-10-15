//# xsc 19.1.5-b4e07e-20190905

import Foundation
import SAPOData

open class SupervisorType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var id_: Property = InspectproServiceMetadata.EntityTypes.supervisorType.property(withName: "ID")

    private static var name_: Property = InspectproServiceMetadata.EntityTypes.supervisorType.property(withName: "Name")

    private static var address_: Property = InspectproServiceMetadata.EntityTypes.supervisorType.property(withName: "Address")

    private static var password_: Property = InspectproServiceMetadata.EntityTypes.supervisorType.property(withName: "Password")

    private static var phoneNumber_: Property = InspectproServiceMetadata.EntityTypes.supervisorType.property(withName: "PhoneNumber")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: InspectproServiceMetadata.EntityTypes.supervisorType)
    }

    open class var address: Property {
        get {
            objc_sync_enter(SupervisorType.self)
            defer { objc_sync_exit(SupervisorType.self); }
            do {
                return SupervisorType.address_
            }
        }
        set(value) {
            objc_sync_enter(SupervisorType.self)
            defer { objc_sync_exit(SupervisorType.self); }
            do {
                SupervisorType.address_ = value
            }
        }
    }

    open var address: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SupervisorType.address))
        }
        set(value) {
            self.setOptionalValue(for: SupervisorType.address, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<SupervisorType> {
        return ArrayConverter.convert(from.toArray(), Array<SupervisorType>())
    }

    open func copy() -> SupervisorType {
        return CastRequired<SupervisorType>.from(self.copyEntity())
    }

    open class var id: Property {
        get {
            objc_sync_enter(SupervisorType.self)
            defer { objc_sync_exit(SupervisorType.self); }
            do {
                return SupervisorType.id_
            }
        }
        set(value) {
            objc_sync_enter(SupervisorType.self)
            defer { objc_sync_exit(SupervisorType.self); }
            do {
                SupervisorType.id_ = value
            }
        }
    }

    open var id: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SupervisorType.id))
        }
        set(value) {
            self.setOptionalValue(for: SupervisorType.id, to: StringValue.of(optional: value))
        }
    }

    override open var isProxy: Bool {
        get {
            return true
        }
    }

    open class func key(id: String?) -> EntityKey {
        return EntityKey().with(name: "ID", value: StringValue.of(optional: id))
    }

    open class var name: Property {
        get {
            objc_sync_enter(SupervisorType.self)
            defer { objc_sync_exit(SupervisorType.self); }
            do {
                return SupervisorType.name_
            }
        }
        set(value) {
            objc_sync_enter(SupervisorType.self)
            defer { objc_sync_exit(SupervisorType.self); }
            do {
                SupervisorType.name_ = value
            }
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SupervisorType.name))
        }
        set(value) {
            self.setOptionalValue(for: SupervisorType.name, to: StringValue.of(optional: value))
        }
    }

    open var old: SupervisorType {
        get {
            return CastRequired<SupervisorType>.from(self.oldEntity)
        }
    }

    open class var password: Property {
        get {
            objc_sync_enter(SupervisorType.self)
            defer { objc_sync_exit(SupervisorType.self); }
            do {
                return SupervisorType.password_
            }
        }
        set(value) {
            objc_sync_enter(SupervisorType.self)
            defer { objc_sync_exit(SupervisorType.self); }
            do {
                SupervisorType.password_ = value
            }
        }
    }

    open var password: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SupervisorType.password))
        }
        set(value) {
            self.setOptionalValue(for: SupervisorType.password, to: StringValue.of(optional: value))
        }
    }

    open class var phoneNumber: Property {
        get {
            objc_sync_enter(SupervisorType.self)
            defer { objc_sync_exit(SupervisorType.self); }
            do {
                return SupervisorType.phoneNumber_
            }
        }
        set(value) {
            objc_sync_enter(SupervisorType.self)
            defer { objc_sync_exit(SupervisorType.self); }
            do {
                SupervisorType.phoneNumber_ = value
            }
        }
    }

    open var phoneNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SupervisorType.phoneNumber))
        }
        set(value) {
            self.setOptionalValue(for: SupervisorType.phoneNumber, to: StringValue.of(optional: value))
        }
    }
}
