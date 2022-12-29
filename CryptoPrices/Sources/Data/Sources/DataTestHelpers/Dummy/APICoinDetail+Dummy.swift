//
//  APICoinDetail.swift
//
//  Created by Khanh on 28/12/2022.
//

import NetworkCore
import NetworkExtension

public extension APICoinDetail {
    
    static let dummy: APICoinDetail = """
    {
      "id": "bitcoin",
      "symbol": "btc",
      "name": "Bitcoin",
      "asset_platform_id": null,
      "platforms": {
        "": ""
      },
      "detail_platforms": {
        "": {
          "decimal_place": null,
          "contract_address": ""
        }
      },
      "image": {
        "thumb": "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579",
        "small": "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1547033579",
        "large": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"
      },
      "market_data": {
        "current_price": {
          "aed": 61645,
          "ars": 2955218,
          "aud": 24895,
          "usd": 16784.67
        },
        "ath": {
          "aed": 253608,
          "ars": 6913791,
          "aud": 93482,
          "usd": 69045
        },
        "ath_change_percentage": {
          "aed": -75.69159,
          "ars": -57.24712,
          "aud": -73.35158,
          "usd": -75.68881
        },
        "ath_date": {
          "aed": "2021-11-10T14:24:11.849Z",
          "ars": "2021-11-10T14:24:11.849Z",
          "aud": "2021-11-10T14:24:11.849Z",
          "usd": "2021-11-10T14:24:11.849Z"
        },
        "atl": {
          "aed": 632.31,
          "ars": 1478.98,
          "aud": 72.61,
          "usd": 67.81
        },
        "atl_change_percentage": {
          "aed": 9649.60967,
          "ars": 199757.37833,
          "aud": 34209.00789,
          "usd": 24654.24159
        },
        "atl_date": {
          "aed": "2015-01-14T00:00:00.000Z",
          "ars": "2015-01-14T00:00:00.000Z",
          "aud": "2013-07-05T00:00:00.000Z",
          "bch": "2017-08-02T00:00:00.000Z",
          "usd": "2013-07-06T00:00:00.000Z"
        },
        "market_cap": {
          "aed": 1186356655519,
          "ars": 56882264217555,
          "aud": 479398006776,
          "usd": 323022058965
        },
        "market_cap_rank": 1,
        "fully_diluted_valuation": {
          "aed": 1294575928890,
          "ars": 62071055693296,
          "aud": 523128619916,
          "usd": 352488081970
        },
        "total_volume": {
          "aed": 55863634403,
          "ars": 2678075737915,
          "aud": 22560029572,
          "usd": 15210591286
        },
        "high_24h": {
          "aed": 62299,
          "ars": 2968356,
          "aud": 25163,
          "usd": 16961.42
        },
        "low_24h": {
          "aed": 61577,
          "ars": 2931377,
          "aud": 24844,
          "bch": 162.934,
          "usd": 16766.15
        },
        "price_change_24h": -40.0512271102,
        "price_change_percentage_24h": -0.23805,
        "price_change_percentage_7d": 2.20493,
        "price_change_percentage_14d": -2.29882,
        "price_change_percentage_30d": 1.99629,
        "price_change_percentage_60d": -17.2287,
        "price_change_percentage_200d": -44.23918,
        "price_change_percentage_1y": -66.99366,
        "market_cap_change_24h": -803320479.208,
        "market_cap_change_percentage_24h": -0.24807,
        "price_change_24h_in_currency": {
          "aed": -152.4792510078696,
          "ars": 23810,
          "aud": -142.11345979950784,
          "usd": -40.051227110245236
        },
        "price_change_percentage_1h_in_currency": {
          "aed": -0.04993,
          "ars": -0.07503,
          "aud": 0.20362,
          "bch": -0.27398,
          "usd": -0.04993
        },
        "price_change_percentage_24h_in_currency": {
          "aed": -0.24674,
          "ars": 0.81225,
          "aud": -0.56762,
          "usd": -0.23805
        },
        "price_change_percentage_7d_in_currency": {
          "aed": 2.19881,
          "ars": 3.64971,
          "aud": 1.64496,
          "usd": 2.20493
        },
        "price_change_percentage_14d_in_currency": {
          "aed": -2.306,
          "ars": 0.42226,
          "aud": -2.14086,
          "usd": -2.29882
        },
        "price_change_percentage_30d_in_currency": {
          "aed": 1.9874,
          "ars": 8.6352,
          "aud": 2.12829,
          "bch": 11.70098,
          "usd": 1.99629
        },
        "price_change_percentage_60d_in_currency": {
          "aed": -17.23618,
          "ars": -6.40808,
          "aud": -20.79372,
          "usd": -17.2287
        },
        "price_change_percentage_200d_in_currency": {
          "aed": -44.24556,
          "ars": -19.24497,
          "aud": -41.2844,
          "usd": -44.23918
        },
        "price_change_percentage_1y_in_currency": {
          "aed": -66.99624,
          "ars": -43.14562,
          "aud": -64.60163,
          "bch": 45.62688,
          "usd": -66.99366
        },
        "market_cap_change_24h_in_currency": {
          "aed": -3053963178.9990234,
          "ars": 440225301669,
          "aud": -2580773560.2089844,
          "usd": -803320479.2079468
        },
        "market_cap_change_percentage_24h_in_currency": {
          "aed": -0.25676,
          "ars": 0.77996,
          "aud": -0.53545,
          "usd": -0.24807
        },
        "total_supply": 21000000,
        "max_supply": 21000000,
        "circulating_supply": 19244518,
        "last_updated": "2022-12-27T16:27:59.014Z"
      },
      "community_data": {
        "facebook_likes": null,
        "twitter_followers": 5682653,
        "reddit_average_posts_48h": 6.462,
        "reddit_average_comments_48h": 424.462,
        "reddit_subscribers": 4763733,
        "reddit_accounts_active_48h": 8730,
        "telegram_channel_user_count": null
      },
    }
    """
        .utf8Data
        .decoded()
}
