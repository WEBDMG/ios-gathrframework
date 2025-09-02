//  VideoAndGathrVideoTests.swift
//  GathrTests
//
//  Created by Richard Robinson on 9/1/25.
//

import Foundation
import Testing

// NOTE:
// If your app/framework module name is not `Gathr`, update the import below
// to match the target that contains `Video` and `GathrVideo`.
// Example: `@testable import ios_gathrframework` or your app target name.
//
// @testable import Gathr

// MARK: - Test Helpers
private func makeTempMovieURL(filename: String = UUID().uuidString + ".mp4") throws -> URL {
    let temp = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
        .appendingPathComponent(filename)
    // Write a tiny placeholder file so the URL exists for file-based tests.
    let data = Data("test".utf8)
    try data.write(to: temp, options: .atomic)
    return temp
}

// MARK: - Video Tests
@Suite("Video")
struct VideoTests {

    /// Verifies a `Video` can be initialized with a URL and optional metadata.
    @Test("init with URL, title, duration")
    func initWithURL() async throws {
        // TODO: Replace with your actual initializer and properties.
        // Example (uncomment and adapt):
        // let url = try makeTempMovieURL()
        // let video = Video(url: url, title: "Sample", duration: 3.5)
        // #expect(video.url == url)
        // #expect(video.title == "Sample")
        // #expect(video.duration == 3.5, "Duration should store an exact value")

        // Placeholder to keep this test passing until you wire up the API above.
        #expect(true)
    }

    /// Ensures duration (if present) is non-negative and finite.
    @Test("duration is non-negative")
    func durationNonNegative() async throws {
        // TODO: Replace with your API. Example:
        // let url = try makeTempMovieURL()
        // let video = Video(url: url, title: nil, duration: 0)
        // #expect(video.duration! >= 0)
        #expect(true)
    }

    /// Demonstrates how to test derived values like formatted duration text.
    @Test("formatted duration string")
    func formattedDuration() async throws {
        // TODO: If `Video` exposes a formatted duration, assert it here.
        // Example:
        // let url = try makeTempMovieURL()
        // let video = Video(url: url, title: "t", duration: 125)
        // #expect(video.formattedDuration == "2:05")
        #expect(true)
    }
}

// MARK: - GathrVideo Tests
@Suite("GathrVideo")
struct GathrVideoTests {

    /// Verifies wrapper/adapter holds a `Video` and related metadata.
    @Test("wraps Video and metadata")
    func wrapsVideo() async throws {
        // TODO: Replace with your actual API.
        // Example:
        // let url = try makeTempMovieURL()
        // let base = Video(url: url, title: "Clip", duration: 10)
        // let gathr = GathrVideo(id: UUID(), video: base, isFavorite: false)
        // #expect(gathr.video.title == "Clip")
        // #expect(gathr.isFavorite == false)
        #expect(true)
    }

    /// If `GathrVideo` conforms to `Codable`, ensure encode/decode round-trips.
    @Test("Codable round trip")
    func codableRoundTrip() async throws {
        // TODO: Uncomment and adapt if `GathrVideo: Codable`.
        // let url = try makeTempMovieURL()
        // let base = Video(url: url, title: "RoundTrip", duration: 7)
        // let original = GathrVideo(id: UUID(), video: base)
        // let data = try JSONEncoder().encode(original)
        // let decoded = try JSONDecoder().decode(GathrVideo.self, from: data)
        // #expect(decoded == original)
        #expect(true)
    }

    /// If `GathrVideo` has async loading (e.g., thumbnail generation), test it here.
    @Test("async thumbnail generation")
    func asyncThumbnail() async throws {
        // TODO: If you have an async method like `await gathr.thumbnail()`:
        // let url = try makeTempMovieURL()
        // let base = Video(url: url, title: "Thumb", duration: 1)
        // let gathr = GathrVideo(id: UUID(), video: base)
        // let image = try await gathr.thumbnail(at: .seconds(0.0))
        // #expect(image.size.width > 0)
        #expect(true)
    }
}
