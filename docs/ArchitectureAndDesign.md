## Architecture and Design
The architecture of a software system encompasses the set of key decisions about its overall organization. 

A well written architecture document is brief but reduces the amount of time it takes new programmers to a project to understand the code to feel able to make modifications and enhancements.

### Logical architecture
The purpose of this subsection is to document the high-level logical structure of the code (Logical View), using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.

Our app is devided in 3 main packages, Presentation package, Business package and Backend package. The Presentation package has everything that is related to the interface of our app (screens, buttons, ...). The Business package is divided in 3 sub-packages, Transactions, Items and Users. Transactions package representing a transaction between two users on the app, User package representing a user of the app and Item package representing an item that can be traded on the app.

![package_diagram drawio](https://user-images.githubusercontent.com/113949811/225690095-e4a440a8-f9f3-4406-9b00-185de4d7504f.png)

Our app's GUI communicates directly with its business logic services in order to create a smooth user experience, where requests by the user are directly attended to. To ensure fast, reliable and effective communication between users, the business logic services are directly connected to the Firebase servers where the important information is stored.

![Diagrama sem nome drawio (3)](https://user-images.githubusercontent.com/94202158/225685751-f3c7b092-8e83-4e5e-ad05-6cfa35852293.png)

### Physical architecture

The high-level physical structure of the system is depicted in a deployment diagram, which illustrates the relationship between the hardware and software components of the system. The deployment diagram shows that the Switchit application runs on a user's mobile device and communicates with the backend servers through the internet.

The user's mobile device runs on the Android or iOS platform, and the application is developed using the Flutter framework. Flutter was selected as the framework of choice because it enables the development of highly performant and visually appealing applications across multiple platforms. Flutter provides a rich set of widgets and tools, which makes it easier to build responsive and beautiful user interfaces.

Finally, the database management system used by Switchit is Firebase. Firebase is a cloud-based database service that provides real-time data synchronization and offline data access for mobile and web applications. Firebase's cloud-based architecture ensures that data is always accessible and synchronized across all devices, while its real-time data synchronization ensures that users always have the latest information on item availability and trade offers.

![physical architeture drawio](https://user-images.githubusercontent.com/94236502/224554438-0e223175-47d1-4667-842b-b7055fafb143.png)

### Model-View-ViewModel (MVVM)
The MVVM pattern has been implemented in this project and it helps cleanly separate an application's business and presentation logic from its user interface (UI). Maintaining a clean separation between application logic and the UI helps address numerous development issues and makes an application easier to test, maintain, and evolve. It can also significantly improve code re-use opportunities and allows developers and UI designers to collaborate more easily when developing their respective parts of an app.

The view is responsible for defining the structure, layout, and appearance of what the user sees on screen.

The view model implements properties and commands to which the view can data bind to, and notifies the view of any state changes through change notification events. The properties and commands that the view model provides define the functionality to be offered by the UI, but the view determines how that functionality is to be displayed. The view model is also responsible for coordinating the view's interactions with any model classes that are required.

![mvvm-pattern](https://user-images.githubusercontent.com/93836583/232473701-6c5c1006-78f6-4de6-8d77-02d954d3e7e3.png)

### Realm
Realm has been implemented in this project and it is a mobile database that runs directly inside phones, tablets or wearables. This repository holds the source code for the Realm SDK for Flutter and Dart.
### Vertical prototype
To begin, it was implemented the login screen which is the first point of entry for a user into a system. In order to create this feature, it was designed a user interface that prompts the user for their login credentials, such as an email and password.

Moving on to the home screen, this feature servers as a landing page for the user after they have successfully logged in. In this early stage it was simply created a route to the home screen by clicking the "Sign in" button without worrying about the user's credentials.

It was also implemented a messages screen where the users can chat with each other. In the home screen the users have also a route for this screen.

Finally, it was implemented a screen with the app credits where it has a brief introduction and the whole team members.

![login_snapshotdraft](https://user-images.githubusercontent.com/93836583/225309440-b4cc9321-5888-43f8-a8de-4daa4b79058d.png)
![home_snapshotdraft](https://user-images.githubusercontent.com/93836583/225309450-c8b8bd59-79b6-4656-9a8d-207b9a2889d2.png)
![messages_snapshotdraft](https://user-images.githubusercontent.com/93836583/225309429-c7c5b64b-ae9c-4ba4-b190-f0c55d8b8df9.png)
![credits_snapshotdraft](https://user-images.githubusercontent.com/93836583/225309452-0ec77fe8-1090-4120-b7e5-d4a1ad194a90.png)
