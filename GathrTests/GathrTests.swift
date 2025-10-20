//
//  GathrTests.swift
//  GathrTests
//
//  Created by Richard Robinson on 10/20/25.
//  Copyright © 2025 WEBDMG. All rights reserved.
//

import Foundation
import Testing
@testable import Gathr

@Suite("Gathr Framework Tests")
struct GathrTests {

    @Test("Audio init from data and toDictionary round-trip")
    func testAudioInitFromDataAndToDictionary() async throws {
        let dict: NSDictionary = [
            "sidid": "123",
            "title": "Test Track",
            "songs": "Song A",
            "video": "https://example.com/v.mp4",
            "link": "https://example.com/a.mp3",
            "aboutTrack": "A description",
            "writtenBy": "Author",
            "source": "uploaded",
            "artistName": "Artist",
            "facebook": "https://facebook.com/artist",
            "twitter": "https://twitter.com/artist",
            "image": "https://example.com/i.jpg",
            "producedBy": "Producer"
        ]

        let audio = Audio(data: dict)
        #expect(audio.sidid == "123")
        #expect(audio.title == "Test Track")
        #expect(audio.songs == "Song A")
        #expect(audio.video == "https://example.com/v.mp4")
        #expect(audio.link == "https://example.com/a.mp3")
        #expect(audio.aboutTrack == "A description")
        #expect(audio.writtenBy == "Author")
        #expect(audio.source == "uploaded")
        #expect(audio.artistName == "Artist")
        #expect(audio.facebook == "https://facebook.com/artist")
        #expect(audio.twitter == "https://twitter.com/artist")
        #expect(audio.image == "https://example.com/i.jpg")
        #expect(audio.producedBy == "Producer")

        let out = audio.toDictionary()
        #expect(out["sidid"] as? String == "123")
        #expect(out["title"] as? String == "Test Track")
        #expect(out["songs"] as? String == "Song A")
        #expect(out["video"] as? String == "https://example.com/v.mp4")
        #expect(out["link"] as? String == "https://example.com/a.mp3")
        #expect(out["aboutTrack"] as? String == "A description")
        #expect(out["writtenBy"] as? String == "Author")
        #expect(out["source"] as? String == "uploaded")
        #expect(out["artistName"] as? String == "Artist")
        #expect(out["facebook"] as? String == "https://facebook.com/artist")
        #expect(out["twitter"] as? String == "https://twitter.com/artist")
        #expect(out["image"] as? String == "https://example.com/i.jpg")
        #expect(out["producedBy"] as? String == "Producer")
    }

    @Test("Event init from data and toDictionary round-trip")
    func testEventInitFromDataAndToDictionary() async throws {
        let dict: NSDictionary = [
            "eventid": "evt_1",
            "venuename": "The Venue",
            "address": "123 Main St, City",
            "date": "2025-10-10",
            "time": "20:00",
            "notes": "Doors open at 7pm",
            "ticketlink": "https://tickets.example.com",
            "marketinglink": "https://landing.example.com",
            "image": "https://example.com/flyer.jpg",
            "category": "music"
        ]

        let event = Event(data: dict)
        #expect(event.eventid == "evt_1")
        #expect(event.venuename == "The Venue")
        #expect(event.address == "123 Main St, City")
        #expect(event.date == "2025-10-10")
        #expect(event.time == "20:00")
        #expect(event.notes == "Doors open at 7pm")
        #expect(event.ticketlink == "https://tickets.example.com")
        #expect(event.marketinglink == "https://landing.example.com")
        #expect(event.image == "https://example.com/flyer.jpg")
        #expect(event.category == "music")

        let out = event.toDictionary()
        #expect(out["eventid"] as? String == "evt_1")
        #expect(out["venuename"] as? String == "The Venue")
        #expect(out["address"] as? String == "123 Main St, City")
        #expect(out["date"] as? String == "2025-10-10")
        #expect(out["time"] as? String == "20:00")
        #expect(out["notes"] as? String == "Doors open at 7pm")
        #expect(out["ticketlink"] as? String == "https://tickets.example.com")
        #expect(out["marketinglink"] as? String == "https://landing.example.com")
        #expect(out["image"] as? String == "https://example.com/flyer.jpg")
        #expect(out["category"] as? String == "music")
    }

    @Test("Config init with full response and toDictionary")
    func testConfigInitAndToDictionary() async throws {
        let response: NSDictionary = [
            "blogurl": "https://blog.example.com",
            "playmeappappleid": "123456789",
            "playmeappfacebookurl": "https://facebook.com/app",
            "playmeapphomeurl": "https://app.example.com",
            "playmeappid": "app_1",
            "playmeappinstagramurl": "https://instagram.com/app",
            "playmeappkeywords": "podcast, music",
            "playmeapplandingpageactive": "true",
            "playmeappname": "MyApp",
            "playmeappnameformatted": "myapp",
            "playmeappstoreurl": "https://apps.apple.com/app/id123456789",
            "playmeapptoken": "apptoken",
            "playmeapptwitterurl": "https://x.com/app",
            "playmetoken": "usertoken",
            "playmeappyoutubeurl": "https://youtube.com/@app"
        ]

        let config = Config(response: response)
        let cfg = try #require(config)
        #expect(cfg.blogurl == "https://blog.example.com")
        #expect(cfg.playmeappappleid == "123456789")
        #expect(cfg.playmeappfacebookurl == "https://facebook.com/app")
        #expect(cfg.playmeapphomeurl == "https://app.example.com")
        #expect(cfg.playmeappid == "app_1")
        #expect(cfg.playmeappinstagramurl == "https://instagram.com/app")
        #expect(cfg.playmeappkeywords == "podcast, music")
        #expect(cfg.playmeapplandingpageactive == "true")
        #expect(cfg.playmeappname == "MyApp")
        #expect(cfg.playmeappnameformatted == "myapp")
        #expect(cfg.playmeappstoreurl == "https://apps.apple.com/app/id123456789")
        #expect(cfg.playmeapptoken == "apptoken")
        #expect(cfg.playmeapptwitterurl == "https://x.com/app")
        #expect(cfg.playmetoken == "usertoken")
        #expect(cfg.playmeappyoutubeurl == "https://youtube.com/@app")

        let out = cfg.toDictionary()
        #expect(out["blogurl"] as? String == "https://blog.example.com")
        #expect(out["playmeappappleid"] as? String == "123456789")
        #expect(out["playmeappfacebookurl"] as? String == "https://facebook.com/app")
        #expect(out["playmeapphomeurl"] as? String == "https://app.example.com")
        #expect(out["playmeappid"] as? String == "app_1")
        #expect(out["playmeappinstagramurl"] as? String == "https://instagram.com/app")
        #expect(out["playmeappkeywords"] as? String == "podcast, music")
        #expect(out["playmeapplandingpageactive"] as? String == "true")
        #expect(out["playmeappname"] as? String == "MyApp")
        #expect(out["playmeappnameformatted"] as? String == "myapp")
        #expect(out["playmeappstoreurl"] as? String == "https://apps.apple.com/app/id123456789")
        #expect(out["playmeapptoken"] as? String == "apptoken")
        #expect(out["playmeapptwitterurl"] as? String == "https://x.com/app")
        #expect(out["playmetoken"] as? String == "usertoken")
        #expect(out["playmeappyoutubeurl"] as? String == "https://youtube.com/@app")
    }

    @Test("Config1 init with data and toDictionary")
    func testConfig1InitAndToDictionary() async throws {
        let data: NSDictionary = [
            "blogurl": "https://blog.example.com",
            "playmeappappleid": "123456789",
            "playmeappfacebookurl": "https://facebook.com/app",
            "playmeapphomeurl": "https://app.example.com",
            "playmeappid": "app_1",
            "playmeappinstagramurl": "https://instagram.com/app",
            "playmeappkeywords": "podcast, music",
            "playmeapplandingpageactive": "true",
            "playmeappname": "MyApp",
            "playmeappnameformatted": "myapp",
            "playmeappstoreurl": "https://apps.apple.com/app/id123456789",
            "playmeapptoken": "apptoken",
            "playmeapptwitterurl": "https://x.com/app",
            "playmetoken": "usertoken",
            "playmefeatures": "feature1,feature2",
            "playmeappyoutubeurl": "https://youtube.com/@app"
        ]

        let c1 = Config1(data: data)
        #expect(c1.blogurl == "https://blog.example.com")
        #expect(c1.playmeappappleid == "123456789")
        #expect(c1.playmeappfacebookurl == "https://facebook.com/app")
        #expect(c1.playmeapphomeurl == "https://app.example.com")
        #expect(c1.playmeappid == "app_1")
        #expect(c1.playmeappinstagramurl == "https://instagram.com/app")
        #expect(c1.playmeappkeywords == "podcast, music")
        #expect(c1.playmeapplandingpageactive == "true")
        #expect(c1.playmeappname == "MyApp")
        #expect(c1.playmeappnameformatted == "myapp")
        #expect(c1.playmeappstoreurl == "https://apps.apple.com/app/id123456789")
        #expect(c1.playmeapptoken == "apptoken")
        #expect(c1.playmeapptwitterurl == "https://x.com/app")
        #expect(c1.playmetoken == "usertoken")
        #expect(c1.playmefeatures == "feature1,feature2")
        #expect(c1.playmeappyoutubeurl == "https://youtube.com/@app")

        let out = c1.toDictionary()
        #expect(out["blogurl"] as? String == "https://blog.example.com")
        #expect(out["playmeappappleid"] as? String == "123456789")
        #expect(out["playmeappfacebookurl"] as? String == "https://facebook.com/app")
        #expect(out["playmeapphomeurl"] as? String == "https://app.example.com")
        #expect(out["playmeappid"] as? String == "app_1")
        #expect(out["playmeappinstagramurl"] as? String == "https://instagram.com/app")
        #expect(out["playmeappkeywords"] as? String == "podcast, music")
        #expect(out["playmeapplandingpageactive"] as? String == "true")
        #expect(out["playmeappname"] as? String == "MyApp")
        #expect(out["playmeappnameformatted"] as? String == "myapp")
        #expect(out["playmeappstoreurl"] as? String == "https://apps.apple.com/app/id123456789")
        #expect(out["playmeapptoken"] as? String == "apptoken")
        #expect(out["playmeapptwitterurl"] as? String == "https://x.com/app")
        #expect(out["playmetoken"] as? String == "usertoken")
        #expect(out["playmeappyoutubeurl"] as? String == "https://youtube.com/@app")
    }

    @Test("GathrConfiguration defaults when plist missing")
    func testGathrConfigurationDefaultsWhenNoPlist() async throws {
        let cfg = GathrConfiguration()
        #expect(cfg.BASE_URL() == "https://api.gathr.me/v4/")
        #expect(cfg.TOKEN() == nil)
        #expect(cfg.PLAYMEAPPTOKEN() == nil)
        #expect(cfg.APIKEY() == nil)
    }
}
