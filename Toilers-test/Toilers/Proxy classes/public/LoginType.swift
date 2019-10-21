//# xsc 19.1.5-b4e07e-20190905

import Foundation
import SAPOData

open class LoginType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var id_: Property = InspectproServiceMetadata.EntityTypes.loginType.property(withName: "ID")

    private static var password_: Property = InspectproServiceMetadata.EntityTypes.loginType.property(withName: "Password")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: InspectproServiceMetadata.EntityTypes.loginType)
    }

    open class func array(from: EntityValueList) -> Array<LoginType> {
        return ArrayConverter.convert(from.toArray(), Array<LoginType>())
    }

    open func copy() -> LoginType {
        return CastRequired<LoginType>.from(self.copyEntity())
    }

    open class var id: Property {
        get {
            objc_sync_enter(LoginType.self)
            defer { objc_sync_exit(LoginType.self); }
            do {
                return LoginType.id_
            }
        }
        set(value) {
            objc_sync_enter(LoginType.self)
            defer { objc_sync_exit(LoginType.self); }
            do {
                LoginType.id_ = value
            }
        }
    }

    open var id: String? {
        get {
            return StringValue.optional(self.optionalValue(for: LoginType.id))
        }
        set(value) {
            self.setOptionalValue(for: LoginType.id, to: StringValue.of(optional: value))
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

    open var old: LoginType {
        get {
            return CastRequired<LoginType>.from(self.oldEntity)
        }
    }

    open class var password: Property {
        get {
            objc_sync_enter(LoginType.self)
            defer { objc_sync_exit(LoginType.self); }
            do {
                return LoginType.password_
            }
        }
        set(value) {
            objc_sync_enter(LoginType.self)
            defer { objc_sync_exit(LoginType.self); }
            do {
                LoginType.password_ = value
            }
        }
    }

    open var password: String? {
        get {
            return StringValue.optional(self.optionalValue(for: LoginType.password))
        }
        set(value) {
            self.setOptionalValue(for: LoginType.password, to: StringValue.of(optional: value))
        }
    }
}
