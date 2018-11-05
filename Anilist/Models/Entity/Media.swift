//
//  Media.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/05.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
struct Media {
    // The id of the media
    var id: Int!
    // The mal id of the media
    var idMal: Int
    // The official titles of the media in various languages
    var title: MediaTitle
    // The type of the media; anime or manga
    var type: MediaType
    // The format the media was released in
    var format: MediaFormat
    // The current releasing status of the media
    var status: MediaStatus
    // Short description of the media's story and characters
    //
    // Arguments
    // asHtml: Return the string in pre-parsed html instead of
    // markdown
    var description: String
    // The first official release date of the media
    var startDate: FuzzyDate
    // The last official release date of the media
    var endDate: FuzzyDate
    // The season the media was initially released in
    var season: MediaSeason
    // The amount of episodes the anime has when complete
    var episodes: Int
    // The general length of each anime episode in minutes
    var duration: Int
    // The amount of chapters the manga has when complete
    var chapters: Int
    // The amount of volumes the manga has when complete
    var volumes: Int
    // Where the media was created. (ISO 3166-1 alpha-2)
//    var countryOfOrigin: CountryCode
    // If the media is officially licensed or a self-published doujin release
    var isLicensed: Bool
    // Source type the media was adapted from.
//    var source: MediaSource
    // Official Twitter hashtags for the media
    var hashtag: String
    // Media trailer or advertisement
//    var trailer: MediaTrailer
    // When the media's data was last updated
    var updatedAt: Int
    // The cover images of the media
    var coverImage: MediaCoverImage
    // The banner image of the media
    var bannerImage: String
    // The genres of the media
    var genres: [String]
    // Alternative titles of the media
    var synonyms: [String]
    // A weighted average score of all the user's scores of the media
    var averageScore: Int
    // Mean score of all the user's scores of the media
    var meanScore: Int
    // The number of users with the media on their list
    var popularity: Int
    // The amount of related activity in the past hour
    var trending: Int
    // List of tags that describes elements and themes of the media
//    var tags: [MediaTag]
    // Other media in the same or connecting franchise
//    var relations: MediaConnection
    // The characters in the media
    //
    // Arguments
    // sort: [Not documented]
    // role: [Not documented]
    // page: The page
    // perPage: The amount of entries per page, max 25
//    var characters(
//    var sort: [CharacterSort],
//    var role: CharacterRole,
//    var page: Int,
//    var perPage: Int
//    ): CharacterConnection
    // The staff who produced the media
    //
    // Arguments
    // sort: [Not documented]
    // page: The page
    // perPage: The amount of entries per page, max 25
//    var staff(sort: [StaffSort], page: Int, perPage: Int): StaffConnection
    // The companies who produced the media
    //
    // Arguments
    // sort: [Not documented]
    // isMain: [Not documented]
//    var studios(sort: [StudioSort], isMain: Bool): StudioConnection
    // If the media is marked as favourite by the current authenticated user
    var isFavourite: Bool!
    // If the media is intended only for 18+ adult audiences
    var isAdult: Bool
    // The media's next episode airing schedule
//    var nextAiringEpisode: AiringSchedule
    // The media's entire airing schedule
    //
    // Arguments
    // notYetAired: Filter to episodes that have not yet aired
    // page: The page
    // perPage: The amount of entries per page, max 25
//    var airingSchedule(notYetAired: Bool, page: Int, perPage: Int): AiringScheduleConnection
    // The media's daily trend stats
    //
    // Arguments
    // sort: [Not documented]
    // releasing: Filter to stats recorded while the media was
    // releasing
    // page: The page
    // perPage: The amount of entries per page, max 25
//    var trends(sort: [MediaTrendSort], releasing: Bool, page: Int, perPage: Int): MediaTrendConnection
    // External links to another site related to the media
//    var externalLinks: [MediaExternalLink]
    // Data and links to legal streaming episodes on external sites
//    var streamingEpisodes: [MediaStreamingEpisode]
    // The ranking of the media in a particular time span and format compared to other
    // media
//    var rankings: [MediaRank]
    // The authenticated user's media list entry for the media
//    var mediaListEntry: MediaList
    // User reviews of the media
    //
    // Arguments
    // limit: [Not documented]
    // sort: [Not documented]
    // page: The page
    // perPage: The amount of entries per page, max 25
//    var reviews(limit: Int, sort: [ReviewSort], page: Int, perPage: Int): ReviewConnection
//    var stats: MediaStats
    // The url for the media page on the AniList website
    var siteUrl: String
    // If the media should have forum thread automatically created for it on airing
    // episode release
    var autoCreateForumThread: Bool
    // Notes for site moderators
    var modNotes: String

}
