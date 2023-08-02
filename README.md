# lvl_up

Welcome to the LvL Up app!

This is a fully functional gamified to do list app.

Its main inspiration was Google Tasks, an app that I use daily, but which lacked some features that
I would have loved to see in such app. These features were mainly two: being able to have a personal 
order for the tasks even when you select to sort them by date, and being able to hide completed
tasks instead of accumulating them in a separate section.

So I tried to recreate something similar to Google Tasks but incorporating these features, and from
that LvL Up was born! A full fledged app which this is just a prototype of. The other feature I
incorporated, which gives sense to the name of the app, is a gamifying aspect: completed tasks give
you points!

# Features

-

# Things the full app would have

Client side

- Title logo
- Icon next to the score counter
- If the completed tasks are not set to be hidden, they are set aside in a list of their own down
  below
- Tasks with dates set to today or tomorrow would show "today" or "tomorrow" respectively instead
  of the date
- The option to add multiple tasks pages
- Events
- A calendar
- Themes
- Improving some of the graphics and transitions
- Store the data in your account, which would be synced with the webapp

Code design

- Maybe use a Map to store the tasks data instead of a List
- Make each page an instance of a class called "Page" that contains at least the AppBar
- Check which class fields (if any) are set as "required" but shouldn't be