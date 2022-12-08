import Leaf
import Vapor
import LeafErrorMiddleware

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.middleware.use(LeafErrorMiddlewareDefaultGenerator.build())
    
    app.views.use(.leaf)

    // register routes
    try routes(app)
    
}
