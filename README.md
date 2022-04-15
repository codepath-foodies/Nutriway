Original App Design Project
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
* Favorites Screen
  * User can see their favorite recipes here.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Stream
* Profile
* Creation
* Favorites Screen
* Settings

**Flow Navigation** (Screen to Screen)

*  Forced Login
   * User needs to create an account if they do not have one already. Shows registration screen.
   * Transitions to Home Screen
* Stream
   * User sees a view of recipes that are on their personal feed.
   * -> Recipe Detail (jumps to detail screen if user clicks on recipe)
      * Detailed description of clicked recipe.
   * -> Recipe Creation (user can also create recipes here)
* Profile
   * -> Recipe Detail
* Creation
   * Modify text and image fields here.
* Favorites Screen
   * -> Recipe Detail
* Settings (toggles)

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://cdn.discordapp.com/attachments/880305507326373951/959439752552124416/IMG_0276.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups
<img src="https://cdn.discordapp.com/attachments/944684807928053860/959266115060641832/Nutriway_Wireframe.jpg" width=600>

### [BONUS] Interactive Prototype

## Schema
### Models
Recipes
| Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | recipeId      | String   | unique id for recipe post (default field) |
   | recipeImage   | File     | image for recipe |
   | recipeAuthor  | pointer  | author of recipe |
   | recipeDesc    | String   | recipe description by author |
   | recipeValue   | Dict     | Nutritional value of recipe sorted by dietary counts |
   | recipeName    | String   | Name of recipe |

User
| Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | userName      | String   | Name of user |
   | userID        | String   | unique id for a certain user |
   | userHistory   | Dict     | int:list dictionary that keeps user's food intake by day |
   | userNutrition | Dict     | int:dict dictionary that keeps user's food nutr. by day |
   | userFavorites | List     | List of user's favorite recipes |
   
### Networking
* Stream Screen
  * (Read/GET) Query all recent recipes
  * (Create/POST) Create new like on recipe
  * (DELETE) Delete like on recipe
  * (Update/PUT) Update user's list of favorite recipes
* Profile Screen
  * (Read/GET) Query user's nutritional status
  * (Read/GET) User's food history
  * (DELETE) User's choice of deleting something from their food history
* Creation Screen
  * (Create/POST) Create new recipe
* Detail Screen
  * (Update/PUT) Update user's nutritional status
- [OPTIONAL: List endpoints if using existing API such as Yelp]

## App Progress
### Milestone 1
For this week, we focused on setting up the necessary backend components and imagining some of the login and registration screen. Focus on storyboard and view controller design will follow next week.

<img src='https://i.imgur.com/30igOIQ.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
