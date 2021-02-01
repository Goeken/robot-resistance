# The Robot Resistance
---
#### Overview
  - For this challenge, I used https://developer.marvel.com/docs API for access to heroes.
  - Application uses a Starts With Search to find different characters. Limit 20 per search.
  - Database contains the `Heroes` model. I used this model to store the hero once selected, as well as the issued badge information. 
  - A hero can be selected only once. The button will be disabled after it's been selected.
  - A hero selected will be assessed by the resistance members, then they will find the appropriate badge template to assign. Once the badge template is set, a new badge will be issued.
  - All previously selected heroes will be displayed on the home page, along with their badge information. The badge information is being pulled from the DB since there is no point in making multiple API calls. 
  - Deployed Application to Heroku: https://the-robot-resistance.herokuapp.com/
***

#### Feature wish list
  - For a more scalable approach, I would have created a `badge` model if the hero is assigned multiple badges.
  - I would have liked to create my own badge templates, but I did not see any documentation about how to do so?
  - I would have liked to use more React on the project, but I didn't see enough functionality requiring it, and it would have cost time.