## Architecture and Design
The architecture of a software system encompasses the set of key decisions about its overall organization. 

A well written architecture document is brief but reduces the amount of time it takes new programmers to a project to understand the code to feel able to make modifications and enhancements.

### Logical architecture
The purpose of this subsection is to document the high-level logical structure of the code (Logical View), using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.

Our app is devided in 3 main packages, Presentation package, Business package and Backend package. The Presentation package has everything that is related to the interface of our app (screens, buttons, ...). The Business package is divided in 3 sub-packages, Transactions, Items and Users. Transactions package representing a transaction between two users on the app, User package representing a user of the app and Item package representing an item that can be traded on the app. The Backend package contains all the backend components of the app, such as the database, API, and server.

![package diagram drawio](https://user-images.githubusercontent.com/113949811/224558814-29da752b-2d7c-4936-955c-bec0d54fefa0.png)

Our app's GUI communicates directly with its business logic services in order to create a smooth user experience, where requests by the user are directly attended to. To ensure fast, reliable and effective communication between users, the business logic services are directly connected to the Firebase servers where the important information is stored.

![Diagrama sem nome drawio (2)](https://user-images.githubusercontent.com/94202158/224556121-9975036e-abe1-4898-b9d4-76dfe5dc4cd2.png)

### Physical architecture

The high-level physical structure of the system is depicted in a deployment diagram, which illustrates the relationship between the hardware and software components of the system. The deployment diagram shows that the Switchit application runs on a user's mobile device and communicates with the backend servers through the internet.

The user's mobile device runs on the Android or iOS platform, and the application is developed using the Flutter framework. Flutter was selected as the framework of choice because it enables the development of highly performant and visually appealing applications across multiple platforms. Flutter provides a rich set of widgets and tools, which makes it easier to build responsive and beautiful user interfaces.

Finally, the database management system used by Switchit is Firebase. Firebase is a cloud-based database service that provides real-time data synchronization and offline data access for mobile and web applications. Firebase's cloud-based architecture ensures that data is always accessible and synchronized across all devices, while its real-time data synchronization ensures that users always have the latest information on item availability and trade offers.

![physical architeture drawio](https://user-images.githubusercontent.com/94236502/224554438-0e223175-47d1-4667-842b-b7055fafb143.png)
![Component_diagram](https://user-images.githubusercontent.com/93836583/224556826-75580d1c-1feb-417f-a0d7-4a67227420ee.png)

### Vertical prototype
To help on validating all the architectural, design and technological decisions made, we usually implement a vertical prototype, a thin vertical slice of the system.

In this subsection please describe which feature you have implemented, and how, together with a snapshot of the user interface, if applicable.

At this phase, instead of a complete user story, you can simply implement a feature that demonstrates thay you can use the technology, for example, show a screen with the app credits (name and authors).
