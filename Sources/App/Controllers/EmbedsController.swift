
import Foundation
import Vapor
import SwiftTok

struct EmbedsController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.get(":id", use: videoShortUrl)
    }
    
    func videoShortUrl(req: Request) async throws -> View {
        guard let idRaw = req.parameters.get("id"), let id = try? Sanitisers.sanitiseId(idRaw) else { throw Abort(.badRequest) }
        guard let video = try? await tiktok.getVideoData(with: id) else { throw Abort(.unsupportedMediaType) }
        let playSrc = video.video.downloadAddr
        return try await req.view.render("video", ["src": playSrc.absoluteString])
    }
}
