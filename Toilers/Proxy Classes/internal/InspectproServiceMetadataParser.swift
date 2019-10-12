//# xsc 19.1.4-aa99e2-20190611

import SAPOData
import Foundation

internal class InspectproServiceMetadataParser {
    internal static let options: Int = (CSDLOption.allowCaseConflicts | CSDLOption.disableFacetWarnings | CSDLOption.disableNameValidation | CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = InspectproServiceMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = InspectproServiceMetadataParser.options
        let metadata = parser.parseInProxy(InspectproServiceMetadataText.xml, url: "inspectpro.InspectproService")
        metadata.proxyVersion = "19.1.4-aa99e2-20190611"
        return metadata
    }
}
