Party Planner App Design Project - README Template
===

# Event Planner

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This app will allow users to invite other users to events and also allow users to plan out aspects of the event. It will also allow people to claim tasks in preparation of the event.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Organization
- **Mobile:** Mobile First
- **Story:** Allows users to plan events in an organized fashion.
- **Market:** Anyone who needs to plan an event.
- **Habit:** Makes coordination with other easy, encouraging returning to the app
- **Scope:** Event planning and ability to send and recieve invitations.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Login 
* Create an account 
* Allows user to create an event and share with others
* Displays list of to-do's for each event when clicked on
* Display different events 
* Claim to-do's

**Optional Nice-to-have Stories**

* Profile customization screen
* Settings screen

### 2. Screen Archetypes

* Login screen
   * log in
   * create account button
* Account Creation screen
   * ability to create an account
* Event list screen
    * displays all events that a user has created or been invited to
* To-do's screen
    * displays all to-do's of an event when the event is clicked ono
* Profile screen
    * customize profile and edit settings

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Events
* Profile/Settings

**Flow Navigation** (Screen to Screen)

* Login
   * upon login, go to events
   * create an account button takes user to create an account screen
* Account Creation
    * Creates account when prompted
    * Takes user to events page after creation  
* Events
   * clicking on event takes you to to-do's screen for that event


## Wireframes

<img src=https://i.imgur.com/3yIkNt0.jpg width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

### Models
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | author        | Pointer to User| event author |
   | password         | string     | user's password |
   | tasks       | list   | list tasks to be done for event |
   | taskClaimer | string | whoever claims the task |
   | date    | string   | date of event |
   | singleTask     | string | task for event |
   | updatedAt     | DateTime | date when event is last updated (default field) |
   | createdAt     | DateTime | date when event was created (default field) |
   
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts where user is author or user has been invited.
      - (Delete) Delete existing post
   - Create Post Screen
      - (Create/POST) Create a new post object
      - (Create/POST) Create a new task on a post
      - (Delete) Delete existing task
   - Post Screen
       - (Create/POST) claim task in post
       -  (Delete) unclaim task in post
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user profile image
