//# xsc 19.1.5-b4e07e-20190905

import Foundation
import SAPOData

open class InspectorType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var id_: Property = InspectproServiceMetadata.EntityTypes.inspectorType.property(withName: "ID")

    private static var name_: Property = InspectproServiceMetadata.EntityTypes.inspectorType.property(withName: "Name")

    private static var address_: Property = InspectproServiceMetadata.EntityTypes.inspectorType.property(withName: "Address")

    private static var password_: Property = InspectproServiceMetadata.EntityTypes.inspectorType.property(withName: "Password")

    private static var phoneNumber_: Property = InspectproServiceMetadata.EntityTypes.inspectorType.property(withName: "PhoneNumber")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: InspectproServiceMetadata.EntityTypes.inspectorType)
    }

    open class var address: Property {
        get {
            objc_sync_enter(InspectorType.self)
            defer { objc_sync_exit(InspectorType.self); }
            do {
                return InspectorType.address_
            }
        }
        set(value) {
            objc_sync_enter(InspectorType.self)
            defer { objc_sync_exit(InspectorType.self); }
            do {
                InspectorType.address_ = value
            }
        }
    }

    open var address: String? {
        get {
            return StringValue.optional(self.optionalValue(for: InspectorType.address))
        }
        set(value) {
            self.setOptionalValue(for: InspectorType.address, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<InspectorType> {
        return ArrayConverter.convert(from.toArray(), Array<InspectorType>())
    }

    open func copy() -> InspectorType {
        return CastRequired<InspectorType>.from(self.copyEntity())
    }

    open class var id: Property {
        get {
            objc_sync_enter(InspectorType.self)
            defer { objc_sync_exit(InspectorType.self); }
            do {
                return InspectorType.id_
            }
        }
        set(value) {
            objc_sync_enter(InspectorType.self)
            defer { objc_sync_exit(InspectorType.self); }
            do {
                InspectorType.id_ = value
            }
        }
    }

    open var id: String? {
        get {
            return StringValue.optional(self.optionalValue(for: InspectorType.id))
        }
        set(value) {
            self.setOptionalValue(for: InspectorType.id, to: StringValue.of(optional: value))
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
            objc_sync_enter(InspectorType.self)
            defer { objc_sync_exit(InspectorType.self); }
            do {
                return InspectorType.name_
            }
        }
        set(value) {
            objc_sync_enter(InspectorType.self)
            defer { objc_sync_exit(InspectorType.self); }
            do {
                InspectorType.name_ = value
            }
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(self.optionalValue(for: InspectorType.name))
        }
        set(value) {
            self.setOptionalValue(for: InspectorType.name, to: StringValue.of(optional: value))
        }
    }

    open var old: InspectorType {
        get {
            return CastRequired<InspectorType>.from(self.oldEntity)
        }
    }

    open class var password: Property {
        get {
            objc_sync_enter(InspectorType.self)
            defer { objc_sync_exit(InspectorType.self); }
            do {
                return InspectorType.password_
            }
        }
        set(value) {
            objc_sync_enter(InspectorType.self)
            defer { objc_sync_exit(InspectorType.self); }
            do {
                InspectorType.password_ = value
            }
        }
    }

    open var password: String? {
        get {
            return StringValue.optional(self.optionalValue(for: InspectorType.password))
        }
        set(value) {
            self.setOptionalValue(for: InspectorType.password, to: StringValue.of(optional: value))
        }
    }

    open class var phoneNumber: Property {
        get {
            objc_sync_enter(InspectorType.self)
            defer { objc_sync_exit(InspectorType.self); }
            do {
                return InspectorType.phoneNumber_
            }
        }
        set(value) {
            objc_sync_enter(InspectorType.self)
            defer { objc_sync_exit(InspectorType.self); }
            do {
                InspectorType.phoneNumber_ = value
            }
        }
    }

    open var phoneNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: InspectorType.phoneNumber))
        }
        set(value) {
            self.setOptionalValue(for: InspectorType.phoneNumber, to: StringValue.of(optional: value))
        }
    }
}
