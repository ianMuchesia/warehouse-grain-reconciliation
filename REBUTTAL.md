# Rebuttal

## Why the numbers may differ

### User coverage

- Suppose the members, transactions and user logs tables don't share a master table of all users and all user records. **(Mistake)**
- If so, the record counts across the tables will differ by a wide margin.

### Duration calculation

- How is duration calculated? Is it a fixed number of days used as a filter, or a calendar to determine the number of days? **(Mistake)**
- Then: is the range "between X and Y" inclusive or exclusive?

### Subscriptions and payments

- Are there different premium subscription buckets that could create duplicate rows per user? That could lead to different numbers.
- Someone may have a subscription and never interact with the product they subscribed to. That may lead to a difference. **(Not a mistake)**
- A user may be paying for a subscription without knowing it, because payments are automatic. **(Not a mistake)**
- Payment failures are reconciled later, which is why the figures don't match. **(Not a mistake)**
- A user may pay towards the end of this month and only start using the subscription next month. **(Not a mistake)**
- App bugs may keep subscriptions running for users whose subscriptions have expired. **(Mistake)**
- There is a difference between the number of paying customers and the number of customers.

## Questions about the dashboard (12% fall in active users)

- Are we comparing with last month, or with several months?
- Are we counting paying users or non-paying users?
- Are we looking at this from the finance team's or the product team's view? Where do these numbers come from?
- Again: cancelled subscriptions, paying-user rate. The word "active" is ambiguous here.

## AI attack

Your plan allows AI to attack the rebuttal after you've written it. Here are five challenges. Don't just accept them; decide whether each one is right.

1. You labelled "fixed days vs calendar" as a mistake. Is it? If finance says "active = paid in the last 30 days" and product says "active = listened this calendar month", neither has made an error. They're different but valid definitions. When does it become a mistake?
2. Same question for "no master table". Each system recording its own users isn't wrong. What's the actual mistake: the missing master table, or someone assuming the three tables cover the same people?
3. Your best line is buried at the bottom: "the word active is ambiguous." That's your whole argument in five words. Should it be your first line?
4. Your dashboard questions are all about definitions: compared with what, paying or not, finance or product. Good. But suppose all of those are settled and it still says −12%. What else would you need to know? Think about how many users that is, and whether the number moves around that much every month anyway.
5. One heading is empty: what would have to be true for the boss's "one correct number" to actually be correct?

### My response

<!-- TODO: answer each challenge above -->
