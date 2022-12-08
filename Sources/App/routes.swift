import Vapor
import SwiftTok

func routes(_ app: Application) throws {
    try app.register(collection: MainController())
    try app.register(collection: ApiController())
    try app.register(collection: EmbedsController())
}
