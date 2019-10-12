//# xsc 19.1.4-aa99e2-20190611

import SAPOData
import Foundation

open class InspectproService<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = InspectproServiceMetadata.document
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
}
