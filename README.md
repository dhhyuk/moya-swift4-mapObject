# moya-swift4-mapObject
### Usage
    do {
        // Model
        let model = try response.mapObject(Model.self)
        
        // Model Array
        let models = try response.mapObject([Model].self, key: "items")
    } catch {
        // handle error
    }
