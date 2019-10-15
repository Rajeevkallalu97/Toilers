//# xsc 19.1.5-b4e07e-20190905

import Foundation
import SAPOData

internal class InspectproServiceMetadataChanges {
    static func merge(metadata: CSDLDocument) -> Void {
        metadata.hasGeneratedProxies = true
        InspectproServiceMetadata.document = metadata
        InspectproServiceMetadataChanges.merge1(metadata: metadata)
        try! InspectproServiceFactory.registerAll()
    }

    private static func merge1(metadata: CSDLDocument) -> Void {
        Ignore.valueOf_any(metadata)
        if !InspectproServiceMetadata.EntityTypes.inspectorType.isRemoved {
            InspectproServiceMetadata.EntityTypes.inspectorType = metadata.entityType(withName: "inspectpro.InspectproService.InspectorType")
        }
        if !InspectproServiceMetadata.EntityTypes.loginType.isRemoved {
            InspectproServiceMetadata.EntityTypes.loginType = metadata.entityType(withName: "inspectpro.InspectproService.LoginType")
        }
        if !InspectproServiceMetadata.EntityTypes.supervisorType.isRemoved {
            InspectproServiceMetadata.EntityTypes.supervisorType = metadata.entityType(withName: "inspectpro.InspectproService.SupervisorType")
        }
        if !InspectproServiceMetadata.EntitySets.inspector.isRemoved {
            InspectproServiceMetadata.EntitySets.inspector = metadata.entitySet(withName: "Inspector")
        }
        if !InspectproServiceMetadata.EntitySets.login.isRemoved {
            InspectproServiceMetadata.EntitySets.login = metadata.entitySet(withName: "Login")
        }
        if !InspectproServiceMetadata.EntitySets.supervisor.isRemoved {
            InspectproServiceMetadata.EntitySets.supervisor = metadata.entitySet(withName: "Supervisor")
        }
        if !InspectorType.id.isRemoved {
            InspectorType.id = InspectproServiceMetadata.EntityTypes.inspectorType.property(withName: "ID")
        }
        if !InspectorType.name.isRemoved {
            InspectorType.name = InspectproServiceMetadata.EntityTypes.inspectorType.property(withName: "Name")
        }
        if !InspectorType.address.isRemoved {
            InspectorType.address = InspectproServiceMetadata.EntityTypes.inspectorType.property(withName: "Address")
        }
        if !InspectorType.password.isRemoved {
            InspectorType.password = InspectproServiceMetadata.EntityTypes.inspectorType.property(withName: "Password")
        }
        if !InspectorType.phoneNumber.isRemoved {
            InspectorType.phoneNumber = InspectproServiceMetadata.EntityTypes.inspectorType.property(withName: "PhoneNumber")
        }
        if !LoginType.id.isRemoved {
            LoginType.id = InspectproServiceMetadata.EntityTypes.loginType.property(withName: "ID")
        }
        if !LoginType.password.isRemoved {
            LoginType.password = InspectproServiceMetadata.EntityTypes.loginType.property(withName: "Password")
        }
        if !SupervisorType.id.isRemoved {
            SupervisorType.id = InspectproServiceMetadata.EntityTypes.supervisorType.property(withName: "ID")
        }
        if !SupervisorType.name.isRemoved {
            SupervisorType.name = InspectproServiceMetadata.EntityTypes.supervisorType.property(withName: "Name")
        }
        if !SupervisorType.address.isRemoved {
            SupervisorType.address = InspectproServiceMetadata.EntityTypes.supervisorType.property(withName: "Address")
        }
        if !SupervisorType.password.isRemoved {
            SupervisorType.password = InspectproServiceMetadata.EntityTypes.supervisorType.property(withName: "Password")
        }
        if !SupervisorType.phoneNumber.isRemoved {
            SupervisorType.phoneNumber = InspectproServiceMetadata.EntityTypes.supervisorType.property(withName: "PhoneNumber")
        }
    }
}
