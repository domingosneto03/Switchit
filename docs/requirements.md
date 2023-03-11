
## Requirements

In this section, you should describe all kinds of requirements for your module: functional and non-functional requirements.


### User stories
The user stories should be created as GitHub issues. Therefore, this section will *not* exist in your report, it is here only to explain how you should describe the requirements of the product as **user stories**. 

A user story is a description of desired functionality told from the perspective of the user or customer. A starting template for the description of a user story is 

*As a < user role >, I want < goal > so that < reason >.*

User stories should be created and described as [Issues](https://github.com/FEUP-LEIC-ES-2022-23/templates/issues) in GitHub with the label "user story". See how to in the video [Creating a Product Backlog of User Stories for Agile Development using GitHub](https://www.youtube.com/watch?v=m8ZxTHSKSKE).

You should name the issue with the text of the user story, and, in the "comments" field, add any relevant notes, the image(s) of the user interface mockup(s) (see below) and the acceptance test scenarios (see below). 

**INVEST in good user stories**. 
You may add more details after, but the shorter and complete, the better. In order to decide if the user story is good, please follow the [INVEST guidelines](https://xp123.com/articles/invest-in-good-stories-and-smart-tasks/).

**User interface mockups**.
After the user story text, you should add a draft of the corresponding user interfaces, a simple mockup or draft, if applicable.

**Acceptance tests**.
For each user story you should write also the acceptance tests (textually in [Gherkin](https://cucumber.io/docs/gherkin/reference/)), i.e., a description of scenarios (situations) that will help to confirm that the system satisfies the requirements addressed by the user story.

**Value and effort**.
At the end, it is good to add a rough indication of the value of the user story to the customers (e.g. [MoSCoW](https://en.wikipedia.org/wiki/MoSCoW_method) method) and the team should add an estimation of the effort to implement it, for example, using t-shirt sizes (XS, S, M, L, XL).



### Domain model

Our application's domain is focused around the user and his items up for trading. Therefore, the key concepts in our application are: the user, items, events, messages and notifications. The user, events and items are the real world entities that our system is interested in. A user has items that he intends to trade with someone, and he can also arrange events where more users may join and trade items of a certain category. Messages are to be the main means of communication between users, where they can discuss trades and negotiate items. Finally, notifications are meant to keep the user informed of recent events of their interest, such as other users starting to follow them, someone marking one of their items as a favourite or even when someone they follow posts a new item. We decided to keep the domain simple and reduce the app to the essential concepts, in order to expedite the development, and provide a cleaner experience to the user. 

Example:
 <p align="center" justify="center">
  <img src="![domain_model drawio](https://user-images.githubusercontent.com/64654433/224508778-6dba2aeb-d0c3-4d09-9bdb-e228f37fda2f.png)"/>
</p>
