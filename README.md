# Talkpush Technical Test

Talkpush technical test for ruby on rais job position. Given a google sheets, recurrently check for changes on it and if there is a new one, create a candidate through the talkpush api with the data.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Installed software required

```
- Ruby v2.6.3 (latest current stable version at the time)
- Rails v5.2.3
```

### Installing

These are the steps for getting a running copy of this repository.

1. Download the repository and navigate to it from the bash
2. Run the command ``` bundle install ```
3. Open on an editor the file *config/environments/development.rb.sample* and rename it to development.rb (just remove the ".sample" from the name).
4. In the same file, replace the value of the variable named "GOOGLE_SHEETS_API_KEY" for the value of your google api key authorized to access the Google Sheets API (https://console.developers.google.com/apis/dashboard) and the variable named "GOOGLE_SHEET_ID" for the id of one of your google sheets (see the **Solution requirements** section for the structure that the sheet must have).
5. In the same file, replace the value of the variable named: "TALKPUSH_CAMPAIGNID" for the talkpush campaign in which you want to create candidates, replace the value of the variable named "TALKPUSH_API_KEY" with your talkpush api key.
6. Run the project by executing the command: ``` rails s ```

## Running the tests

Explain how to run the automated tests for this system

## Deployment

Same steps as installing but with the file *config/environments/production.rb.sample* instead of *development.rb.sample* and the final step commande would be `RAILS_ENV=production rails s ` for a simple deploy, otherwise, with apache passenger it is possible to deploy this project

## Versioning

Latest and only version is **1.0.0-alpha.1** and contains the features:
1. Periodically checks a google sheet for new candidates and if there are new ones, create them in the talkpush campaign.

## Authors

* **Benjamin Lewis**

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* For job scheduling **clockwork gem** is used.
* **Http Party gem** is used for doing http requests to the talkpush api and google sheets api.


## Solution requirements

The used google sheets must have this format (Columns order matters):

| Timestamp       |First Name |Last Name |Email                    | Phone Number |
|-----------------|-----------|----------|-------------------------|--------------|
|7/26/2019 3:27:19|An         |Example   | an_example@examples.com | 00000000     |
|7/26/2019 4:27:19|John       | Doe      | jdoe@examples.com       | 12345678     |

## Solution

- Class diagram (whitout methods and attributes, just the architecture): https://drive.google.com/open?id=1l-wgudPaCGQHL6MNiaKMD5kP2L1ZXjdO
- To search only for new ones, google sheets api allowed to send a range, so the total rows that have been sent are persisted in a temporal file
- Optimistic approach, when a new record is retrieve from the sheet is sent to the talkpush api is assumed that it is always successful, in case is is not successful, tan error is logged and the data of the candidate is written to a log, then could be send manually or implement a new feature for the retry.
