
import Foundation
import Vapor

struct MainController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: index)
        routes.get("info", use: info)
    }
    
    func index(req: Request) async throws -> View {
        return try await req.view.render("index")
    }
    
    func info(req: Request) async throws -> View {
        return try await req.view.render("info")
    }
}
