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
