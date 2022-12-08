
import Foundation
import Vapor
import SwiftTok

struct ApiController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        let api = routes.grouped("api")
        api.get("video", ":id", use: video)
    }
    
    func video(req: Request) async throws -> String {
        guard let idRaw = req.parameters.get("id"), let id = try? Sanitisers.sanitiseId(idRaw) else { throw Abort(.badRequest) }
        guard let video = try? await tiktok.getVideoData(with: id) else { throw Abort(.unsupportedMediaType) }
        guard let json = try? encoder.encode(video).toString else { throw Abort(.internalServerError) }
        return json
    }
}
