# np-interactions by Exytra

# Important:
Do not change anything in the client/main.lua you could break things.
If you want to Remove the trashcan interactions delete the trashcan.lua.

# Dependencies
In order to make the search trash to work:
https://github.com/KevinGirardx/qb-trashsearch/blob/main/config.lua

In order to make the whole interactions work: Thank you Antunes and the Karma Developer Team <3
Join Karmas discord: https://discord.gg/DNCWBd2qPH and check the #free-releases channel!


# Previews:

Trunk Interactions:
https://realshadow.lol/uploads/Xl80c/

Trashcan Interactions:
https://streamable.com/hiyudw

Searchable Dumpster Interactions:
https://realshadow.lol/uploads/fh6AV/

# Bugs / Issues
You are always able to contact me on Discord.

I am facing issues with my inventory not opening in the trunk:
Currently there is only Support for
QB-Inventory
PA-Inventory

I am facing issues in the console. It says something about a model or entity.
This can be due to a invalid model name! Check if the model you want to attach the interaction to actually exists.

Feel free to add your own Iventory support to do that head over to client > main.lua

# QnA

Q: How do I install it?
A: Place this resource somwhere after the interact resource this is important to ensure it works properly.

Q: How to I add vehicles to it?
A: Follow the code structure of the vehicles.lua it is easy.

Q: Why is the server.main executing a SQL query?
A: This query clears the Trashbin entry in your database to clear out trashcans.

Q: Why is it executing the query every 5 minutes?
A: You know you can change it :) by changing the first number.

Example: 5 * 60 * 1000 = 5 Minutes
Example: 2 * 60 * 1000 = 2 Minutes
