//# xsc 19.1.5-b4e07e-20190905

import Foundation
import SAPOData

open class InspectproService<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = InspectproServiceMetadata.document
    }

    open func fetchInspector(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<InspectorType> {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try InspectorType.array(from: self.executeQuery(var_query.fromDefault(InspectproServiceMetadata.EntitySets.inspector), headers: var_headers, options: var_options).entityList())
    }

    open func fetchInspector(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<InspectorType>?, Error?) -> Void) -> Void {
        self.addBackgroundOperationForFunction {
        do {
            let result = try self.fetchInspector(matching: query, headers: headers, options: options)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchInspectorType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> InspectorType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<InspectorType>.from(self.executeQuery(query.fromDefault(InspectproServiceMetadata.EntitySets.inspector), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchInspectorType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (InspectorType?, Error?) -> Void) -> Void {
        self.addBackgroundOperationForFunction {
        do {
            let result = try self.fetchInspectorType(matching: query, headers: headers, options: options)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchInspectorTypeWithKey(id: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> InspectorType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchInspectorType(matching: var_query.withKey(InspectorType.key(id: id)), headers: headers, options: options)
    }

    open func fetchInspectorTypeWithKey(id: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (InspectorType?, Error?) -> Void) -> Void {
        self.addBackgroundOperationForFunction {
        do {
            let result = try self.fetchInspectorTypeWithKey(id: id, query: query, headers: headers, options: options)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchLogin(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<LoginType> {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try LoginType.array(from: self.executeQuery(var_query.fromDefault(InspectproServiceMetadata.EntitySets.login), headers: var_headers, options: var_options).entityList())
    }

    open func fetchLogin(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<LoginType>?, Error?) -> Void) -> Void {
        self.addBackgroundOperationForFunction {
        do {
            let result = try self.fetchLogin(matching: query, headers: headers, options: options)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchLoginType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> LoginType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<LoginType>.from(self.executeQuery(query.fromDefault(InspectproServiceMetadata.EntitySets.login), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchLoginType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (LoginType?, Error?) -> Void) -> Void {
        self.addBackgroundOperationForFunction {
        do {
            let result = try self.fetchLoginType(matching: query, headers: headers, options: options)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchLoginTypeWithKey(id: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> LoginType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchLoginType(matching: var_query.withKey(LoginType.key(id: id)), headers: headers, options: options)
    }

    open func fetchLoginTypeWithKey(id: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (LoginType?, Error?) -> Void) -> Void {
        self.addBackgroundOperationForFunction {
        do {
            let result = try self.fetchLoginTypeWithKey(id: id, query: query, headers: headers, options: options)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchSupervisor(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<SupervisorType> {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try SupervisorType.array(from: self.executeQuery(var_query.fromDefault(InspectproServiceMetadata.EntitySets.supervisor), headers: var_headers, options: var_options).entityList())
    }

    open func fetchSupervisor(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<SupervisorType>?, Error?) -> Void) -> Void {
        self.addBackgroundOperationForFunction {
        do {
            let result = try self.fetchSupervisor(matching: query, headers: headers, options: options)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchSupervisorType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> SupervisorType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<SupervisorType>.from(self.executeQuery(query.fromDefault(InspectproServiceMetadata.EntitySets.supervisor), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchSupervisorType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (SupervisorType?, Error?) -> Void) -> Void {
        self.addBackgroundOperationForFunction {
        do {
            let result = try self.fetchSupervisorType(matching: query, headers: headers, options: options)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    open func fetchSupervisorTypeWithKey(id: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> SupervisorType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchSupervisorType(matching: var_query.withKey(SupervisorType.key(id: id)), headers: headers, options: options)
    }

    open func fetchSupervisorTypeWithKey(id: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (SupervisorType?, Error?) -> Void) -> Void {
        self.addBackgroundOperationForFunction {
        do {
            let result = try self.fetchSupervisorTypeWithKey(id: id, query: query, headers: headers, options: options)
            self.completionQueue.addOperation {
                completionHandler(result, nil)
            }
        }
        catch let error {
            self.completionQueue.addOperation {
                completionHandler(nil, error)
            }
        }
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchInspector")
    open func inspector(query: DataQuery = DataQuery()) throws -> Array<InspectorType> {
        return try self.fetchInspector(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchInspector")
    open func inspector(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<InspectorType>?, Error?) -> Void) -> Void {
        self.fetchInspector(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchLogin")
    open func login(query: DataQuery = DataQuery()) throws -> Array<LoginType> {
        return try self.fetchLogin(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchLogin")
    open func login(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<LoginType>?, Error?) -> Void) -> Void {
        self.fetchLogin(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    override open func refreshMetadata() throws -> Void {
        objc_sync_enter(self)
        defer { objc_sync_exit(self); }
        do {
            try ProxyInternal.refreshMetadata(service: self, fetcher: nil, options: InspectproServiceMetadataParser.options)
            InspectproServiceMetadataChanges.merge(metadata: self.metadata)
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSupervisor")
    open func supervisor(query: DataQuery = DataQuery()) throws -> Array<SupervisorType> {
        return try self.fetchSupervisor(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSupervisor")
    open func supervisor(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<SupervisorType>?, Error?) -> Void) -> Void {
        self.fetchSupervisor(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }
}
