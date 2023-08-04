# LvL Up

Welcome to the LvL Up app!

This is a fully functional to do list app with gamification features.

Its main inspiration was Google Tasks, an app that I use daily, but in which some functionalities
were lacking in some way for me. The features I would have loved to see in such app were mainly two:
being able to have a personal order for the tasks even when you select to sort them by date, and
being able to hide completed tasks instead of accumulating them in a separate section.

So I tried to recreate something similar to Google Tasks but incorporating these features. But then
I started thinking what else I would like to see in a to do list app. What if completing tasks could
be gamified? And from that LvL Up was born! A full fledged to do list app, which this is just a
prototype of, which would have all sorts of gamification features. For now, the only feature of this
sort that I incorporated is that completed tasks give you points. Below there's a full list of the
features of this version of the app.

# Features

-

# Some of the things the full app would have

Client side

- Title logo
- Icon next to the score counter
- If the completed tasks are not set to be hidden, they are set aside in a list of their own down
  below
- Multiple date formats to choose from
- Tasks with dates set to today or tomorrow would show "today" or "tomorrow" respectively instead
  of the date
- The sort by date option would subdivide the tasks in little groups corresponding to each day
- When sort by date is selected, the tasks without date would stay at the bottom of the list instead
  of on the top
- The option to add multiple tasks pages
- Events
- A calendar
- Themes
- Objectives
- Notes
- A customizable profile with gamification features, such as level of user, milestones, items, more
  themes, all of which would be related to the score and objectives set by the user
- Improving some of the graphics and transitions
- Store the data in your account, which would be synced with the webapp


Code design

- Improve the general readability of the code (right now the order of variables and methods
  coincides with the expected typical flow of usage of the app)
- Maybe use a Map to store the tasks data instead of a List
- Make each page an instance of a class called "Page" that contains at least the AppBar
- Check which class fields (if any) are set as "required" but shouldn't be