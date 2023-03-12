
## Requirements

In this section, you should describe all kinds of requirements for your module: functional and non-functional requirements.

### Domain model

Our application's domain is focused around the user and his items up for trading. Therefore, the key concepts in our application are: the user, items, events, messages and notifications. The user, events and items are the real world entities that our system is interested in. A user has items that he intends to trade with someone, and he can also arrange events where more users may join and trade items of a certain category. Messages are to be the main means of communication between users, where they can discuss trades and negotiate items. Finally, notifications are meant to keep the user informed of recent events of their interest, such as other users starting to follow them, someone marking one of their items as a favourite or even when someone they follow posts a new item. We decided to keep the domain simple and reduce the app to the essential concepts, in order to expedite the development, and provide a cleaner experience to the user. 

Example:
 <p align="center" justify="center">
  <img src="https://user-images.githubusercontent.com/64654433/224508778-6dba2aeb-d0c3-4d09-9bdb-e228f37fda2f.png"/>
</p>
