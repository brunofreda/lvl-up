# lvl_up

Welcome to the LvL Up app!

This is a fully functional gamified to do list app.

Its main inspiration was Google Tasks, an app that I use daily, but in which some functionalities
were lacking in some way for me. The features I would have loved to see in such app were mainly two:
being able to have a personal order for the tasks even when you select to sort them by date, and
being able to hide completed tasks instead of accumulating them in a separate section.

So I tried to recreate something similar to Google Tasks but incorporating these features. But then
I started thinking what else I would like to see in a to do list app. What if completing tasks could
be gamified? And from that LvL Up was born! A full fledged to do list app, which this is just a
prototype of, which would have all sorts of gamifying features. For now, the only feature of this
sort that I incorporated is that completed tasks give you points. Below there's a full list of the
features of this version of the app.

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