Original App Design Project - README Template
===

# Nutriway

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Nutritional application where users can customized their lifestyle or medical diet to fit their needs. The user selects their custom diet while registering for the first time and everytime they open the app, it will display a feed of healthy choices/recipes custom to their needs.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Nutrition/Dietary Application
- **Mobile:** Website includes Login/Registration, Customization, Scroll Feeds, Accessibility
- **Story:** Allows users to personalize their scroll feed to their dietary needs
- **Market:** Anyone with special diets or medical conditions such as: vegetarians, keto, people with diabetes.. etc. that are looking for a quick feed with numerous options.
- **Habit:** Users can access it at anytime to get new recipes that fit them and they can save their favorite recipes.
- **Scope:** Nutriway will allow users to login and enter their dietary needs and restrictions and will allow users to scroll a feed to search for recipes within there diet needs. They will be able to view the recipe based on the presets they set. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can register a nutrition account
* User can login with their nutrition account
* User can look at different food / recipe options
* User can see their nutritional / dietary progress

**Optional Nice-to-have Stories**

* App can suggest foods that user can eat to stay on track
* Presets for certain and common diet options such as keto, no gluten, etc.
* Users can look at other user's diet and profile
* Tab for restaurants and restaurant suggestions

### 2. Screen Archetypes

* Login
   * Login/Registration - User can login or sign up to there account
* Settings
   * Settings/Selection - User can select there dietary needs - occurs one time (can change later)
* Stream
   * Stream - User can scroll through feed of options custom to them
* Detail
    * Detail - User can click on specific recipes to get more details
* Creation
    * User can add specific foods to track their food and nutritional intake
* Profile
    * User can see their nutritional progress

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Stream
* Creation
* Profile
* Settings

**Flow Navigation** (Screen to Screen)

* Login
   * Stream
* Register
   * Stream
* Stream
    * Detail
        * Creation
* Creation
    * Detail
* Profile
    * Settings
    * Detail
* Settings

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
