# moya-swift4-mapObject
### Usage
Need struct model extends Codable.

    struct Model: Codable {
        // Field
    }
    
<br/>

    do {
        // Model
        let model = try response.mapObject(Model.self)
        
        // Model Array
        let models = try response.mapObject([Model].self, key: "items")
    } catch {
        // handle error
    }
