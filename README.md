## The Brotherhood
###### Ravi S. Rāmphal // 2014.04.14 // Refactored 2014.05.19

***

### Description

This site was a combination of the Portfolio Challenges 1-4 for Phase 2 of [Dev Bootcamp](http://devbootcamp.com). Challenge 1 was to create a RESTful CRUD app in [Sinatra](http://www.sinatrarb.com), Challenge 2 was to use ActiveRecord, Challenge 3 was to implement authentication and authorization, and Challenge 4 was to practice CSS.

I really got into this challenge, and chose to focus on crafting a specific user experience. Instead of making a To-Do CRUD app, I decided to make a site for assassins to keep track of their missions. I designed the site with this idea in mind and I tried to reflect the feel that a real site might have (at least for what I imagine the assassins from Assassin's Creed might want from a site like this). For example:

1. There is no description of the site or what it is used for.
2. Usernames are called "aliases."
3. There is no obvious register page.
4. If you want to register, you have to click on Connor's third knife. There is nothing that reveals this other than opening up the HTML source and finding the hidden div.
5. Failure to login simply redirects back to the homepage silently.
6. Everything is cleanly implemented, but there is a sense of shadow in the fading and the hover effects.
7. The site is a two-paged app: a landing/register/login page and a missions page. Everything is done with AJAX so that all implementation is hidden from the user.
8. The Cinzel font is close to the original Assassin's Creed font (Trajan Pro, I believe).

![login page](https://raw.githubusercontent.com/rramphal/the-brotherhood/master/public/img/readme_screenshots/login.png)
![add a mission](https://raw.githubusercontent.com/rramphal/the-brotherhood/master/public/img/readme_screenshots/add.png)
![list all missions](https://raw.githubusercontent.com/rramphal/the-brotherhood/master/public/img/readme_screenshots/list.png)
![update a mission](https://raw.githubusercontent.com/rramphal/the-brotherhood/master/public/img/readme_screenshots/update.png)
![complete a mission](https://raw.githubusercontent.com/rramphal/the-brotherhood/master/public/img/readme_screenshots/complete.png)

This was an opportunity to teach myself [SASS](http://sass-lang.com), so there might be some contrived uses of mixins and partials. It was also an opportunity to practice using [LiveReload](http://livereload.com).
