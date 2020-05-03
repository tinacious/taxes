# Tax scripts

Some handy tax scripts for processing data as expense line items.

For use with accounting software that understands the following output:

```csv
Date,Description,Amount
2020-01-19,Service,-20.24
2019-12-31,Service,-12.84
```

See the relevant sections for generating CSV's

- [Uber](#uber)
- [Lyft](#lyft)
- [Honk](#honk)


## Uber

Run `ruby uber.rb` in order to generate the CSV.

To get the input, you'll need to log into [Uber.com](https://uber.com) on the website and load up "My trips."

There's an API request called `getTripsForClient`. The response property you want is `data.trips.trips`. As this is paginated, collecting all of the trips can be annoying.

Input should look something like the following. The properties `clientFare` and `requestTime` are used to generate the report.

```json
[
  {
    "uuid": "d4***0f35",
    "status": "COMPLETED",
    "clientFare": 20.24,
    "currencyCode": "CAD",
    "isSurgeTrip": false,
    "requestTime": "2020-01-19T00:28:13.000Z",
    "dropoffTime": "2020-01-19T00:57:13.000Z"
  },
  {
    "uuid": "f8***d533",
    "status": "COMPLETED",
    "clientFare": 12.84,
    "currencyCode": "CAD",
    "isSurgeTrip": false,
    "requestTime": "2019-12-31T00:55:01.000Z",
    "dropoffTime": "2019-12-31T01:09:26.000Z"
  }
]
```

There's a lot more properties than expressed above.


## Lyft

Run `ruby lyft.rb` in order to generate the CSV.

To get the input, open the mobile app and go to Settings then "Ride history." From there, tap the button that says "Export" or displays an export icon. Tap **every single trip** you'd like to export.

You will receive an email with a CSV called `ride_report_YYYY-MM-DD` that looks something like this:

```csv
date,origin,destination,total,currency
2018-12-15 23:49:08,"123 Some St, Toronto","99 Destination Ave, Toronto",$9.51,CAD
2019-03-30 23:13:50,"456 Another St, Toronto","88 Arrival Blvd, Toronto",$7.60,CAD
```


## Honk

Run `ruby honk.rb` in order to generate the CSV from the JSON data. It will leverage the `created_at` and `total_paid` properties to generate the report.

To get the input, visit the Honk website on your computer. Go to the Receipts page. Inspect the receipts API call and get property `data.receipts`.

It should look something like this:

```json
[
  {
    "invoice": "u***c",
    "start_time": "2018-07-13T23:29:36.000Z",
    "end_time": "2018-07-14T10:00:00.000Z",
    "timezone_offset": -240,
    "status": "sale",
    "txn_id": 2616681,
    "created_at": "2018-07-13T23:29:44.000Z",
    "total_paid": "10.35",
    "zone_address": {
      "city": "Toronto",
      "country_code": "CA"
    },
    "has_refund": false
  }
]
```
