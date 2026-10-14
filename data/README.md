# Data

Source: Kaggle, WSDM – KKBox's Churn Prediction Challenge
https://www.kaggle.com/c/kkbox-churn-prediction-challenge
Licence: <check the competition's Rules page and write it here>
Downloaded: 27 Sep 2026 (file timestamp)
Archive: kkbox-churn-prediction-challenge.zip, 8.4 GB
sha256: b9c3ec4fa5a44b91e71267f44f0988a372853750e3248f17dd943e82b3ae6543

The data is not in git. To recreate it: download the archive from the link
above, check the sha256, and unpack it into data/ (see the steps below).

## Inventory (14 Oct 2026) — full output: docs/inventory-2026-10-14.txt

| File | Bytes | Data rows | Date range |
|---|---|---|---|
| members_v3.csv | 427,921,437 | 6,769,473 | registered 2004-03-26 → 2017-04-29 |
| transactions.csv | 1,729,298,376 | 21,547,746 | paid 2015-01-01 → 2017-02-28; expires 1970-01-01 → 2017-03-31 |
| transactions_v2.csv | 115,394,513 | 1,431,009 | paid 2015-01-01 → 2017-03-31; expires 2016-04-19 → 2036-10-15 |
| user_logs.csv | 30,514,081,415 | 392,106,543 | 2015-01-01 → 2017-02-28 |
| user_logs_v2.csv | 1,431,465,728 | 18,396,362 | 2017-03-01 → 2017-03-31 |

Complete and readable: all files have a constant field count and end with a complete line.

I thought the v2 files for transactions and user logs were cleaned-up versions of the originals; they turned out to be continuations of v1.

## Open questions (record only — investigate Thursday)
- Expiry date 1970-01-01 in transactions: a missing value stored as zero?
- Expiry dates up to 2036 in transactions_v2.
- transactions_v2 overlaps transactions (2015–2017): are the same payments in both?
- members registrations run past the last log date (April 2017).
- members: bd = 0 and blank gender in sample rows.
