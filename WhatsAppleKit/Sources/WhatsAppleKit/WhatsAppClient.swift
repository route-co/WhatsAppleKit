import Foundation
import NIO
import NIOSSL
import CryptoSwift
import QRCodeGenerator

public class WhatsAppClient {
    private let eventLoopGroup: EventLoopGroup
    private var connection: WhatsAppConnection?
    private var sessionData: SessionData?
    
    public enum WhatsAppError: Error {
        case connectionFailed(String)
        case authenticationFailed(String)
        case invalidSession
        case invalidQRCode
    }
    
    public init() {
        self.eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    }
    
    public func connect() async throws {
        connection = WhatsAppConnection(eventLoop: eventLoopGroup.next())
        try await connection?.establish()
    }
    
    public func login() async throws -> String {
        guard let conn = connection else {
            throw WhatsAppError.connectionFailed("No active connection")
        }
        
        // If we have a saved session, try to restore it
        if let session = sessionData {
            do {
                try await conn.restoreSession(session)
                return "Session restored successfully"
            } catch {
                // Session restore failed, proceed with new QR login
                sessionData = nil
            }
        }
        
        // Generate new QR code for login
        let qrCode = try await conn.generateQRCode()
        return qrCode
    }
    
    public func disconnect() async throws {
        try await connection?.close()
        connection = nil
    }
    
    deinit {
        try? eventLoopGroup.syncShutdownGracefully()
    }
}

// Internal session data structure
struct SessionData: Codable {
    let clientId: String
    let serverToken: String
    let clientToken: String
    let encKey: Data
    let macKey: Data
}