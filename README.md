# WhatsAppleKit

A Swift package for interacting with WhatsApp Web, enabling programmatic access to WhatsApp functionality through a native Swift interface.

## Features

- WebSocket-based connection to WhatsApp Web
- QR Code generation for authentication
- Session management and restoration
- Secure communication using SSL/TLS
- Async/await API design

## Requirements

- iOS 15.0+ / macOS 12.0+
- Swift 5.6+

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
.package(url: "https://github.com/route-co/WhatsAppleKit.git", from: "1.0.0")
```

## Usage

```swift
// Initialize the client
let client = WhatsAppClient()

// Connect to WhatsApp Web
try await client.connect()

// Generate QR code for authentication
let qrCode = try await client.login()

// Disconnect when done
try await client.disconnect()
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.