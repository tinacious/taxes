# Tax scripts

## Uber

Run `ruby uber.rb` in order to generate the CSV.


### Input

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


#### Getting the input

To get the input, you'll need to log into [Uber.com](https://uber.com) on the website and load up "My trips."

There's an API request called `getTripsForClient`. The response property you want is `data.trips.trips`. As this is paginated, collecting all of the trips can be annoying.


### Output

It should result in something like this:

```csv
Date,Description,Amount
2020-01-19,Uber,-20.24
2019-12-31,Uber,-12.84
```
