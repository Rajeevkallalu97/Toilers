//# xsc 19.1.4-aa99e2-20190611

import SAPOData
import Foundation

public class InspectproServiceMetadata {
    private static var document_: CSDLDocument = InspectproServiceMetadata.resolve()

    public static var document: CSDLDocument {
        get {
            objc_sync_enter(InspectproServiceMetadata.self)
            defer { objc_sync_exit(InspectproServiceMetadata.self); }
            do {
                return InspectproServiceMetadata.document_
            }
        }
        set(value) {
            objc_sync_enter(InspectproServiceMetadata.self)
            defer { objc_sync_exit(InspectproServiceMetadata.self); }
            do {
                InspectproServiceMetadata.document_ = value
            }
        }
    }

    private static func resolve() -> CSDLDocument {
        try! InspectproServiceFactory.registerAll()
        InspectproServiceMetadataParser.parsed.hasGeneratedProxies = true
        return InspectproServiceMetadataParser.parsed
    }

    public class EntityTypes {
        private static var loginType_: EntityType = InspectproServiceMetadataParser.parsed.entityType(withName: "inspectpro.InspectproService.LoginType")

        public static var loginType: EntityType {
            get {
                objc_sync_enter(InspectproServiceMetadata.EntityTypes.self)
                defer { objc_sync_exit(InspectproServiceMetadata.EntityTypes.self); }
                do {
                    return InspectproServiceMetadata.EntityTypes.loginType_
                }
            }
        set(value) {
            objc_sync_enter(InspectproServiceMetadata.EntityTypes.self)
            defer { objc_sync_exit(InspectproServiceMetadata.EntityTypes.self); }
            do {
                InspectproServiceMetadata.EntityTypes.loginType_ = value
            }
        }
        }
    }

    public class EntitySets {
        private static var login_: EntitySet = InspectproServiceMetadataParser.parsed.entitySet(withName: "Login")

        public static var login: EntitySet {
            get {
                objc_sync_enter(InspectproServiceMetadata.EntitySets.self)
                defer { objc_sync_exit(InspectproServiceMetadata.EntitySets.self); }
                do {
                    return InspectproServiceMetadata.EntitySets.login_
                }
            }
        set(value) {
            objc_sync_enter(InspectproServiceMetadata.EntitySets.self)
            defer { objc_sync_exit(InspectproServiceMetadata.EntitySets.self); }
            do {
                InspectproServiceMetadata.EntitySets.login_ = value
            }
        }
        }
    }
}
