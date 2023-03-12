## Architecture and Design
The architecture of a software system encompasses the set of key decisions about its overall organization. 

A well written architecture document is brief but reduces the amount of time it takes new programmers to a project to understand the code to feel able to make modifications and enhancements.

To document the architecture requires describing the decomposition of the system in their parts (high-level components) and the key behaviors and collaborations between them. 

In this section you should start by briefly describing the overall components of the project and their interrelations. You should also describe how you solved typical problems you may have encountered, pointing to well-known architectural and design patterns, if applicable.

### Logical architecture
The purpose of this subsection is to document the high-level logical structure of the code (Logical View), using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.

Our app is devided in 3 main packages, Presentation package, Business package and Backend package. The Presentation package has every thing that is related to the interface of our app (screens, buttons, ...). The Business package is divided in 3 sub-packages, Transactions, Items and Users. Transactions package representing a transaction between two users on the app, User package representing a user of the app and Item package representing an item that can be traded on the app. The Backend package contains all the backend components of the app, such as the database, API, and server.

![package diagram drawio](https://user-images.githubusercontent.com/113949811/224556646-f213ed2d-0be9-409d-893b-ca4735bb480a.png)

Our app's GUI communicates directly with its business logic services in order to create a smooth user experience, where requests by the user are directly attended to. To ensure fast, reliable and effective communication between users, the business logic services are directly connected to the Firebase servers where the important information is stored.

![Diagrama sem nome drawio (2)](https://user-images.githubusercontent.com/94202158/224556121-9975036e-abe1-4898-b9d4-76dfe5dc4cd2.png)

### Physical architecture
The goal of this subsection is to document the high-level physical structure of the software system (machines, connections, software components installed, and their dependencies) using UML deployment diagrams (Deployment View) or component diagrams (Implementation View), separate or integrated, showing the physical structure of the system.

It should describe also the technologies considered and justify the selections made. Examples of technologies relevant for uni4all are, for example, frameworks for mobile applications (such as Flutter).

Example of _UML deployment diagram_ showing a _deployment view_ of the Eletronic Ticketing System (please notice that, instead of software components, one should represent their physical/executable manifestations for deployment, called artifacts in UML; the diagram should be accompanied by a short description of each node and artifact):

![physical architeture drawio](https://user-images.githubusercontent.com/94236502/224554438-0e223175-47d1-4667-842b-b7055fafb143.png)
![Component_diagram](https://user-images.githubusercontent.com/93836583/224556826-75580d1c-1feb-417f-a0d7-4a67227420ee.png)

### Vertical prototype
To help on validating all the architectural, design and technological decisions made, we usually implement a vertical prototype, a thin vertical slice of the system.

In this subsection please describe which feature you have implemented, and how, together with a snapshot of the user interface, if applicable.

At this phase, instead of a complete user story, you can simply implement a feature that demonstrates thay you can use the technology, for example, show a screen with the app credits (name and authors).
