"Bronze" by Emily Short

The story genre is "Fairy Tale". The release number is 13. The story headline is "A fractured fairy tale". The story description is "When the seventh day comes and it is time for you to return to the castle in the forest, your sisters cling to your sleeves. 
	
'Don't go back,' they say, and 'When will we ever see you again?' But you imagine they will find consolation somewhere.
	
Your father hangs back, silent and moody. He has spent the week as far from you as possible, working until late at night. Now he speaks only to ask whether the Beast treated you 'properly.' Since he obviously has his own ideas about what must have taken place over the past few years, you do not reply beyond a shrug.
	
You breathe more easily once you're back in the forest, alone.

Bronze is a puzzle-oriented adaptation of Beauty and the Beast with an expansive geography for the inveterate explorer. 

Features help for novice players, a detailed adaptive hint system to assist players who get lost, and a number of features to make navigating a large space more pleasant." The story creation year is 2006.

Release along with [a solution,]
	source text,
	a website, 
	cover art, 
	a file of "Manual" called "Bronze Manual.pdf", 
	a file of "Complete (Spoilerful) Map" called "map.pdf", 
	a file of "Walkthrough" called "Walkthrough.txt", 
	a file of "Making of..." called "Overview.html".

Index map with room-shape set to "square" and room-size set to 60 and room-name-size set to 9 and room-name-length set to 13 and route-thickness set to 15 and room-outline set to off and map-outline set to off and route-colour set to "White" and room-colour set to "White" and font set to "Trebuchet-MS-Regular" and EPS file.

Include Singing Reloaded by Shin.

Include Locksmith by Emily Short.

Use full-length room descriptions, American dialect, and the serial comma.

Use no deprecated features.


Part 1 - Adjustments to the World Model

Chapter 1 - Modifying Existing Kinds

[Because the style of this game is one of very light implementation with a lot of rooms, there may be some objects we forget to give detailed descriptions. But we'd still rather not see the default Inform message about undescribed objects ("you see nothing special about the {whatever}"). So here we apply a more game-specific version of that answer:]

The description of a thing is usually "The appearance of [the noun] has not changed significantly since you left."  

The description of a container is usually "[The noun] [if the noun is open]contains [the list of things in the noun][end if][if the noun is closed][are] closed[end if][if the noun is locked] and locked[end if][if the noun is closed and the noun is transparent]. Inside [are] [the list of things in the noun][end if]."

Section 1 - Doors

The initial appearance of a door is usually "Nearby [an item described] leads [item described direction]." The description of a door is usually "[if open]It stands open[otherwise]It is closed[end if][if locked] and locked[otherwise] and unlocked[end if]."

To say (item - a thing) direction:
	let place be a random room;
	let the place be the other side of the item;
	if the place is visited, say "[way through the item] to [the place in lower case]";
	otherwise say "[way through the item]".

Instead of attacking a closed door: say "[The noun] reverberates but does not open."

Understand "knock on [something]" or "knock [something]" as attacking.  Understand the commands "bang" and "tap" and "rap" as "knock".

Before printing the name of an open door (called target) when looking or going: 
	if the target is a staircase, do nothing;
	otherwise say "open ".

To decide what direction is the way through (threshold - a door): 
	let far side be the other side of threshold; 
	let way be the best route from the location to the far side, using even locked doors; 
	if way is a direction, decide on the way; 
	decide on inside.

Instead of looking under something which is carried by the player:
	say "Since you are holding [the noun], it stands to reason that nothing of interest could be concealed beneath."
	
Instead of looking under something which is worn by the player:
	say "Underneath there is only yourself."
	
Instead of looking under a door:
	say "[The noun] meets the floor with very little space to spare."
	
Section 2 - Smells
 
A thing has some text called scent. The scent of a thing is usually "nothing".

The report smelling rule is not listed in any rulebook.

Carry out smelling something:
	say "From [the noun] you smell [scent of the noun]."
	
Instead of smelling a room:
	if a scented thing can be touched by the player, say "You smell [the list of scented things which can be touched by the player].";
	otherwise say "The place is blissfully odorless."
	
Definition: a thing is scented if the scent of it is not "nothing".

Before printing the name of something scented while smelling a room: say "[scent] from the "

Section 3 - Sounds

A thing has some text called sound. The sound of a thing is usually "silence".

The report listening rule is not listed in any rulebook.

Carry out listening to something:
	if in darkness, say "The [sound of the noun] sounds like [a noun].";
	otherwise say "From [the noun] you hear [the sound of the noun]."

Definition: a thing is audible if the sound of it is not "silence".

Echolocating is an activity.

Before printing the name of something audible (called target) while echolocating:
	if the target is not the player, say "[sound] from [if the target is not the player]the [end if]" 
	
Rule for printing the name of the player while echolocating:
	if the player is not audible, say "yourself";
	otherwise say "your own [sound of the player]"

Rule for printing the name of something (called target) which is not visible while echolocating: 
	say "[roman type]";
	if the target is the player:
		say "yourself";
		rule succeeds;
	let place be the holder of the target;
	let way be the best route from the location to the place;
	if way is a direction, say "[way]"; 
	otherwise say "[if the target is in location]immediate vicinity[otherwise]middle distance[end if]".
 

Chapter 2 - New Kinds

A display is a kind of thing. A display is always scenery. [* A kind mostly used for the paintings, with special behavior to handle what happens when the player tries to look behind one.]

A reminder is a kind of thing. A reminder has some text called a memory. Carry out examining an unexamined reminder: say "[memory of the noun][paragraph break]You reacquaint yourself with its appearance: [run paragraph on]".

A floor is a kind of thing. Before putting something on a floor: try dropping the noun instead. Before facing down in the presence of a floor (called target): try examining the target instead. A floor is always scenery. Instead of looking under a floor: say "Nice idea if you can figure out how." Understand "floor" or "ground" as a floor.
	 
Some generic surroundings are backdrop. It is everywhere. Understand "walls" or "wall" or "ceiling" or "ground" or "area" or "room" or "here" as the generic surroundings. Understand "floor" or "floorboard" or "floorboards" as the generic surroundings when the location is not floored. Before putting something on the generic surroundings: try dropping the noun instead. Instead of examining the generic surroundings: say "You take another look around."; try looking. Instead of touching the generic surroundings: say "You encounter nothing extraordinary." Instead of touching the generic surroundings when in darkness: say "You try feeling your way around, but the space you are in is too large to allow you to navigate by touch."

Definition: a room is floored if it contains a floor.

After deciding the scope of the player: 
	place the generic surroundings in scope;
	repeat with item running through handled things in the location
	begin;
		place item in scope;
	end repeat;
	if the location contains a floor (called the current floor), place the current floor in scope.

Before touching a direction, try touching the generic surroundings instead. Before pushing or pulling a direction, try pushing the generic surroundings instead. Instead of smelling the generic surroundings, try smelling the location. Instead of listening to the generic surroundings, try listening to the location.

Rule for supplying a missing noun while searching:
	now the noun is the generic surroundings.
	
Instead of searching the generic surroundings: try hinting roomily about the location. Instead of hinting about the generic surroundings: try hinting roomily about the location.
	
Understand "search" as searching.

A bed is a kind of supporter. A bed is always enterable. A bed is usually scenery. The description of a bed is usually "Unrumpled: the service keeps them neat and tidy." Understand "sheets" or "sheet" or "pillow" or "pillows" as the bed. Instead of looking under a bed, say "It is clean beneath as above." The scent of a bed is "faint lavender".

A view is a kind of backdrop. The view has some text called refusal. The refusal of a view is usually "You are too far from [the noun] to do anything but look." 

Instead of doing something other than examining to a view:
	if listening to the noun and the noun is audible, continue the action;
	if smelling the noun and the noun is scented, continue the action;
	say "[refusal of the noun]".

A staircase is a kind of door. A staircase is usually open. A staircase is seldom openable. Understand "stairs" or "stair" or "staircase" as a staircase. Understand "upstairs" or "downstairs" as a staircase. The description of a staircase is usually "[The item described] leads [item described direction]."

Instead of climbing a staircase:
	try entering the noun. 
	
Understand the commands "ascend" and "descend" as "climb". Understand "go down [staircase]" as climbing. Understand "go up [staircase]" as climbing.

A fluid container is a kind of thing. A fluid container can be empty or full. After printing the name of a full fluid container while listing contents: say " (full)". After printing the name of an empty fluid container while listing contents: say " (empty)".

A ringer is a kind of thing. A ringer has an object called the target locale.
	


Instead of attacking a ringer:
	say "The clapper is resentfully mute. The servants have fulfilled their contract for the day, and cannot be commanded again until tomorrow comes."
	
Instead of attacking a ringer when location is not the target locale of the noun:
	if the noun is the gong, continue the action;
	if the player can see the mirrors, continue the action;
	say "You ring the bell, but those who might hear and heed it are not close enough."
	
Instead of attacking the tambourine when the location is not the target locale of the noun:
	if the player can see the mirrors, continue the action;
	say "You strike the tambourine, but the shoemaker doesn't materialize[if Lucrezia's study is visited]. And now you think about it, didn't that image in Lucrezia's study show where she was being fitted? Hm[end if]."

Part 2 - The World

Instead of examining the player: 
	now the player is examined;
	say "You are nontrivially the worse for your journey -- hungry, dirty, and tired. But all that can be seen to later[if the player wears something]. You are wearing [a list of things worn by the player][end if]."

Instead of rubbing the player: say "There will be time to clean up later, when the situation here is not so dire."

Instead of searching the player, try taking inventory.

Chapter 1 - Outside the Castle

The Drawbridge is a room. "[if the Drawbridge is unvisited]Even in your short absence, [the castle] has come to look strange to you again. When you came here first, you stood a long while on the drawbridge, unready to cross [the moat], for fear of the spells that might bind you if you did. This time it is too late to worry about such things[end if][if the Drawbridge is visited]There is little enough purpose in loitering outside: He and his servants never come out here, and whatever you must do, you will have to do within[end if]." The castle exterior is scenery in the drawbridge. The printed name of the castle exterior is "castle". Understand "tower" or "tower" or "drawbridge" or "bridge" as the castle exterior. The description is "The drawbridge looks longer than it actually is; the towers are so high that the tops are lost in cloud, and looking east or west, you cannot see the furthest extent of the walls. An optical illusion: it is smaller inside.

Probably."

The iron-barred gate is a door.  "An iron-barred gate leads [gate direction]." It is north of the Drawbridge and south of the Entrance Hall. It is closed and openable. Before entering the castle, try entering the gate instead. Before going inside in the Drawbridge, try going north instead. Understand "door" as the gate.

After opening the gate:
	say "You shouldn't be able to open it, heavy as it is, but it swings aside lightly at your touch. The Beast said that it knows friend from enemy; and the castle, at least, still regards you as friend."

The description of the Entrance Hall is "There is no fire in the big [fireplace][if the Entrance Hall is unvisited], and no one is waiting for you here[end if]; the air is very cold. Over the gate, the old familiar [warning sign] is painted.

Various passages lead deeper into the castle: north towards the central courtyard, southwest to the guard tower, east and west into the libraries, the offices, the galleries. [if beast is seen]And no wonder he was not here to meet you.[otherwise]Somewhere in this maze, he waits; and he should be told as soon as possible that you did return.[end if]"

Before going outside in the Entrance Hall, try going south instead.

The fireplace is scenery in the Entrance Hall. The description is "Unlit, vacant[if Search is happening]. It is almost as though you are not expected[end if]." The sound of the fireplace is "whistling wind". Understand "fire" or "whistling" or "wind" as the fireplace. Instead of burning the fireplace: say "There is no fuel prepared for a fire."

The warning sign is scenery in the Entrance Hall. The description of the warning sign is "You know the words by heart, having heard them first from your father, and then studied them yourself on many more recent occasions." The printing of the sign is "Those who seek to leave the castle depart at peril of their lives and souls, unless another servant be provided in exchange, or a fixed term of absence be granted by their master." Understand "old" or "familiar" as the sign.

Chapter 2 - East Wing

The Scarlet Gallery is east of the Entrance Hall.  

The description of the Scarlet Gallery is "You do not often come this way, into the older part of the castle, which is narrow and has a low roof. The walls, and the ceiling too, are deep scarlet, the color of the old king and queen that ruled here two hundred fifty years ago, when there was still a kingdom."  

The Scarlet Tower is southeast of the Scarlet Gallery. "A little hexagonal room, from whose [narrow window] you can see the moat, the lawn, and the beginning of the forest outside." The narrow window is scenery in the Scarlet Tower. The outdoors is scenery in the Scarlet Tower. Understand "moat" and "lawn" and "forest" as the outdoors. The description of the outdoors is "Beyond a short stretch of clear ground, the forest grows thick and uninhabited for many miles." Instead of searching the narrow window, try examining the outdoors. The description of the narrow window is "It gives a view of the forest beyond: the way you came from, in fact."

The helmet is a wearable thing in the Scarlet Tower. "On the windowsill, [a helmet] waits, for the use of the sentry." Understand "very old helmet" or "writing" or "helm" or "lines" or "lines of writing" as the helmet. The description of the helmet is "A very old helmet that you have seen the Beast wear (and quite foolish it looked, perched on a head it no longer fits: it would suit your head better). He told you once that the helmet was for night watchmen, scouts, and guards, to increase their vigilance and strengthen their hearing." The printing of the helmet is "I call upon you, I summon you, I bind you, daemon of the small bone of the left ear: make my hearing strong. I call upon, summon, and bind you, daemon of the small bone of the right ear: make my hearing stronger yet. 

I call upon, I summon, I bind you, daemon of air-that-moves, carry sound swiftly to my ears. I call upon, summon, bind you, daemon of earth-that-shakes, relay noises rapidly to me. 

If you daemons do not do this, I will bind you under the earth in darkness and make the worms to crawl upon your head." [* Originally I just had the description, but so many players wanted to know what exactly the helmet said that I introduced a separate text and distinguished READ from EXAMINE. The text itself owes a thing or two to John Gager's work in Curse Tablets and Binding Spells of the Ancient World.]

Carry out wearing the helmet:
	repeat with item running through people
	begin;
		now the sound of the item is "steady breathing";
	end repeat.
	
Carry out taking off the helmet:
	repeat with item running through people
	begin;
		now the sound of the item is "silence";
	end repeat.

After wearing the helmet: 
	say "You settle the helmet over your head, and there is a roaring in your ears at first[if the player can touch the rain], both from your heartbeat and from the raindrops on metal[end if]. But then the sharpened hearing begins to feel natural again." 
	
After taking off the helmet: say "You lift the helmet from your head, and the sudden quiet feels like going deaf."

Before listening to something when the player wears the helmet:
	say "Even your own breathing is magnified when you wear the helmet, so you must concentrate past it..."

Understand "breathing" as yourself when the player wears the helmet.

Understand "hold breath" or "hold my breath" as a mistake ("You briefly hold your breath, but this doesn't allow you to hear anything you couldn't already, really, so you resume breathing normally.").

The Gallery of Historical Paintings is east of the Scarlet Gallery. "Here on the north wall and the south are paintings of historical events from times past: the [assassination of King Elzibad] in 1248; the [arrival of Princess Lucrezia] from the Italian State of Medici-Credenza in 1545.

The gallery goes on, echoing, both east and west." The assassination of King Elzibad is a display in the Gallery of Historical Paintings. The description is "You see his pointy-slippered attendants wringing their hands, his wife wiping her eyes on an ermine muff, peasants grieving. 

Of Elzibad himself, there is only a pair of blackened feet, sticking out from under the elephant." Understand "assassination" or "portraits" or "portrait" or "elephant" or "painting" or "paintings" or "picture" or "pictures" or "art" or "artwork" as king elzibad.

Understand "look behind [something]" as looking under. Instead of looking under a display: say "Bare wall; nothing else." 

The  arrival of Princess Lucrezia is a display in the Gallery of Historical Paintings. The description is "Lucrezia wears silk the pale blue of the morning sky, and her eyes are little currants of malice." Understand "portraits" or "portrait" or "painting" or "paintings" or "picture" or "pictures" or "art" or "artwork"  as arrival of princess Lucrezia.

The Treasure Room is northeast of the Scarlet Gallery. "[if the iron cage is locked]Locked[otherwise]Kept[end if] in [an iron cage] are the house treasures not in use: the collection consists of [a list of things in the iron cage], at present[if something is in the cage] -- he showed them to you one rainy day, telling you their many histories[end if]." 

The iron cage is an enterable closed openable container in the Treasure Room. The cage is scenery. It is lockable and locked. It is transparent. Understand "bars" or "metal" or "broad" or "strap-like" or "bars of metal" or "marks" or "treasures" or "treasure" or "house treasures" as the cage. The description is "Made of broad strap-like bars of metal, as thick as a man's belt, and heavily reinforced. Here and there are marks where someone would seem to have made an attempt to break in[if the cage contains something]. In the cage [is-are the list of things in the cage][end if]."

In the cage is a sceptre and a jagged piece. The sceptre is a reminder. The description of the sceptre is "Studded with measly turquoises and semi-precious stones." The memory of the sceptre is "Formerly belonging to Queen Ingratitudina the First (so he said), only slightly bent where she used it to strike King Cophetua." The printed name of the jagged piece is "puzzle piece". Understand "puzzle piece" as the jagged piece.

Understand "scepter" as the sceptre. The description of the jagged piece is "Something shiny has been painted on the piece."

The pair of cloven shoes is a thing in the iron cage. The description is "Made for something with cloven hoofs[if the shoes are wearable], but so large that you could wear them as a kind of awkward sandal[end if]. They bear evidence of having been adjusted to their current size by a shoemaker, and perhaps (therefore) could be again." Instead of wearing the shoes when the shoes are not wearable: say "They emphatically do not fit. You will have to find someone to adjust them, evidently." After wearing the shoes: say "You slip your feet into the shoes, and feel less alone. Mere sentiment, you think; but then there is the brush of a thought other than your own. [italic type]The crypt. Under the Law Library. There are sources of power there which even I have never understood[roman type]." The pair of shoes is ambiguously plural. [* 'Ambiguously plural' is defined in the Plurality extension, and it applies to items that the player might equally call 'it' (as a pair of shoes is an it) or 'them' (as shoes generically are them). This causes both pronouns to be updated.]

Understand the command "adjust" as something new. Understand "adjust [something]" as fitting. Fitting is an action applying to one thing. Carry out fitting something: say "There's no useful way for you to adjust [the noun]."

Instead of fitting the shoes, say "You need a skilled shoemaker for this job." Instead of fitting the helmet, say "An armorer you are not, but fortunately none is needed." Instead of fitting a wearable thing, say "You've never considered yourself an expert at fitting any kind of clothing."

The Maze Room is east of the Gallery of Historical Paintings. The description of the Maze Room is "A [labyrinth] of black and white, like that of cathedrals, as protection against the spite of the undead: which protection might often have been needed, by those that dwelt here in former times. The way down is at the center of the maze." The printed name of the Maze Room is "Room with the Labyrinth Floor". 

The labyrinth is a floor in the maze room. Understand "maze" or "mosaic" or  "tiles" or "tiled" as the labyrinth. Understand "floor" as the labyrinth when the location is the Maze Room. The description of the labyrinth is "The maze doesn't look uncrossable by you. You step forward and look down into the room below[if the candle is in the Bear Corridor], and get the dim impression of light and carved animals[otherwise], but it is too dark to see much[end if]." The printed name of the labyrinth is "mosaic floor". Instead of solving the maze, say "It is not a difficult maze at all: a simple inward spiral with a few doublings-back. Spirits must be exceptionally unintelligent." Before entering the labyrinth, try going down instead.

The Bear Corridor is below the Maze. The Corridor is dark. "Less couth and cultivated than any other part of the castle, and you have been forbidden to visit this place before now. The walls press close to you on either side. The floor slopes down. Bears with sharp claws are carved into the rock, but they remind you of Him, and you are not frightened." The carved bears are scenery in the bear corridor. Understand "bear" as the carved bears. The description of the bears is "Almost a ceremonial bear procession, if bears had liturgies and rituals." Instead of going down in Bear Corridor, try going northwest.

The Zoo is northwest of the Bear Corridor. The Zoo is dark. "A resting place for an animal: warm but rough. There is little to suggest, from this environment, that he thinks of himself as a man at all, though he is capable of walking upright and eating with utensils, of reading books and even of writing a legible hand. 

The only distinguishing mark is [a miniature] hung on the wall, like a devotional object, or perhaps a reminder[if the royal portrait is seen]. Something about the sole image in an otherwise bare room reminds you of the royal portrait in the Green Bedroom[end if]." 

The miniature is scenery in the Zoo. The description is "The tiny image of a lady in a green girdle. But it isn't Lucrezia." Instead of taking or pushing or pulling or turning the miniature: say "It fails to move even a little, but clings to its place tenaciously -- in the way you associate with the stone gargoyle, upstairs."

The poison vial is a reminder in the Zoo. The description is "It has mostly dried up now; the apothecary who sold it to you did not say anything about whether it would keep its efficacy for long." The memory of the poison vial is "You brought it with you; he confiscated it the first night.

'It was a good thought,' he said, plucking it from your fingers with a delicacy that should be impossible in one his size. 'But if I could be killed by poison -- or by violence, or starving, or leaping from towers, by drowning or by suffocation or by fire, I assure you, I would have found the way by now. That leaves only yourself as a victim, and I did not bring you here to die.' And so you didn't."

Instead of hinting about a reminder, say "[memory of the noun]

But it is only a token of things past, for which you can come up with no present use."

Instead of eating or drinking the poison vial, say "That urge, if you ever had it, is gone."

Chapter 3 - Center

The Central Courtyard is north of the Entrance Hall. "Open to a grey sky, from which a light [rain] falls. You have never seen the courtyard otherwise: it rains in every season, winter or summer, no matter what lies beyond the moat.

[if the Courtyard is unvisited]It was here that you first laid eyes on the Beast: emerging from the State Rooms, snarling. He seemed angry at you for coming, even though you had had no choice. Or perhaps (you thought) he was simply violent. You did not run.

[end if]The castle proper opens both north and south, and to the east a helical [staircase view] ascends to the roof."

The staircase view is a view in the Courtyard. The description is "A handsome staircase designed by an Italian engineer in the 16th century." The printed name of staircase view is "staircase".

Instead of facing east in the Courtyard, try examining the staircase view.

The Ground Floor Helical Staircase is east of the Courtyard. "The [steps] rise from here towards the upper rooms, and open out onto the bare courtyard." [The courtyard view is a view in the Ground Floor. Understand "bare" as the courtyard view. The description is "[if something is in the courtyard]You can see that some things have been left there, but would have to go closer to look at them[otherwise]It's pretty empty, all right[end if]." The printed name of the courtyard view is "courtyard".]

The obscene gargoyle is a reminder in the Ground Floor Helical Staircase. It is fixed in place. "An [obscene gargoyle] sits where the finial of the banister should be." The description is "Not too large, but stunningly ugly: a stone about the size of an apple, carved into a monster with outsized ears and eyes -- not to mention outsized attributes elsewhere." The memory of the obscene gargoyle is "He came up while you were bent over the gargoyle, trying to lift it. 'Taking that back to your room?' he asked slyly. 'It won't work, but if you're lacking companionship I could find an appropriate servant to see to your needs.'

You felt yourself blush. 'It's ugly,' you said. 'I wanted to move it.'

'Oh. You can't.' He frowned at it. 'It is a remnant, left here by an angry soul who managed to take some revenge despite his enslavement. There are a few others around, mostly in the crypt. They're immovable, but harmless.'" Instead of taking or pushing or pulling or turning the gargoyle: say "It still doesn't budge, and -- you rather think -- it never will."

The Upstairs Helical Staircase is above the steps. "[if the location is unvisited]In this spot, you fell and almost broke your leg -- or some other more valuable part of you -- except that He caught you.

But you are alone now, and therefore cautious[otherwise]A dizzying prospect, the spiral of [steps] down to the ground[end if]."

Some steps are above Ground Floor Helical Staircase. The steps are scenery. Understand "banister" as the steps. The steps are a staircase. The description of the steps is "Too narrow for comfort near the axis; too broad for speed, along the outer edge; and at the center, where they have just the right breadth, they have been worn down by the passage of hundreds of feet, and made almost into a ramp."

Chapter 4 - State Rooms

Instead of going to a room which is in the State Rooms when the windchimes are in the Rose Garden:
	now the windchimes are seen;
	say "You find your way blocked by a phantom guard. Somewhere nearby you hear chimes.
	
As soon as you back up, he disperses into smoke again." 

Instead of going to a room which is in the State Rooms when the windchimes are in the Rose Garden for the second time:
	say "Again the sound of chimes, and the phantom guard that blocks your path. Somewhere there must be a ringer summoning him, protecting the State Rooms.
	
You have never known the Beast to put up guards before. It has always been enough for him to guard the rooms himself."

Instead of going to a room which is in the State Rooms when the windchimes are in the Rose Garden for the third time:
	say "The chime summons the phantom guard again, preventing you from making any progress[if the Rose Garden is not visited]. If you cannot find and silence it, you will not be able to get into the State Rooms; it must be around somewhere[end if]."

Section 1 - Rotunda

The State Rotunda is northeast of the Law Library. It is north of the Courtyard. "Built for the bureaucratic offices of the palace. Inlaid in the floor is the [map] of all the lands that once this palace commanded[if the candle is in location]: you have set up a candle in its accustomed place to shed light over the map[otherwise]; and from the stains and driblets of wax, it is clear to you that someone at some time thought it useful to set a candle at the map's center, and observe the result[end if]." 

The map is a floor in the State Rotunda. Understand "emirate" and "malta" and "essex" and "argos" and "writing" as the map. The description is "Since the lands of the Kingdom were once quite dispersed the cartographer has, from indolence, fancy, or an urge to flatter, omitted all the territories that intervened, so that here floating in a cherry-wood sea are the State of Medici-Credenza; the Emirate of Elzibad; the Equine Protectorate of Argos; a goodly portion of Essex; and Malta, the only true island of the lot[if the candle is in the location]. Of these, the candle's light glows with particular strength only in Italy and Malta; it seems that the power of the Kingdom has waned a good deal[end if]." The printing of the map is "Here there be Daemons." [* Originally the map was ordinary scenery and the candle had no effect on it, but one or two testers got stuck not realizing that the summoned candle was portable. This seemed like a way to nudge players to try moving the candle -- and perhaps then to make the leap that they could also take it down into the dark rooms.]

Before putting something on the map: try dropping the noun instead.

Instead of reading the map when the candle is not in the Rotunda:
	say "There is writing around the map's edge, not legible in this light."

The Lower Bulb is west of the State Rotunda. It is north of the Law Library. "[if the Upper Bulb is not visited]In this very tall room, like a silo, is a glass of running sand: not an hourglass, or even a dayglass, but a timer whose duration you do not know. A whole Sahara has poured into its lower chamber, but the trickle from above continues, very fine[otherwise]In the lower chamber, you find, there is almost as much sand as there is above; it must have been flowing a very long time[end if].

Around the outside of this contraption ascends a wooden staircase."

The wooden staircase is a staircase. It is above the Lower Bulb and below the Upper Bulb. It is scenery. The description is "Grown somewhat rickety with age."

The description of the Upper Bulb is "[if the Lower Bulb is not visited]In this very tall room, like a silo, is a glass of running sand: not an hourglass, or even a dayglass, but a timer whose duration you do not know. A whole Sahara remains in its upper chamber, but it is running steadily down into the room below you[otherwise]In the upper chamber, you find, there is almost as much sand as there is below; indeed for all you can tell the flow might be eternal[end if]." The sand is a view. It is in the Lower Bulb and the Upper Bulb . The sound of the sand is "dry trickling". Understand "hourglass" or "dayglass" or "bulb" or "glass" or "timer" as the sand. The description is "[if the location is regionally in the Hourglass]No human glassblower could have made this thing, that much is certain[otherwise]No more than a sporadic sprinkle from above[end if]."

Instead of wearing the helmet in the Hourglass:
	say "The roar is so loud that you cannot bear it: this cannot be the flow of sand magnified. It is more as though you are hearing the rumbling destruction caused by the passage of time; in any case, you take the helmet off again, to save your hearing."
	
The ivory door is southwest of the Upper Bulb. The Smoke-Damaged Chamber is southwest of the ivory door. The description is "Though not actually burnt, the walls are stained with smoke, especially at the south end. This mess has partly obliterated what was once a detailed [mural] on the west wall."
 
The mural is scenery in Smoke-Damaged Chamber. The description is "Though some of the detail is gone, the mural shows the path through the forest to the castle. At the castle gate, a smiling king with horns has just finished laying down a trail of silver coins leading into his domain; at the other end of the path, a crowd of astonished and eager peasants is collecting them. 

It is clear enough that in a few minutes they will get to the drawbridge and all be enslaved." Understand "king" and "horns" and "path" and "forest" and "Castle" and "gate" and "silver" and "coins" and "domain" and "crowd" and "peasants" as the mural.

The Burnt Frame is south of the Smoke-Damaged Chamber. "A corner tower severely damaged by fire, so that there is only [framework] between you and the sky." The framework is scenery in Burnt Frame. The scent of the framework is "old smoke". The description of the framework is "A conical roof, stripped down to the skeleton." Understand "conical" and "roof" and "skeleton" as the framework.
	
Section 2 - Records Room and History

The Records Room is west of the Upper Bulb. "Where all the [papers] and histories are kept, not only for the royal family, but for kin in every kind and direction." Understand "record room" as the records room.

The papers are scenery in the Records Room. Understand "histories" or "history" or "records" or "record" as the papers. The description is "Neatly filed: he told you he'd spent twenty years or so on them, having no other way to occupy his time. Anything you wanted to look up, you should be able to discover easily."

Instead of consulting the papers about a topic listed in the Table of History: 
	say "[reply entry][paragraph break]".

Table of History
topic	reply
"ink/inkpot"	"You rifle through the papers for some discussion of Lucrezia's inkpot, but can find no explanation of its purpose or present whereabouts."
"doctor/Cantherius/duke/gargoyle/gargoyles/impotence" or "duke Cantherius"	"Among the records there is a large section on the various failed romantic business of the kings and queens and their brothers and sisters, so that you might almost suspect this to be part of the castle's curse. 

In this collection, you find the history of Duke Cantherius: married at 59 to a lissome wife of 17, he 'urgently desired to enjoy her company', but found himself unable. He consulted a young Parisian doctor, who contracted that through his services the Duchess would be delivered of a child within the year.

Alas, medicine brought no relief; not even that most reliable method, an ointment of honey, crow's egg, and the gall of an electric eel. The Duchess began to hint that she meant to have the marriage annulled; the Duke grew abusive. Seeing no solution through medical arts, the doctor was compelled by his contract to seduce the Duchess. 

When the young woman was delivered of triplets, the Duke kept two of the boys and raised them as his own; the third he strangled, together with the doctor himself, as a punishment to his erring wife.

Whereupon the ugly gargoyle appeared on the stair, and could never be budged."
"yvette/girdle"	"It takes some searching, but you find it eventually. The king in these parts was accustomed to bring young ladies to the castle when his wooing of them was unsuccessful, whereupon they were under contract and unable to resist him. 

This he did for many years, snatching away men's brides; until one day he stole Yvette. She was only a humble milkmaid, but so beautiful she was betrothed to a lord, etc., etc., and moreover her great-great-grandmother had been Lucrezia the Enchantress (oh dear), so she possessed a magical girdle of surpassing power. 

When she discovered what was about to happen to her, while she was still on the drawbridge of the castle, she cursed the king to become a mere beast, so that the spell would never be lifted until someone loved him who was not under magical contract. What was more, this person would need the power of that same magical girdle...

There is even a small woodcut of the grieving Yvette, carrying a [cow bell] and looking downtrodden."
"me/myself"	"You are the merest interloper here."
"crypt"	"About the crypt and burial grounds, the records are elliptical. It does not seem that they can contain the physical remains of everyone who has been associated with or enslaved to the castle, but it seems that they do have some hold over the most important, the most wretched, or the most dangerous of the castle's affiliated spirits."
"him/beast/king"	"You have never known his true name, and can only guess that he must be the last of the line of kings."
"elephant/elzibad/demon/djinn"	"An entertaining story tells how Elzibad, worse than all the other kings of this palace that had previously been seen, was defeated by one of his own demons in elephant form, when someone who was not contracted to him gained command of the demon. Command of his slaves then passed to his son.

From that day on the castle was so built that no one could even enter into it without becoming contracted to its king, for the protection of the royal family."
"pen/quill/mephistopheles/athanasius/devil/satan/lucifer"	"A very old scroll narrates how King Athanasius, first of his line, entered a wager with Mephistopheles, and won the pen that the Devil used to sign contracts for men's souls.

The King retired to this castle, overjoyed with his success, but the Devil flew away laughing."
"ingratitudina/cophetua"	"You had long suspected that he made that whole tale up, to distract you from the gloom of an especially lonely day. But no, here it is: Ingratitudina the First, so named by her mother-in-law, after King Cophetua married her and brought her to the castle."
"lucrezia/medici-credenza/treasures"	"You quickly skim the unpleasant history of Lucrezia of Medici-Credenza, how she brought odd magical treasures with her, introduced new methods of binding and contracting that were previously unknown even to this castle, and maintained a room for her studies in the basement below the rose garden. From this room everyone including her husband was banned.

There are some suggestions that she was the daughter of the Devil himself, sent to the castle to tempt the kings into further folly and destruction. But who knows?"
"roses/rose/garden" or "rose garden"	"The roses, according to record, were planted from a cutting brought by Lucrezia herself, and are the variety that grow in her father's palace. Wherever that might be."
"Yggdram"	"Of King Yggdram the Piscine, there remain only many hundreds of lines of scurrilous verse, hinting but never quite daring to specify the true nature of his particular perversion."

The Parliamentary Chambers are east of the State Rotunda. "Despite its grand name, this is one of the smaller chambers of the castle, because the kings were never inclined to brook too much advice. On each side of the room are two neat [oak benches], seating for perhaps thirty men -- and, more rarely, women, and a few characters who could not be called by either term." Some oak benches are enterable supporters in the Parliamentary Chambers. The benches are scenery. Understand "bench" as the benches.

Section 3 - The Law Library and Contract Book

The Law Library is north of the Great Dining Hall. "Many [books of precedent] line these walls, containing every kind of contract that can be made to bind every kind of soul.

A hole in the floor descends to the other, less savory portion of this place." Some books are scenery in the Law Library. Understand "shelves" and "books" and "contracts" as the books. The description is "It is not as though you would understand the language in which they are written." The great contract book is a thing in the Law Library. Understand "contracts" as the contract book. The description of the great contract book is "A book many thousands of pages long, and on each page is a name, a birthdate, a term of service, all the contracts that bind the castle's ghosts and servitors and Powers: ostlers and fighting-men, bishops and whores."

The books of precedent are scenery in the law library. The description is "There are too many for you to read even if you took a long time at it, and most are written in unfamiliar languages."

Instead of attacking or cutting the contract book:
	say "It proves most resistant to any physical assault.
	
Stands to reason it wouldn't be that easy, of course."

Instead of burning the contract book when the player carries the candle:
	say "You hold the candle to the book; the flame licks the pages cheerily and gleams on the gilding of the marginal illuminations -- some of those early contracts are quite fancy. But the fire does not harm the parchment at all, or even darken it."

Instead of consulting the great contract book about a topic listed in the Table of Contracts List:
	if the player is not in the Translation Room, continue the action;
	if the player cannot see the candle, continue the action; 
	say "[reply entry][paragraph break]".

After printing the name of a ringer (called target): 
	if the target is in Storage-Box:
		if the number of ringers in Storage-Box is greater than 3 and the Bellroom is visited:
			say " (come to think of it, haven't you seen that...?)";
		move the target to the Bellroom;

Table of Contracts List
topic	reply
"steward/pullcord/cord"	"The contract you uncover here is written in such a technical language of necromancy and chthonic ritual that you cannot uncover the gist of it, but describes a steward of special guarding powers, owing a debt to Lucrezia and not necessarily to the others of her house."
"shoemaker/cobbler/tambourine/shoes/shoe" or "leather tambourine"	"You find a contract for a shoemaker: longer than the average contract, because it seems to have enslaved the man almost without limit, to serve Lucrezia's constant need: she had very very bad feet. [if the image is unexamined]To your irritation, it omits a description of the shoemaker's summons; but perhaps if you could find more about the woman, there would be some mention of the matter[otherwise]It omits the usual information about the summons and the usual location of action, but the image in Lucrezia's study is more helpful -- perhaps, again, an intentional precaution on her part[end if]."
"library/librarian/glass" or "glass bell"	"The contract records that the librarian -- a relatively recent innovation at the castle -- is controlled by a [glass bell]. "
"lamplighter/silver/bell/silver" or "silver bell"	"To live as a thin spirit, having no volition, and lighting the lamps whenever the silver bell is rung."
"me/myself/self" or "my contract"	"You search, search, search -- and here is the page with your name at the top. But the contract below, which stipulates your eternal imprisonment here, has been amended with a permission to leave and return within seven days. Then: 'Guarantor of this exchange: the king of the castle and all his rights and servants.' Which means that if you had not returned, the Beast would have been forfeit and all the servants as well."
"father/papa/dad/daddy/shackle/shackles" or "my father"	"Your father's contract is just before your own: a lifetime (and deathtime) of service in this castle, as the immediate result of setting foot herein. From comparison to some of the other contracts, you see that it would have been easy service indeed, no manual labor but only companionship to the king, and no command-bell to make him come or go.

But the contract has been amended in a small neat hand that says: 'Voided in voluntary exchange for his daughter's service.' That would be where you come in. And: 'Guarantor of this exchange: the king of the castle and all his rights and servants.'"
"beast/him/king"	"Even if you knew his name, he wouldn't be listed here, of course. The master is not contracted, only the servants."
"virgins/maidens/maiden/virgin"	"Here you are: two thousand virgins, contracted to sew and hem and embroider until the end of time. This would certainly account for the quantity of bed-linen to be found in the castle."
"Lucrezia"	"The mistress is not contracted, only the servants. She had no contract, while she lived, and was allowed, therefore, to die."
"Elzibad/Yggdram/Athanasius"	"The kings you will not find contracted here, though there might be some history in the papers of the records room."
"chef/chefs/cooks/cook" or "gold dinner bell" or "gold bell" or "gold"	"Dozens of cooks were placed under contract, at different times, new ones being brought on as the old ones were unable to keep up with the current fashions in cuisine; and these are controlled in turn by the gold dinner bell."
"bishop/bishops"	"You find just one bishop, actually -- men of the church having been, on the whole, more wary than the average person about coming into any contact with this castle and its inhabitants. He appears to have been an Ethiopian, and the terms of his service abstruse and theological. A backhanded attempt to save one or two of the royal souls, perhaps."
"ostler/ostlers"	"To judge by this, the castle once had many hundreds of horses. No way of guessing what they do now, the horses having passed a plain animal lifespan and died."
"whore/whores/prostitute/prostitutes"	"Well. This explains the dreams one has in certain bedrooms."
"fighting-men/fighters/knights/knight/fighter/fighting-man/chimes/windchimes" or "fighting man/men"	"The windchimes bind the usual array of guards and armsmen; from the large number so bound, and the terms of the contracts, you get the sense that even the undead are not entirely proof against destruction in battle, so that new ones had to be taken on with great frequency."
"worked bronze gong" or "bronze gong" or "worked gong" or "gong" or "harness" or "elephant harness" or "elephant"	"A [worked bronze gong], according to this, controls a shape-shifting djinn of considerable size and destructive power, which resents the terms of its enslavement and would be overjoyed to take revenge. 

This djinn has taken many forms in the past, but most frequently disguises itself as an elephant. "
"gamesman/chess/chessplayer/player"	"You search for the spirit that plays chess, but find nothing. It must have been recorded under a proper name, but you do not know what that might be."
"miniature/girdle/Yvette" or "green girdle"	"With some effort, you find the contract, which turns to be one of a large number of contracts involving young women. These all occur towards the end of the book, shortly before your own.

In fact, this is the very last contract recorded before your father's and yours: a young woman named Yvette, brought to the castle -- though she was betrothed to a lord already -- to 'serve' the king. You have the impression that the contract book is leaving out a good deal, such as why Yvette was associated with the girdle, and what she was doing here. Perhaps in the papers there will be something."
"gargoyle/gargoyles/doctor"	"After some researches you succeed in finding a reference, to a young doctor who was contracted to the castle to relieve the impotence of the king's brother, Duke Cantherius."
"Duke Cantherius" or "duke/Cantherius"	"The Duke was not under contract, being a member of the king's own family."

Understand "consult" or "look up" or "read" as "[search term]".

After reading a command:
	if the player's command includes "[search term]":
		while the player's command includes "the":
			cut the matched text;

Instead of consulting or examining the great contract book when the player is not in the Translation Room: 
	say "The runes are unfamiliar to you, but you know what the book is: a record of all the contracts of all the souls enslaved to the king of this castle[if the contract book is unexamined].

You caught him staring at you once. 'Your clothing is wearing out. I'll look up a seamstress in the contract book for you.'

You plucked the erring sleeve back into place. 'You needn't,' you said. 'I don't mind.'

'Yes, but I do,' he snapped. 'I was once a -- the polite term would be a connoisseur of ladies -- and it is not a taste that goes away. So for everyone's sanity it would be best if you went about fully clothed.'

You avoided him for three days, after that incident. But your gowns were all replaced[end if].";
	now the contract book is examined;

Instead of consulting or examining the great contract book when the location is the Translation Room and the player cannot see the candle:
	say "You lean close to the pages, squinting at their probably-more-comprehensible lettering, but still cannot get the sense of them without a proper light."

The Translation Room is west of the Lower Bulb. "Endowed with a deep power that dissolves into ready vernacular even the most ancient and secret scripts of the Law Library[if the candle is not visible].

Usually blazing with the captured light of many thousands of candles, but it has been let to go out, and everything is dim[end if]."

The ordinary quill pen is a thing in the Translation Room. The description of the ordinary quill pen is "You notice -- can't help noticing -- that the feather is blacker and sleeker and longer than should come from any ordinary bird. As if pulled from the wing of a black angel. The stain on the tip is red." Understand "mephistopheles" or "stain" or "tip" or "feather" as the quill. The scent of the quill is "sharp bitterness like myrrh".

Rule for printing the name of the examined quill pen: say "quill of Mephistopheles".

Instead of examining the quill pen for the first time:
	say  "Made of a black feather, to be sure, but there is nothing else at all strange about it, or valuable, or in the least bit unusual. Nothing to make you look twice."
	
Instead of taking the quill, say "It is too heavy for you to lift." Instead of taking the unexamined quill: say "It doesn't look heavy at all, but you can't lift it." Instead of doing something other than taking or examining with the quill: say "For the quill of Mephistopheles, they say, the first king made certain terrible exchanges: at any rate, you cannot use it yourself without sacrificing what you dare not. It is not for anyone but the Kings to use, and they only at their own peril."

Section 4 - The Black Gallery

The Black Gallery is east of the Burnt Frame. The description of the Black Gallery is "[if the number of things in the Black Gallery is less than 3]Rather bare compared with its former glory[otherwise]Lined with [neat rows] of inscrutable -- one might almost say pointless -- objects[end if]."

The inkpot is a fluid container in the Black Gallery. It is empty. Instead of examining the inkpot for the first time, say "A [very]curious object.". The description is "An inkpot of dark material. [if the inkpot is empty]Inside there remains only a red-black crust of dried ink[otherwise]It is full almost to the brim with red-black ink[end if]." Before printing the name of the examined inkpot: say "infernal ".

[The Black Gallery is a different take on the Bellroom situation. In the Bellroom, we tell the player there are a variety of objects present, but move specific ones in only as he finds out about their existence. In the Black Gallery, we put all the objects in together, hinting strongly that they are all (or almost all) red herrings, and let him pick out the one that is actually useful.

To prevent it from being too obvious which the player wants, we need the inkpot to fall at a random place in the description (not necessarily the beginning or the end); and for added fun we will a) discourage examination of every single object individually; and b) randomize the arrangement of items in the room description to make it harder to work through them in order.]

The Black Gallery contains a white apple, a stuffed boar, a preserved goat, a cane, a glass leaf, a silver buckle, a copper snake, a homunculus, a parrot perch, a green cloth swatch, a dark-colored pendant, a gold ring, a broken beam. The ring and the pendant are wearable. The apple is edible. The boar, the goat, the beam, and the perch are fixed in place. [* Since we are just coming up with a supply of random strange objects, many of these things are objects from other games. The beam is a nod to the useless but heavy beam from Zork.] Understand "swordstick" and "handle" as the cane. Before turning or pulling or opening the cane: say "You don't quite have the knack to release the sword, if indeed this is a swordstick." instead. Instead of tasting the white apple: say "You lick the flavorless skin to no effect." After eating the white apple: say "A little apprehensively, you eat the white apple -- which is to all appearances harmless, but has no flavor at all; as if this had been drained away with its color."

Instead of taking a fixed in place curious thing in the Black Gallery, say "[The noun] is too heavy for you to lift."
	
A thing has some text called elaboration. The elaboration of a thing is usually "quite ordinary". The elaboration of the stuffed boar is "(looking angry)". The elaboration of the white apple is "(complete with white stem and leaf)". The elaboration of the glass leaf is "(very fragile)". The elaboration of the cane is "(probably a swordstick, by the look of the handle)". The elaboration of the goat is "(in a very large jar)". The elaboration of the buckle is "(without a mate)". The elaboration of the copper snake is "(jointed)". The elaboration of the homunculus is "(pickled)". The elaboration of the perch is "(evidently much used)". The elaboration of the swatch is "(torn from a much bigger piece)". The elaboration of the pendant is "(faceted)". The elaboration of the gold ring is "(with signet, though you do not recognize the symbol)". The elaboration of the broken beam is "(charred at each end)"

When play begins:
	repeat with item running through things in the Black Gallery
	begin;
		if the item is not the rows, now the item is curious;
		if the item is not the inkpot
		begin; 
			now the description of the item is "A [very]curious object."; [* We could do this individually, but this initialization is quicker to code and easier to change on the fly.]
		end if;
	end repeat.
	
Rule for writing a paragraph about something in the Black Gallery:
	now the player is mentioned; now the rows are mentioned;
	now the surroundings are mentioned;
	if the Black Gallery contains at least six unmentioned things, say "There's [a random unmentioned thing in the Gallery in full] and [a random unmentioned thing in the Gallery in full]; [a random unmentioned thing in the Gallery], [a random unmentioned thing in the Gallery], [a random unmentioned thing in the Gallery]; [a list of unmentioned things in the Gallery].";
	otherwise say "[The rows] have been thinned down to [the list of unmentioned things in the Gallery], thanks to your diligent action."
	
To say (item - a thing) in full:
	say "[a item]";
	if the elaboration of the item is not "quite ordinary", say " [elaboration of the item]".
	
To say very:
	repeat with index running from 0 to the number of examined curious things
	begin;
		say "very ";
	end repeat;
 
A thing can be curious or dull. A thing is usually dull.

[Of course, our careful efforts will be defeated if the player can TAKE ALL. So, in this room only, we might make "all" fail. But this produces the unsatisfactory answer to TAKE ALL: There are none at all available! which is clearly not right. So we need to adjust that also. Here we frankly cheat.]

Rule for deciding whether all includes something curious when the location is the Black Gallery:
	it does not.
	
Rule for deciding whether all includes scenery:
	it does not.
	
Rule for deciding whether all includes a fixed in place thing while taking: 
	it does not.

The neat rows are in the Black Gallery.  [* We don't make them scenery because that would exclude them automatically from TAKE ALL.] The description is "This place has obviously been used for storage for quite a while." 

Instead of taking the neat rows: say "A discouraging prospect -- moving everything from this room is really work for about a dozen strong spirits from the contract book."

[Now the player can take objects individually, but cannot collect them all, and would have to examine them each individually to get their descriptions.]

The Armory is south of the Black Gallery. "From the looks of things, immediately above the Guard Tower. An [assortment of weapons], most of them hundreds of years old and no longer useful, are collected here, though from the gory appearance at least a few of the daggers have been sharpened and tried in the relatively recent past."

The assortment of weapons is scenery in the Armory. Understand "gun" or "musket" or "dagger" or "daggers" or "sword" or "swords" or "weapon" as the assortment. The description of the assortment is "Swords, daggers, the odd musket. Nothing that would pose much of a threat to an army of current technology, but still enough to do some damage in a hand-to-hand conflict." Instead of taking the assortment: say "You have learned that the Beast cannot be killed so directly -- though to judge by the evidence he did try here. And in general physical violence has never been much use against the castle's more spiritual powers."

Instead of attacking something: say "Time was when you thought the castle and its inhabitants could be taken down with physical violence, but you have since learned better."

Section 5 - The Lie Library
[Here the player may end the game when he has the right selection of possessions, so we have a lot of material associated with the book return stand.]

The Lie Library is north of the Black Gallery and east of the Smoke-Damaged Chamber. The description of the Lie Library is "Fables, fictions, and falsehoods, arranged by number by type, and containing such categories as 'In which the hero receives help from three aged figures,' 'In which the villain has a mysterious name,' and so on."

The ivory door is a door. It is closed and lockable and locked. The ivory key unlocks the ivory door. The description of the ivory key is "It is not all ivory, of course, just a metal shaft with ivory in the handle."

The book return stand is a supporter in the Lie Library. The description is "Carvings around the outer edge of the stand indicate how one should use it: a small tonsured figure places a book on the stand, then rings a bell; whereupon a librarian, bearing the traditional shackles and sheets of a ghost, appears to take it away." Understand "bookstand" or "carving" or "carvings" or "figure" or "librarian" or "shackles" as the stand.

Before attacking a ringer when the contract book is in Storage-Box:
	say "All the servants of the castle are now released, and none will serve you." instead.
	
Definition: the glass bell is unsolved if the contract book is not in Storage-Box. Definition: the Lie Library is unsolved if the contract book is not in Storage-Box.
	
Definition: the glass bell is solved if the contract book is in Storage-Box. 

Definition: the Lie Library is solved if the contract book is in Storage-Box.

Instead of attacking the glass bell in the Lie Library:
	if the contract book is on the book return stand
	begin;
		if the inkpot is on the book return stand and the inkpot is full
		begin;
			move glass bell to bellroom;
			move contract book to Storage-Box;
			say "You summon the librarian, who comes and looks at the contract book: you see this as a sort of fog. It frowns at the condition of some of the pages, then searches the front and back of the book; then, grimacing, it takes out a red seal like those used in the empire of the Chan. 

It inks this carefully from the inkpot, then stamps inside the front of the book:[paragraph break]";
			center "PROPERTY OF THE LIE LIBRARY";
			center "DO NOT REMOVE";
			say "[paragraph break]...whereupon the contracts inside begin to unravel and dissolve into the merest stories.";
			if feast is in Storage-Box
			begin;
				say "[line break]Of course, this means that you are unable to find any food, since the kitchen staff no longer exists to prepare it. The Beast, though still alive, will not survive until you can fetch something. But perhaps that is a small price to pay for all the souls you have liberated.";
				end the story saying "You have made an exchange";
			end if;
			if the Beast is in Storage-Box
			begin;
				end the story saying "You have punished the Beast for his sins and set free his slaves";
				stop the action;
			end if;
			if girdle is in Storage-Box
			begin;
				say "[line break]You never do discover any final rest or cure for the Beast. But perhaps that is a small price to pay for all the souls you have liberated.";
				end the story saying "You have made an exchange";
			end if;
			stop the action;
		otherwise;
			say "You summon the librarian, who comes and looks at the contract book: you see this as a sort of fog. It frowns at the condition of some of the pages, then searches the front and back of the book; then, grimacing, it takes out a red seal like those used in the empire of the Chan. It is about to mark the contract book property of the Lie Library, when it discovers that its seal ink has dried up: so the stamp has no efficacy. Disappointed, it vanishes again.";
			stop the action;
		end if;
	end if;
	if the storybook is on the book return stand
	begin;
		move the storybook to the Lie Library;
		say "You summon the librarian, who turns up, sees the storybook, and restores it to its place. But you could easily get it out again." instead;
	end if;
	if something is on the book return stand, say "You summon the librarian, who comes and looks at [the list of things on the book return stand]. Then it foggily shakes its head and goes away again." instead;
	otherwise say "You summon the librarian, who comes and looks at the empty book stand, then goes away disappointed."
 

The storybook is a thing on the book return stand. The description of the storybook is "A collection of fanciful tales 'which were once true but are no longer'. It is stamped across the front as having been inducted into the Lie Library." The printing of the storybook is "Once upon a time, there was a young Russian girl whose mother died, leaving behind only a painted wooden clapper which made a loud noise. When the girl's father married again, the second wife was very cruel and miserly... (etc. at some length); but whenever the girl was lonely, she took the wooden clapper to the mirror in her mother's bedroom and clapped it loudly; and her mother's spirit would appear to her and advise her... (And so on, for several dozen pages of adventure, ending in marriage to the Tsar.)".


Chapter 5 - Rose Cloister

Section 1 - Rooms

Cloister Walk is east of the Parliamentary Chambers. "A pleasant cloister overlooking the rose garden to the north. You have walked it many times, seeking to waste the excesses of time at your disposal."

Walk's End is east of the Cloister Walk and southeast of Rose Garden. "Lucrezia, they say, died here. It is only a turning point in the corridor, with a bench." 

The stone bench is an enterable supporter in Walk's End. It is scenery. Understand "curious" or "relief" as the bench. The description of the stone bench is "A deep seat with a curious relief carved onto the back: if you look from the right angle, it appears as though Lucrezia is lying on the bench, just like a lady on a tomb, her hands piously folded around the handle of a mirror. Scrying her own death, perhaps, or maybe communicating with someone who had already died." Instead of pushing or turning the stone bench: say "If the Beast were awake and here, you might between you be able to budge the stone bench; but as it is, you haven't much chance." Before pushing the stone bench to a direction: try pushing the stone bench instead. After entering the bench, say "You settle uneasily onto the bench, recalling its ghostly former user."

On the stone bench is some discarded embroidery materials. The materials are a reminder. Understand "linen" or "basket" or "threads" or "thread" or "cloth" or "fabric" as the materials. The description of the embroidery is "The little that is already done is old-fashioned blackwork, like your grandmother's mother might have stitched." The memory of the embroidery is "A few weeks ago now, he came to you with a quick step. 'Look, it took me all morning, but I found this.' Holding out the basket of threads, the folded linen. Not in bad condition, either.

'What is that for?' You were never much for sewing things at home, even before your mother died.

'I thought -- since you're so bored here --' He lowered his arm. 'When I saw more of the world, I knew a number of young ladies who were very fond of it. My sister liked to make stories with hers.'

You opened your mouth, looking for something to say.

'I see,' he answered. 'The world has changed. What do young ladies do now?'

'I don't know,' you reply. 'My father fell on hard times. We live in the country. I'm more or less a milkmaid, these days.'

At the word milkmaid, his mouth twisted a little and he shrugged. 'I cannot provide any cows,' he said, after a long time."

Understand "sew [text]" as a mistake ("You have never been much of a seamstress."). Understand the commands "embroider" and "stitch" as "sew". [* Another beta-tester addition.] 

Instead of solving embroidery: say "You can roughly guess what the rest of the pattern ought to look like, but that does not mean that you could complete it with any success." [* For the case of >FINISH EMBROIDERY.]

After examining the embroidery: now the description of the embroidery is "Unfinished linen and threads."

Before putting the embroidery materials on the windchimes:
	say "You try muffling the chimes in the cloth, but can't rig the whole arrangement so as to keep them absolutely silent -- and that is what you need to do, if you're going to avoid summoning up the spirit guards." instead.
	
Instead of tying the materials to the windchimes: try putting the materials on the windchimes. Instead of tying the windchimes to the materials: try putting the materials on the windchimes.

Understand "cover [something] with [something]" as putting it on (with nouns reversed). Understand "wrap [something] in/with [something]" as putting it on (with nouns reversed). Understand "muffle [something] in/with [something]" as putting it on (with nouns reversed). Understand "wrap [something] around [something]" as putting it on. Understand the commands "shroud" and "silence" as "muffle". [* This is a response to play-testers wanting to try muffling the chimes in embroidery -- a reasonable attempt, but one that would short-circuit the intended puzzle structure.]

The Scrying Room is south of the Walk's End. "A place for consulting with the servants, summoning them by their instruments and allowing their spirits to manifest in the mirrors. But you know this only from explanation, because the mirrors and glasses have been broken or carried away to the Crystal Bedroom, when they ceased to reflect anything that gave pleasure to their master." The Scrying Room is east of the small door. The small door is east of the Treasure Room. The small door is a door. It is closed and lockable and locked. 

The small key is a passkey. The small key unlocks the small door. The small key unbolts the small door. [* "Unbolts" comes from the Locksmith extension, and indicates that the player *knows* that the key fits this door, so even at the beginning of the game the small key will be described in inventory as opening the small door.]

The small key is in Scrying Room.  "A [small key] [if the small key is not handled]hangs beside the door[otherwise]lies on the ground[end if]." The description of the small key is "The key is of the sort of delicate design intended to unlock more than one thing[if the small key is not handled and the small key is in the Scrying Room], and hangs from a peg[end if]." Understand "peg" as the small key when the small key is not handled. [* If it's still hanging up...]

Instead of throwing something at the windchimes when the windchimes are in the Rose Garden:
	move the noun to the location;
	say "[The windchimes] bounce and ring; [the noun] lands on the ground."

Instead of searching the mirrors:
	say "You look and see yourself, scratched and dirty from the long journey; and remember...

He stood in the doorway, amused. 'You look displeased.'

You, holding wide brocaded skirts. 'They're very rich and very beautiful and much too fancy for me.'

'And?'

'And--' You glanced down at them. 'And they would have been out of fashion on my grandmother!'

'Which is the last time the servants had a chance to practice making gowns,' he said. 'Do you mind? There is no one to see you but me, and I assure you that my knowledge of current Parisian fashion is nonexistent...'"

[Instead of taking the small key when the player is not on a supporter:
	if the small key is handled, continue the action;
	otherwise say "The key is hanging from a peg too high for you too reach. (Many things are. He was always having to help you with high objects, and move shelves lower so that you could get at them.)".]

Understand "scry in [something]" as scrying. Scrying is an action applying to one visible thing.

Check scrying: if the noun is not the mirrors, say "No suitable surface is afforded you by [the noun]."

Carry out scrying: say "You need some way to summon the spirit you want to speak with."

The Rose Garden is north of the Cloister Walk. "Only one kind of [roses] grows here, a pink only just distinct from white. This strain creeps over the ground and climbs the walls of the cloister.

In the middle of the garden a way slopes into the ground, reminding you of the entrance to a burial mound." The roses are scenery in the Garden. The printed name of the roses is "rose". Understand "rose" or "skull" as the roses. The description of the roses is "In the bud it is innocent; in bloom, it bears the mark of a death's-head at the heart." The scent of the roses is "sickly charnel sweetness". Understand "pick [something]" as taking. Instead of taking the roses: say "Your father did so once, at his cost. You leave them alone, though you could hardly do yourself any greater harm than has already been done." Instead of climbing the roses: say "They're both unpleasantly thorny and too weak to support your weight."

After going to the Rose Garden from the Rooted Room:
	say "You climb into the pale light...";
	continue the action.

Section 2 - The Windchimes
[The windchimes need to guide the player through the darkness when he wears the helmet, so we have a fairly complicated set of rules determining whether they're audible and, if so, how this is described.]

Some iron windchimes are an ambiguously plural thing in the Rose Garden. Understand "guard" or "guards" or "chimes" or "chime" or "chain" or "padlock" or "small" or "lock" as the windchimes. "Strung up by a chain is a set of [iron windchimes]." The description of the windchimes is "Each chime is engraved with the staring eyes and exaggerated nostrils of a spirit warrior."  The windchimes can be lockable. The windchimes can be locked. The windchimes are lockable and locked. [The windchimes have a thing called matching key.] The small key unlocks the windchimes. Instead of taking the windchimes when the windchimes are locked: say "The chimes have been locked to the chain that supports them."

Instead of pulling the locked windchimes, say "They refuse to come free, having been locked in place with a small padlock." Instead of pulling the unlocked windchimes when the windchimes are in the location: try taking the noun.

Understand "untie [something]" or "loosen [something]" or "free [something]" as taking. Understand "take down [something]" as taking.

Loudness is a kind of value. The loudnesses are noisy, loud, melodious, muted, and almost inaudible. Windchimes have a loudness.

After dropping the windchimes in the Rose Garden: say "You string the chimes again."

After taking the windchimes in the Rose Garden: 
	move windchimes to the Bellroom;
	now windchimes is handled;
	say "You take the chimes down, silencing them and muting their power. When they are entirely still, they fade from your grip and vanish."
	
Before doing something other than hinting about or examining or listening to the windchimes when the player is not on a supporter:
	if the windchimes are handled, continue the action;
	say "You cannot reach [the windchimes] from your present position; you'd need something to stand on." instead.

Instead of attacking the windchimes: say "They sound prettily only when hung up for the wind." 

After deciding the scope of the player while listening:
	if guards act, place the windchimes in scope;
	if in darkness 
	begin;
		repeat with item running through audible things
		begin;
			if item is enclosed by an adjacent room, place the item in scope;
		end repeat;
	end if.

Instead of touching an audible thing when in darkness:
	say "You reach for the source of the [sound of the noun] noises, and feel what seems like [a noun]."

Instead of listening to a room:
	play sounds.	
	
The can only reach inside rooms while listening rule substitutes for the can't reach inside rooms rule when listening. [* This allows us to listen to the windchimes even when we are not in the same room with them.]

This is the can only reach inside rooms while listening rule:
	continue the action;
	
To play sounds:
	begin the echolocating activity;
	if the player can see the windchimes
	begin;
		try listening to the windchimes;
		end the echolocating activity;
		rule succeeds;
	end if; 
	if guards act
	begin;
		now the windchimes are seen;
		say "Windchimes ring, [loudness of windchimes],";
		if in darkness
		begin;
			let way be the best route from the location to the Rose Garden;
			if the way is up
			begin;
				say " from somewhere above you.";
				end the echolocating activity;
				rule succeeds;
			end if;
			if the way is a direction, say " from [the way]";
			otherwise say " nearby";
			if an audible thing is in an adjacent room, say ", competing with [a list of audible things which are in adjacent rooms]";
			say "[if an audible thing is in the location]. You can also make out [a list of audible things in the location][end if].";
		otherwise;
			say " somewhere nearby. You cannot be quite certain of the direction[if an audible thing is visible]. You also hear [a list of audible visible things], nearer at hand[end if].";
		end if;
	otherwise; 
		if an audible thing is in the location
		begin;
			say "You hear [a list of audible things in the location]";
			if the player wears the helmet
			begin;
				if an audible thing is in an adjacent room, say ", and [a list of audible things which are in adjacent rooms]";
			end if;
			say ".";
		otherwise;
			if the player wears the helmet
			begin;
				if an audible thing is in an adjacent room, say "You hear [a list of audible things which are in adjacent rooms].";
				otherwise say "Everything is quiet, but loudly quiet: if there were any movement at all, you would sense it.";
			otherwise; 
				if in darkness and an audible thing is in an adjacent room
				begin;
					say "You hear [a list of audible things which are in adjacent rooms].";
					end the echolocating activity;
					rule succeeds;
				end if;
				say "Nothing of note[if in darkness]. One might envy bats, at this moment[end if].";
			end if;
		end if;
	end if;
	end the echolocating activity.
	
To set chime strength:
	if the player wears the helmet, now the windchimes are noisy;
	otherwise now the windchimes are muted.

To decide whether guards act:
	if the windchimes are not in the Rose Garden, no;
	let length be the number of moves from the location to the Rose Garden, using doors;
	set chime strength; 
	let length be length - 2;
	repeat with N running from 0 to length
	begin;
		if windchimes are almost inaudible, no;
		now loudness of windchimes is the loudness after the loudness of the windchimes;
	end repeat; 
	yes.

Instead of listening to the windchimes: 
	if the windchimes are in the Garden, say "The chimes sound randomly, but not unpleasantly. It is only if you listen for a long time that they begin to remind you of a warning or a threat.";
	otherwise say "The windchimes are silent now that they've been taken down."



	
Chapter 6 - Crypt, and Darkness

Section 1 - Darkness In General
[Darkness in Bronze is a bit more complicated than average because we take into account what can be heard, and also whether there is a light source in a room that might be shining into the dark one. So we set some general rules for it here:] 
 
Rule for printing the description of a dark room:  
	if an adjacent room (called the light source) is discernible
	begin;
		let way be the best route from the location to the light source, using doors;
		if way is up
		begin;
			say "Though a dim light filters down from [the light source in lower case], you can see almost nothing of the contents of your current location[if an adjacent room which is not the light source contains the candle], and a raking light across the floor from the next room[end if].";
			if location is Debtor's Paradise
			begin;
				if trapdoor is not scenery
				begin;
				say "[line break]The only thing you can make out clearly is [the trapdoor].[line break]";
				end if;
			end if;
			if location is Tight Passage
			begin;
				say "[line break][The inscription] stands out beautifully now.";
			end if;
		otherwise;
			if candle is on a supporter
			begin;
				say "The light from [way] comes in a bit above floor-level, sharply illuminating one wall but leaving the rest of your surroundings dark and unfathomable.";
				if location is Debtor's Paradise and trapdoor is not scenery, say "[line break]The only thing you can make out clearly is [the trapdoor].[line break]"; 
				if location is Tight Passage, say "[line break][The inscription] stands out beautifully now."; 
			otherwise;
			say "It's very dark and you can barely make out any of the room's contents, or even tell where the walls are. The only illumination is a harsh raking light across the floor, coming in from [the way].";
			if location is Debtor's Paradise
			begin;
				if trapdoor is not scenery
				begin;
				say "[line break]The only thing you can make out clearly is [the trapdoor].";
				otherwise; 
				now the trapdoor is fixed in place;
				now the trapdoor is not scenery; 
				say "[line break]In fact, that oddly-angled light shows an unevenness in the floor: [a trapdoor] of matched stone.";
				end if;
			end if;
			if location is Tight Passage
			begin;
				say "[line break][The inscription] is unfortunately just too high on the wall to be fully lit this way, though you can pick up part of it.";
			end if;
			end if;
		end if;
	otherwise;
		let the overview be the room up from the location;
		if the overview is a room and overview is not dark
		begin; 
			say "Though a dim light filters down from [the overview in lower case], you can see almost nothing of the contents of your current location. You find yourself concentrating all the more alertly on your hearing, as though the slightest echo might offer a clue.";
		otherwise;
			say "It's so dark in here that you have to feel your way along, and are nervous of tripping at any moment. You find yourself concentrating all the more alertly on your hearing, as though the slightest echo might offer a clue.";
		end if;
		say line break;
		play sounds;
	end if;
	rule succeeds.

Section 2 - Crypt

Below the Law Library is the hole. Below the hole is the Central Crypt. The hole is an open door. The hole is not openable. The description of the hole is "Pentagonal and lined with stones." The hole is scenery.

The description of the Central Crypt is "A relic-storage place for all the bits of men and women -- and creatures -- bound to the Kings over many centuries. Only brute animals are free of binding, since they have no souls; which is why there are no dogs in the castle, no horses, no songbirds."  Crypt is dark. The relics are scenery in the Central Crypt. Understand "bones" as the relics. The description is "Bones are built into the walls, often no more than fragments."

The Virgin's End is north of the Central Crypt. "The resting place of maidens who died before marrying those to whom they were engaged." Virgin's End is dark.  Some dust is a floor in Virgin's End. The sound of the dust is "dry sifting". Understand "sandy" or "sifting" or "dry" as the dust. Understand "floor" or "sand" as the dust when the player is in Virgin's End.

The Father's Regret is east of the Central Crypt and northeast of the Debtor's Paradise and southeast of Virgin's End. "The home of fathers who died before their children were born." Father's Regret is dark. Some drawers are a fixed in place container in Father's Regret. "Tokens of binding are stored here: bones and bits of hair, relics, hearts scientifically dried, and many other things, culled through the centuries by the masters of this place, in [drawers]." The description of the drawers is "The drawers are numerous, but there is only one that opens without sticking."  Understand "drawer" or "tokens" or "bones" or "token" or "bit" or "bits" or "relic" or "relics" or "hearts" or "thing" as drawers. In the drawers are an ivory key and an elephant harness. The harness is fixed in place. Instead of removing the harness from something, say "The harness refuses to budge, in a way you associate with the stone gargoyle." Instead of taking or pushing or pulling or turning the harness, say "The harness refuses to budge, in a way you associate with the stone gargoyle."

The ivory key is a passkey. [* A kind defined in the locksmith extension, which automatically adjusts its description when in inventory to indicate the item it was last used to unlock.] The drawers are closed and openable. The description of the elephant harness is "Torn in several places, but it was once quite a showy piece, with gems, tassels, buttons. Must be associated with quite an interesting contract, this piece." Understand "gems" and "tassels" and "buttons" as the harness. Instead of wearing the harness, say "However you may sometimes doubt this, you are human yet."

The Apprentice's Workshop is west of the Central Crypt and northwest of the Debtor's Paradise and southwest of the Virgin's End. "A mausoleum for apprentices who perished before their terms of indenture were complete." Apprentice's Workshop is dark.

Rocky Chamber is southeast of Father's Regret. Rocky Chamber is dark. "A tight, rocky corner among foundations of the oldest part of the castle. A slow leak in the south wall admits a little water, but not enough to be very destructive." Rocky Chamber is southwest of Zoo. The leak is a floor in the Rocky Chamber. The sound of the leak is "irregular dripping". Understand "drip" or "dripping" or "oily" or "water" as the leak. 

Understand "fill [something]" as filling. Filling is an action applying to one thing.

Instead of filling something in the presence of the leak, say "The leak is only a drip, not enough to fill anything." The description of the leak is "The dripping moisture has the oily look of moat water."  The scent of the leak is "mildewy dampness". Before inserting the leak into something: say "The leak is insufficient to fill much of anything." instead. Before inserting something into the leak: try inserting the leak into the noun instead. [* To deal with people saying things like PUT INKPOT IN THE LEAK and PUT WATER IN THE INKPOT.]


Section 3 - Debtor's Paradise

The Debtor's Paradise is south of the Central Crypt. "The graves of men who died before resolving their debts." Debtor's Paradise is dark.

Some stones are a floor in the Paradise. Understand "floor" as stones when the player is in Paradise. The description is "Seemingly even[if trapdoor is not scenery], except where the trap door is[end if]." Instead of touching the stones when the trapdoor is scenery: say "You run your hands over the floor, but don't detect any telltale signs. You'll have to go about this another way."

Instead of walking toward the stones: try jumping. [* Covers WALK OVER FLOOR and similar commands, should the player try this.]

Before going from Debtor's Paradise when the trapdoor is scenery: 
	if in darkness, continue the action;
	say "As you walk out of the room, you notice that your footsteps sound odd[if player wears the helmet], as though there were hollow space somewhere under the stones -- though you cannot identify a specific part of the floor that seems more vulnerable[end if]." 
	
Before going to Debtor's Paradise when the trapdoor is scenery:
	if in darkness, continue the action;
	say "The floor sounds progressively[if player wears the helmet] hollower[otherwise] stranger[end if] as you walk toward the middle of the room." 
	
Before going through the trapdoor when the trapdoor is scenery:
	say "You haven't found a way down." instead.

Instead of jumping: say "You hop, but don't attain much height."

Instead of jumping when the player is on a supporter:
	try exiting instead.
	
Instead of jumping in Debtor's Paradise:
	say "The floor thuds hollowly under you."
	
Instead of jumping in Debtor's Paradise when the player wears the helmet and the trapdoor is scenery:
	now the trapdoor is not scenery;
	now the trapdoor is fixed in place;
	say "You hop experimentally across the floor, the helmet amplifying your sensitivity to every sound, so that you are able to distinguish the exact flagstone at which the hollow thudding becomes most resonant.
	
On a bit of investigation, this stone turns out to be loose."

Instead of attacking the stones when the trapdoor is scenery:
	if the player is wearing the helmet
	begin;
		now the trapdoor is not scenery;
		now the trapdoor is fixed in place;
		say "You tap experimentally on the floor, listening closely through the power of the helmet, until you find a suspiciously resonant -- and loose -- stone.";
	otherwise;
		say "You tap experimentally on the floor, but lack the acuity of hearing to tell whether there are different degrees of hollowness.";
	end if.
	
Instead of listening to the stones when the player wears the helmet:
	say "You press your ear to the ground and think you hear the distant movement of liquid -- but it's hard to be sure."


The trapdoor is a door. The description is "A trapdoor -- well, really, a hinged flagstone, not much different from the rest of the floor to which it belongs." Understand "stone" or "flagstone" as the trapdoor when the trapdoor is not scenery. Instead of pushing or pulling or turning the closed trapdoor: try opening the trapdoor.

Visibility rule when examining the trapdoor:
	if in darkness
	begin;
		if the trapdoor is not scenery
		begin;
			say "You can't see very clearly in this light, of course, but you lean close and squint...";
			there is sufficient light;
		otherwise;
			there is insufficient light;
		end if;
	otherwise;
		there is sufficient light;
	end if.

Understand "trap" or "door" as the trapdoor. The trapdoor is scenery. Below the trapdoor is the Dank Room. Above the trapdoor is Debtor's Paradise.

Before listing nondescript items of Debtor's Paradise when the trapdoor is unseen: now the trapdoor is not marked for listing.

Before doing something to the trapdoor when the trapdoor is scenery:
	say "You can't see any such thing." instead.
	
Before going down in the Debtor's Paradise when the trapdoor is scenery: try going south instead. After deciding the scope of the player when the location is the Debtor's Paradise: if the trapdoor is not scenery, place trapdoor in scope.

Section 4 - Dank Room and Fountain

The Dank Room is dark. The description of the Dank Room is "The air is clammy and unpleasant, and clogs in your lungs." Instead of smelling the Dank Room: say "It is even less pleasant than Lucrezia's rose garden, and that is saying something."  

The Press Room is north of the Dank Room. The Press Room is dark. "Liquid squeezed from the surrounding earth here flows out through [a fountain], then soaks back into the ground below."  The fountain is scenery in press room. The description of the fountain is "The liquid is sludge-black where it pours in quantity, but where it runs thin, it appears red." Understand "liquid" or "trickling" or "dull" or "ink" as the fountain. The sound of the fountain is "dull trickling". Instead of touching the fountain: say "It feels a little warmer and a little stickier than it ought."

Instead of filling the vial in the presence of the fountain: say "The vial is stoppered and full of the old poison; and in any case who knows how the liquid here would interact with the apothecary's brew? Better to find some other container."

Instead of filling an empty fluid container in the presence of fountain: now the noun is full; say "You fill [the noun] from [the fountain], trying to get as little as possible on yourself." Instead of filling a full fluid container: say "[The noun] is already full." Instead of smelling the fountain: say "Despite its unappealing appearance and the rankness of the air, it does not smell as vile as you expect: more bitter." The scent of the fountain is "bitterness".

Instead of drinking or tasting the fountain: say "Overcoming dislike, you taste a bit of the liquid, and find it more bitter than wormwood. All anguish and regret and the knowledge that it was once in your own power to make things come out better. But perhaps it is not too late after all."
 
Section 5 - Tight Passage and Inscription

Tight Passage is northeast of Father's Regret. Tight Passage is dark. "The passage through rock ends here, and begins to tunnel through soil instead where it heads northeast."

The cord is a fixed in place thing in Tight Passage. The description is "A pullcord emerges from the rock just before the walls of the passage turn to mud." Understand "pullcord" as the cord. Instead of taking the cord, try pulling the cord. Instead of pulling the cord: say "You give the cord a hard yank. Somewhere above you a very deep bell tolls."; now the Parliamentary Chambers are active; summons runs out in 7 turns from now. Instead of pulling the cord when the Parliamentary Chambers are active: say "Instead of the expected toll, there is only a muted thunk -- perhaps you cannot use the bell too many times in too short a period." Instead of pulling the cord when the sinister door is unlocked: say "No need to trouble him again."

A room can be active or still. At the time when summons runs out: now the Parliamentary Chambers are still.
 

Instead of waiting when the location is Parliamentary Chambers and Parliamentary Chambers are active and the sinister door is locked:
	now the sinister door is unlocked; now the sinister door is open;
	now the Parliamentary Chambers are still;
	say "There is a scuffle, and a presence unfolds itself from where it was waiting, unseen, on the benches. It comes towards you and circles you, and you have the idea -- more imagination than eyesight -- that this was once a tall, thin man of considerable power.
	
It says a few words in the bastardized Italian of the state of Medici-Credenza, and you hear the scrape of wood and stone from somewhere below you: a door opening. 

Then the presence vanishes."

The inscription is a fixed in place thing in Tight Passage. Understand "lettering" as the inscription. The printing of the inscription is "Pull this cord, then wait in the room directly above to speak with Lucrezia's steward. Do not let more than five minutes pass between the summons and the waiting, or he will depart again without offering aid." Instead of rubbing or touching the inscription, say "Try though you might to discover its meaning by touch, the letters are too small and numerous for you to read that way; only the capitals P, L, and D stand out. L for Lucrezia, maybe? The word does feel long enough." The description of the inscription is "There's lettering beneath the pullcord."

The inscription can be unknown, partially known, or fully revealed. The inscription is unknown. 

After reading the inscription:
	now the inscription does not require the candle;
	now the inscription does not require the stool;
	continue the action.

After dropping the candle in a dark room:
	say "You set down the candle on the ground. The room remains brightly lit, but from below, your movements casting enormous shadows on the walls and ceiling."

After taking the candle in a dark room:
	say "You pick up the candle, restoring the lighting to a more natural angle. Immediately the place seems less unnerving."
	
Before reading the fully revealed inscription:
	say "You have the words by heart now: [italic type][printing of the inscription][roman type][paragraph break]" instead.

After reading the inscription:
	now the inscription is fully revealed;
	continue the action.

Instead of reading the inscription when illuminated:
	say "Unfortunately the words are too worn for you to read. Perhaps if the light were coming in from an extreme angle, you would do better." 

Instead of reading the inscription when illuminated more than once: 
	if the candle is on the stool and the stool is in the Tight Passage
	begin;
		if the inscription is partially known
		begin;	
			say "The candle is at about the right height here, but you won't get the full effect unless you push the whole thing back to the northeast and get the angles right.";
		otherwise;
			say "The candle is at about the right height here to illuminate the inscription, but the angle's off; further down the corridor would be better.";
		end if;
	otherwise;
		if the inscription is partially known
		begin;
			say "You wave the candle around, trying to eke out the rest of the meaning, but it's not helping: what you really need is to set the candle up at the right height in the rooted room, and then come back and have a look.";
		otherwise;
			if the player carries the candle, say "You experiment with holding the candle in a variety of positions, but still ";
			otherwise say "Still ";
			say "you can't quite make the inscription out -- something about the cord, and you think the large L is for Lucrezia. But what you really need is for the light to be coming in at about the height of the inscription itself, flush with the wall, and from some distance away[if the player carries the candle]. Your arms aren't long enough to let you hold the candle in the right position while you read[end if]."; 
		end if;
	end if.

To decide whether illuminated:
	if in darkness, no; yes.

Instead of reading the inscription when in darkness and the candle is not on a supporter:
	if the inscription is not fully revealed, now the inscription is partially known;
	say "The light coming in does illuminate the floor sharply, and is at a good angle, but it is a bit too low to show up the lettering halfway up the wall. All you get is the deepest capital letters -- P, L, and D -- and the last line: [italic type]or he will depart again without offering aid.[roman type][line break]"
	
Visibility rule when examining or reading the inscription:
	if in darkness
	begin;
		if an adjacent room is discernible, there is sufficient light;
		there is insufficient light;
	otherwise;
		there is sufficient light;
	end if.

After deciding the scope of the player when the location is the Tight Passage: if an adjacent room is discernible, place inscription in scope.

[This puzzle turned out to be quite challenging to the first testers who tried it, and needed the addition of a lot of hints and responses to close-but-not-quite-there solutions.]

After dropping the candle in the Tight Passage:
	say "You set the candle down immediately under the inscription -- but that's no good, you see at once, because thanks to the curvature of the wall you still can't get the thing at the right angle. Perhaps if it were lit from further off and from the side, rather than the bottom..."

After deciding the scope of the player when the player is in the Rooted Room and the inscription is seen:
	place the inscription in scope.
	
Before doing something to the inscription when the player is in the Rooted Room:
	say "You'd have to head back southwest to be close to the inscription -- you can't reach it or read the small lettering from here[if the player can see the candle], though from what you can see, this is a good direction for the light to come from[end if]." instead. [* Added to deal with the case where players take the candle to the rooted room and try to look back at the Tight Passage in order to read it.]
	
Instead of pushing or pulling or turning the candle when the candle is in the Tight Passage:
	say "You try pushing the candle this way and that. The farther it gets from the wall, the less use it is; and putting it right under the inscription does no good either. 
	
But you find that the angle gets better as you push the candle northeast along the wall, until the deepest-cut letters jump out at you: P, L, D.
	
There's a lot more to it than that, though." The candle is pushable between rooms. [* This to enable >PUSH CANDLE NE as a solution.]

Instead of pushing or pulling or turning the stool when the stool supports the candle and the stool is in the Tight Passage:
	say "You adjust the stool in one direction and another, finding that the candlelight works best at this height, and the angle improves as you move the stool northeast."

After going northeast to the Rooted Room with the stool when the candle is on the stool:
	say "You push the stool along the northeast wall, the candlelight shifting, until you reach a point that seems just right...";
	continue the action.

After going northeast to the Rooted Room with the candle:
	say "You continue to move the candle along the northeast wall until you reach a point where the angle seems to be improving...";
	continue the action.

Instead of pushing or pulling or turning the candle when the candle is in the Tight Passage for the second turn:
	try pushing the candle to the northeast instead.

After putting the candle on the stool when in darkness:
	say "You set the candle down on the stool, illuminating the room from a low but tolerable angle."
	
After putting the candle on the stool when the location is the Rooted Room:
	say "You put the candle on the stool, aligning it neatly against the wall. A harsh raking illumination is now cast along the wall, about at a height with your knees."
	
Instead of tying something to the cord:
	say "You try various arrangements, but the cord is too short to be secured to anything."

Instead of tying the cord to something: try tying the second noun to the cord.

Instead of tying the candle to the cord:
	say "You spend some frustrating time trying to make a little noose of the cord and secure it around the candle, but is easier to imagine than to perform, and in the end you are forced to admit that even if you could do it, the angle of lighting on the inscription would not be the best. The light really needs to be coming in from lower and further off."
	
Understand "near/beside/by/above/under/below/over" or "next to" or "up to" as "[by]".

Understand "hold [something preferably held] [by] [something]" as juxtaposing it to. Understand "put [something preferably held] [by] [something]" as juxtaposing it to.

Juxtaposing it to is an action applying to one carried thing and one visible thing. Carry out juxtaposing it to: say "This produces no interesting results."

Instead of juxtaposing the candle to the inscription:
	try waving the candle.

	
Before putting the candle on the inscription:
	say "You try holding the candle very close to the inscription, but rapidly decide that distance and angle will be more helpful." instead.
	
Instead of waving the candle in the presence of the inscription:
	say "You experiment with ways to hold the candle, and find that the beginnings of letter forms suggest themselves if you put it at about knee height and some way northeast, close to the wall.
	
Unfortunately, from that position it's impossible to look at the inscription at the same time."

Carry out hinting about the unexamined inscription:
	say "Have you tried reading the inscription? Dropping the candle in the same room? Moving it around?";
	if player consents,
		say "You need to light the inscription from far off, and at the right height. [more]";
	otherwise stop the action;
	if player consents,
		say "In fact, it might help if the candle were in the next room. [more]";
	otherwise stop the action;
	if player consents,
		say "If you put the candle in the Rooted Room and return to the Tight Passage, you find that the distance is about right but the lighting is too low, so you'll need to find a way to elevate the candle as well. [more]";
	otherwise stop the action; 
	if player consents, say "Get the stool. Put it in the Rooted Room. Put the candle on it. Return to the Tight Passage and read the inscription.";
	stop the action.
	
Carry out hinting about the examined inscription when the sinister door is locked:
	say "Perhaps the pullcord will help you summon Lucrezia's steward and get into the chamber. [More]";
	if player consents,
		say "You'll have to pull the cord, then within five moves go to the room which is immediately above this one; then WAIT. [more]";
	otherwise stop the action; 
	if player consents,
		say "From the Tight Passage you go northeast to the Rose Garden, so you want the room which is south and west from the Rose Garden. [more]";
	otherwise stop the action;
	if player consents, say "Pull the cord. Go to the Parliamentary Chambers. Wait.";
	stop the action.

Section 6 - Lucrezia's Study

Lucrezia's Study is west of the sinister door. "Little survives here, enough to suggest that a number of books were burned and glass tools smashed. You can only guess at why, or by whom.

But the dominant item is the vast [image] of Lucrezia at a wardrobe fitting of some kind." 

The sinister door is west of the Tight Passage. It is a door. It is locked and lockable and closed. The description of the sinister door is "The work of the hinges and handle, the color of the wood, the point of the arch: all malevolent. It does not have a keyhole at all, however, and looks far too sturdy to succumb to battering. In fact, by the looks of it, someone has had a try before." Instead of attacking a locked sinister door: say "It is just as resistant to attack as it looks."  The initial appearance of the sinister door is "There is also a sinister door, leading [if the location is the Tight Passage]west[otherwise]east[end if][if the sinister door is open] -- and currently open[end if]."

The pile of notes is in the study. "A single [pile of notes] remains." The description of the pile of notes is "Spiky, erratic handwriting on a variety of mystical and magical topics pertaining to the castle and the spiritual status of the inhabitants." Understand "paper" or "papers" or "note" or "paperwork" or "single" as the papers.


Instead of consulting the notes about a topic listed in the Table of Notes: 
	say "[reply entry][paragraph break]".

Table of Notes
topic	reply
"rose/roses/garden" or "rose garden"	"The roses are of Lucrezia's own breeding, and you have the impression she regarded them in the nature of a practical joke."
"mirrors/scrying/scry/mirror/mirror-scrying"	"There are various records of the conferences Lucrezia had with various friends, family members, and servants, by ringing bells in the presence of her magical mirrors."
"lucrezia"	"Though the notes are of her writing, they are for the most part not about her: she was not a diarist, but an experimenter."
"me/myself"	"There's nothing about you here, which is no surprise, considering that the author of these pages was dead centuries before your arrival."
"beast"	"You can discover no specific references to the Beast; though your hazy impression from his conversation is that he never knew Lucrezia, she having been generations before him."
"father" or "my father"	"Your father is not mentioned, which should not surprise, since he did not arrive at the castle until a few years ago, and the papers look to be centuries old."
"elzibad"	"Lucrezia seems to have been quite interested in Elzibad, or rather, in what happened to the castle after Elzibad's death, when contracts were made binding upon all who entered. But there is nothing in her notes to suggest that she had access to sources beyond the papers in the records room, and therefore you are likely to be able to find out all the same yourself, if you wish."
"girdle" or "green girdle"	"You sift through the papers until you find a pertinent entry: that the girdle is to be in some way a device for the punishment or forgiveness of those who abuse the castle's power, 'being in the possession of the weakest of its victims'. Accompanying this are a bundle of astrological diagrams, so who knows how reliable that may be thought to be."
"inkpot"	"About the inkpot, the notes are their most cryptic, and the quality of the handwriting has also declined so that you suspect the author of having been either elderly or sick. 'Of this article, which my father gave me, I believe I have finally uncovered some use. For though it will not hold ink of the ordinary kind, it perfectly contains that which flows beneath the burial ground, consisting of the regret of all inhabitants...' Etc., etc."
"press room" or "fountain" or "ink"	"There are references to an ink of regret -- this sounds romantic, except that the notes go on at tedious length speculating on the precise combination of humors involved, and whether melancholy or blood has the greater part in it, and so on. In any case, Lucrezia seemed quite pleased to have found a source of this valuable, if rather nauseating, liquid."
"helmet"	"The helmet turns out to be written up at great length: an object of Lucrezia's own creation though produced with her father's assistance, it apparently it draws upon the daemons of air and sound to produce the rather mundane effect of heightened hearing, and poses no threat to the wearer, even if that wearer is merely an ordinary human. (This is underlined several times, leading you to suspect that most of Lucrezia's test subjects did not fall into that unexciting category.)"
"shoe/shoes/cloven" or "cloven shoes" or "pair of shoes" or "pair of cloven shoes"	"The shoes, according to these pages, symbolize their wearer's right to tread in and be master of the territory of the dead.

'For which reason I wear them always to funerals and in graveyards', remark the notes conversationally, 'the which habit has greatly offended some of the noble ladies through the cause of the shoes not being a suitable color for such occasions.' Before you can build up much sympathy, Lucrezia continues: 'Therefore in recompense I enslaved two of these ladies to my personal service and gave a third to my son to be his concubine until better manners and humility attend them all.'

Some additional function for the shoes is suggested by the papers -- something about the preservation of memory or a connection to those who wore them previously -- but it seems that even Lucrezia did not understand this very well. ('And for this reason I am determined never to let them fall into the hands of another, but to have them burnt on my pyre at the moment of my death, lest those that follow after learn my secrets.') That scheme didn't work out for her, evidently."
"leather tambourine" or "tambourine/shoemaker/cobbler"	"The shoemaker so busily fitting Lucrezia in the portrait does not seem to have been sufficiently interesting to warrant a record in these notes, though perhaps the terms of his engagement will be found in the contract book."
"devil/mephistopheles/lucifer/satan/compact/curse"	"References to the devil are scattered throughout the pages, with no one portion devoted to him entirely. Somewhat to your surprise, Lucrezia does not seem to have been an ardent fan of the Old Gentleman, neither a professed witch nor a worshipper at his court; she was merely interested in a pragmatic, legalistic way in the question of whether his compact with the ruling family of this castle could ever be dissolved, with or without the damnation of all parties."
"quill/pen"	"About the pen there is a considerable raving: 'Many tests of fire, water, pressure, torsion, acid, and poison have failed; even gunpowder and holy water have not sufficed to ruin it; nor do I now believe that it can be destroyed, but suppose that, being plucked from the wing of the old man my father, it partakes of his same eternal nature. Therefore the arrangement must be dissolved in some other way.'"
"lie library"	"The Lie Library features in her writings at several points: as an ongoing project of which she sometimes has great hopes, sometimes despair; there are assorted references to experiments in bringing various books and ensconcing them there in order to see what will become of them. There are towards the end some excited speculations about the use of the inkpot in combination with the Lie Library, but it is not clear that she lived long enough to make the experiment."
"contracts/contract/crypt/binding" or "book of contracts" or "contract/contracts book" or "ivory door"	"Mostly some speculative notes about the possibility of voiding contracts through some loophole of demonic legalism. You don't entirely follow it. At any rate, to judge by this, she had obtained a kind of mastery over the crypt-spirits by use of her magic shoes. And there is also a reference to a room upstairs, behind the ivory door."
"castle" or "royal family" or "husband" or "king"	"Whenever she writes about her family or her husband, it is with a kind of weary exasperation. You have the sense that none of them were-- or seemed to be-- nearly as intelligent as Lucrezia herself, and she therefore protected and despised them."
"hourglass/dayglass/sand"	"From the notes you have the impression that Lucrezia understood the function of the hourglass and expected that everyone else did also; therefore, maddeningly, she did not record it. But it seems merely to be a measure of something, not a source of power or control."
"sign/warning"	"According to the notes, Lucrezia insisted that the sign be made more prominent, in order that no one break their contract by accident." 

The image is a display in the Study. Understand "lucrezia" or "tambourine" as the image. The description of the image is "Lucrezia stands, imperiously, in what is now the empty bedroom, while a gnome-like shoemaker at her feet customizes pair after pair of shoes to her misshapen--

You look away, unnerved, towards a less disturbing element, [the leather tambourine] in Lucrezia's hand." Lucrezia's Study is dark. 

Rooted Room is northeast of Tight Passage. "Cut as an afterthought through earth and the underside of the garden, and therefore muddy and soil-scented." Rooted Room is dark. Rooted Room is below Rose Garden. The mud is a floor in Rooted Room. Understand "floor" or "roots" or "root" as the mud when the player is in Rooted Room. The scent of the mud is "compost and soil smells".

Instead of going to the Haunted Area when the player is not wearing the cloven shoes and  the player encloses the candle:
	say "You start into the crypt, but an icy unnatural wind blows against you, as though the spirits resent the intrusion of someone with a light. And yet you have seen the Beast come down here, from time to time, bearing lanterns, torches, whatever he found handy.

There must be some preliminary, a matter of spiritual etiquette perhaps, to establish yourself as the master of those below[if the player carries the feast]. The Beast would know[end if]." 

Instead of going to the Haunted Area with something (called pushed article): say "[The pushed article] refuses to move smoothly over the unstable flooring of the crypt." [* This to prevent a bug where the player could not carry the candle into the crypt, but could put it on the stool and push it in.]

Section 7 - Bell Castings

[This area was added late, and is included for two reasons. One is to be sure that someone who enters the basement with a candle does see everything available -- some testers were going down through the Bear Corridor, getting stuck entering the crypt, and not coming around to explore from the Rose Garden side, which meant they got stuck. While it might arguably be fair to make them think of that in a more difficult game, *this* one is pitched to be less challenging. So we connect up the subterranean space this way. The other reason is that I just thought the idea of the bell-making equipment evocative, and wanted to plant this idea in the player's head that this industry has been going on for a very very long time.]

Bell Castings is south of the Rooted Room. "A room of [scrap] and refuse: wooden structures and clay molds from which bells might be made, scrap metal, pieces of bells now broken." The scrap is scenery in castings. Understand "refuse" or "structures" or "wooden" or "molds" or "clay" or "metal" or "pieces" or "bells" as the scrap. The description of the scrap is "By the look of it, there's not a useful, sounding instrument in the lot." Bell Castings is dark.



Wax Supply is east of Bell Castings and northeast of Zoo. "A dank storage area, stacked with [bars of wax][if Bell Castings is visited] -- perhaps for some casting process? You couldn't say[end if]." Some bars of wax are scenery in Wax Supply. Understand "bar" as the bars. The scent of the bars of wax is "good beeswax-scent". The description of the bars of wax is "Far too large a supply for you to move around."  Wax Supply is dark.

Chapter 7 - West Wing

The Great Dining Hall is west of the Entrance Hall. "[if the location is unvisited or the number of filled rows in the Table of memories is 0]Such a long hall that the soup might get cold between one end and the other. You and he used only the far west end, nearest the kitchen. Once you took to dining together at all, that is; the first few months he brought trays to your room, while you hid.

But then you took to eating here; and at the end of every meal he would stand up formally and ask his question[otherwise]You allow yourself to remember another night, another request[end if].[if the number of filled rows in the Table of Memories is greater than 0][paragraph break][memory][end if]".

The long table is scenery in the Great Dining Hall. It is a supporter. Instead of looking under the long table, say "There are no gnawed bones or anything of that nature."

The Enormous Kitchen is west of the Great Dining Hall. "Haunted with the spirits of chefs past, generations and generations of culinary geniuses; one can never predict its whimsies[if the Bellroom is unvisited]. Unless he has moved everything, the bell to summon them into action should be in one of the rooms upstairs[end if]."

The Servant Quarters are north of the Enormous Kitchen. "[if location is unvisited]You've never come here before, and now you see why. [end if]Not a room friendly to visitors, it has the air of resentful, martyred suffering. Even His most unpleasant ancestors would not have grudged this place more paint, surely, and more straw for the beds." The straw is scenery in the Quarters. "Well. There really isn't any." Instead of doing something other than examining with the straw: say "There's hardly enough straw to do anything with."

The decaying ladder is a staircase. "A decaying ladder leads [if the location is the Quarters]down[otherwise]up[end if]." It is above the Apprentice's and below the Quarters. 

The Guard Tower is southwest of the Entrance Hall. "A round tower offering protection to the drawbridge[if the scarlet tower is visited]. It is less cheery and more strongly fortified than the Scarlet Tower, and offers little by way of a view[end if]."
 
Chapter 8 - Upstairs

Section 1 - Apartments and Upstairs Galleries

East of the Upper Bulb is the Gallery of Still Life. The description of the Gallery of Still Life is "Natural light from the south -- coming in from the courtyard[if the player is on the stool], though you cannot see all the way down to ground level from here, even on the stool[otherwise], you suppose, though you are too short to see out[end if] -- illuminates a series of still life paintings on the north wall: one showing the [Wedding Treasure] when Lucrezia arrived from Medici-Credenza, the other rather fancifully entitled [Supper]."

Wedding Treasure is a display in the Gallery of Still Life. Understand "painting"  or "still life" or "table" or "girdle" or "inkpot" or "helmet" or "green" or "cloven shoes" or "paintings" as wedding treasure. The description is "A table tastefully laid with possessions of power or personal worth, brought by Lucrezia as gifts from her father: an inkpot, a helmet, a green girdle stitched with vines, a curious pair of cloven shoes."

Supper is a display in the Gallery of Still Life. The printed name of Supper is "Supper with M". Understand "supper with m" or "painting" or "paintings" or "still life" or "linen" or "napkins" or "bread" or "fruit" as Supper. The description is "A table nicely laid out with white linen and napkins, bread and fruit; and a spoon with a very, very long handle."

East of the Gallery of Still Life is the thick door. East of the thick door is the White Gallery. The description of the White Gallery is "Of more recent construction than many another portion of the castle, and therefore light and airy, and a pleasant place to spend a few hours." The thick door is a lockable door. The small key unlocks the thick door. The description of the thick door is "It looks thick enough to block sound." Understand "heavy" as the thick door. The printed name of the thick door is "heavy door". 

The mechanical chessplayer is a switched off device in the White Gallery. It is fixed in place. "Placed where it will have the most light on the board for the longest time is [a chessplayer]." The description of the mechanical chessplayer is "The chessplayer wears a turban, and in its wooden fingers grasps the head of the black bishop. Whatever move it contemplates has yet to occur. 

The Beast brought it out for you to play against, when other entertainment palled. You lost consistently until he came and roared at it; and afterwards began to win. The suspicion that it was throwing games made you a bit reluctant to make use of it, in the end." Understand "chessboard" or "turban" or "fingers" or "bishop" or "chess" or "player" or "board" or "pieces" or "switch" as the chessplayer. 

Instead of switching on the chessplayer for the first time:
	say "You throw the switch hopefully, but nothing happens -- in fact, the switch flops loosely back into its old position, plainly connected to nothing."

Instead of switching on the chessplayer: say "The switch is just for show: it must not really work by gears, but by summoning the spirit of some dead gamesman."

East of the Upstairs is the Private Parlor. The description of the Parlor is "A sitting room of the family, in old times, and familiar territory to you now as well. Your bedroom is just south; other bedrooms, mostly smaller, in other directions."

A bentwood table is in the Private Parlor. A jigsaw puzzle is on the table. Understand "picture" as the jigsaw puzzle. Understand "piece" or "pieces" as the puzzle when the jagged piece is not visible. Understand "jigsaw" as the jagged piece when the jigsaw puzzle is not visible. It is fixed in place. The description of the puzzle is "His latest offering: he brings you all the most innocent toys he can find, to occupy your time and make you less miserable. This one is nearly finished, missing only one piece that neither of you could ever find." Instead of looking under the table when the jagged piece is not handled, say "[if the jigsaw puzzle is examined]You have looked, many times. The trouble is, the floorboards aren't very well-fitted, and the piece could easily have fallen through to the room below[otherwise]Nothing much appears under the table[end if]." Instead of looking under the table: say "You glance down there but find nothing of interest."

Instead of reading the jigsaw puzzle: try examining the jigsaw puzzle. Instead of taking the jigsaw puzzle: say "If you took it, the pieces would fall apart."

Understand "solve [something]" or "complete [something]" or "finish [something]" as solving. Understand "finish [someone]" as attacking.

Solving is an action applying to one thing, requiring light. Instead of solving the jigsaw: if the jigsaw is solved, say "It's finished already." instead; say "You haven't got the final piece." Carry out solving something: say "That's not a meaningful action in this case." Before putting the jagged piece on the jigsaw: try solving the jigsaw instead. Before inserting the jagged piece into the jigsaw: try solving the jigsaw instead.

Definition: the jigsaw is solved if the jagged piece is part of the jigsaw. Definition: the jigsaw is unsolved if the jagged piece is not part of the jigsaw.

Instead of solving the jigsaw when the player carries the jagged piece and the jigsaw is not solved:
	now the jagged piece is part of the jigsaw; 
	say "You snap the final piece into place.

Nothing tremendous happens, but the picture is complete.";
	now the description of the jigsaw is "The table is set for two: a robed king, and the devil. Between the two of them is a quill pen, jet black, and a huge book. The dialogue of these two characters is written on tiny gilt scrolls that spool out of their mouths, and this is what you could not read before the jagged piece was found: the devil is saying, 'TIME IS ON MY SIDE,' to which the king replies, 'BUT NOT FOR LONG.'";
	try examining the jigsaw.

The Green Bedroom is southwest of the Private Parlor. "Having more personality than most of the bedrooms, it was decorated for someone specific and has been left that way: green and white, with a simple rustic cast unusual for the palace."  The Green Bedroom contains a bed called green bed.

The royal portrait is a reminder in the Green Bedroom. It is fixed in place. "The chief exception is the [royal portrait] on the wall[if the miniature is seen], hung at a height and in a position that reminds you of the miniature in the Zoo[end if]." The description is "A portrait of a young, arrogant king: not a prince, but one who inherited early and used his power from the beginning. He stares out with bitterness, perhaps even resentment." Instead of looking under the royal portrait: say "It is attached to the wall in the ordinary way, and there is nothing of interest behind." The memory of the royal portrait is "'That was me,' he told you. 'Before I was changed. Do you think I was handsome?'

You shrugged. Handsome, yes, but proud, selfish, resentful, perhaps cruel. 'The painter did not do justice to your personality,' you replied.

'You're wrong,' he said. 'And I put the painting here to punish the woman who slept here. She treated me with justice, and I could not forgive her.'

He refused to tell you the rest. 'You like me more than you should, and trust me less,' he said. 'If I told you the rest of this particular story, you would neither trust nor like. There, that's a warning for you.'"

The Guest Bedroom is east of the Private Parlor. "Made up for the reception of a guest who will never arrive again. A [tapestry] recalls the story." The Guest Bedroom contains a bed called guest bed. 

The stool is a portable enterable supporter in the Guest Bedroom. It is pushable between rooms. "Still here at the center of the room is [the stool] you and the Beast used, the time he tried to teach you to dance -- not a great success, but more effective than the experiment with stilts." The description is "An ordinary three-legged stool, like the one your cat at home liked to sleep on." After entering the stool: say "You stand, a little precariously, on the stool, and are now more or less the same height as an ordinary person." After dropping the stool, say "You set the stool down next to one wall."

Understand "dance [text]" as a mistake ("Despite all his lessons, you never did get the knack of it.").

The tapestry is scenery in the Guest Bedroom. The description of the tapestry is "It is hard to make out the story from the faded threads, but it appears to show a very small man, almost a dwarf, who holds on a leading string a very large demon, almost a god." Understand "demon" or "dwarf" or "god" or "man" as tapestry.

The Empty Bedroom is southeast of the Private Parlor. "Like a monk's chamber compared to every other part of the palace, just bare walls now. Here your father stayed, when he made his ill-fated journey to the castle. The Beast told you this, on your first visit." 

The shackle is in the Empty Bedroom. "On the wall, as a curio, hangs an open [shackle] -- sign of the only person ever to have escaped the power of this place." The shackle is wearable. Instead of wearing the shackle: say "You already wear a shackle of a sort." The description is "A curious object, a broken shackle. Nowhere else in the castle are there any chains or ropes or devices of torture; there has never been a need for such physical coercion..." The shackle is a reminder. The memory of the shackle is "Your father claims to have been chained up, but the Beast never made the least effort to restrain you with chains or bars. On the contrary-- but that remains a puzzle."

The Crystal Bedroom is south of the Private Parlor. Understand "my bedroom" as the crystal bedroom. "A fantasia of gleaming and glittering, chandeliers and [mirrors]: all that shines or reflects has been moved here, into this room that you inhabit, which he never enters.

The south end of the room is most dazzling, because of the daylight from the balcony." Some mirrors are scenery in the Crystal Bedroom. Understand "gleaming" or "chandeliers" or "mirror" or "chandelier" or "glittering" as the mirrors. The description is "You learned, long ago, that the mirrors would keep him away; and then, when you had less need to keep him at bay, you kept them anyway, so as not to disturb him by returning them to the rest of the palace." The Crystal Bedroom contains a bed called large bed.

Understand "balcony" as the generic surroundings when the location is the balcony.

Before going to the Balcony:
	say "You step out into the rain[if the player wears the helmet]; the fat droplets sound like hail on the surface of your helmet[end if].";

The Gilded Balcony is south of the Crystal Bedroom. "A ridiculous filigreed balcony that is like nothing so much as a birdcage: and from here you can see all the way across the moat, across [the forest], the plain, to the edge of [the sea], only by staring long enough in any direction[if Gilded Balcony is unvisited]. 

When you first came here, the balcony was full of plants in pots: poison oak, nettles, nightshade, datura. 'They grow best here,' he explained. 'Don't touch them.' And he took them away, and you have never seen them again since[end if]."

Instead of facing northwest in the Gilded Balcony: say "That way is just more castle wall, of course." Instead of facing northeast in the Gilded Balcony: say "That way is just more castle wall, of course." Instead of facing south in the Gilded Balcony, try examining the forest. Instead of facing down in the presence of the moat, try examining the moat. Instead of facing southwest in the Gilded Balcony, try examining the forest. Instead of facing southeast in the Gilded Balcony, try examining the forest. Instead of facing up in the presence of the rain, try examining the rain.

The forest is a view in the Gilded Balcony. Understand "branches" or "trees" or "leaves" or "leaf" or "tree" or "pasture" or "pastureland" or "plain" or "home" or "family home" as the forest. "A considerable expanse of evergreen forest -- the view sharpens under your gaze if you wish, showing you individual trees, branches, leaves; or widening out again to show you rolling miles and then the pastureland beyond. 

If you look exactly the right direction and squint, you can see your family home, and that is what triggered the attack of homesickness in the first place." 

Understand "squint" as a mistake ("You squinch your eyes, but do not substantively change what you're able to see.").

The sea is a view in the Gilded Balcony. Understand "ocean" or "wave" or "ship" or "ships" as the sea. Instead of facing the forest for the second time: try facing the sea. The description of the sea is "If you look long enough, your vision expands until you can see the ocean, grey and clouded with storms, that took your father's livelihood and brought your family to ruin."

Swimming is an action applying to nothing. Understand "swim" or "dive" as swimming.

The moat is a view. Understand "oily" and "splashing" and "brown" and "water" as the moat. It is in the drawbridge and the Gilded Balcony. The description is "The moat is full of slightly oily brown water. If you had been physically imprisoned, you might have tried to swim across; so it is just as well that you were not." The sound of the moat is "occasional splashing". The scent of the moat is "aquaceous plant-life with an undertone of slime". Instead of swimming in the presence of the moat: try swimming in the moat. Instead of swimming in the moat: say "Both unappealing and unnecessary."

Before inserting something into the moat: say "The surface of the moat is too low for you to reach -- not that you're greatly eager to come into contact with that water, anyway." instead.

Understand "swim in/across [something]" as swimming in. Swimming in is an action applying to one thing. Carry out swimming in: try swimming instead.

Section 2 - The Bellroom

[The Bellroom is one of the most important rooms in the game, to which the player will have to return repeatedly in order to get the means to control his environment. So it gets a little more care than average:]

The Bellroom is north of the heavy door. Understand "bell room" as the Bellroom. The heavy door is north of the Private Parlor. The heavy door is a lockable door. The small key unlocks the heavy door. The description of the heavy door is "It looks thick enough to block sound." Understand "thick" as the heavy door. [* The behavior of the Bellroom door is tied to the Stinky region -- see below.] 

Definition: the small key is solved if it is handled. Definition: the small key is unsolved if it is not handled.

The Bellroom is east of the White Gallery. East of the Bellroom is the Apothecary. 

The description of the Bellroom is "Kept, conveniently, close to where the masters of the house would once have slept. There are bells large and small, clappers, tambourines, and gongs. Most of these you have never seen used at all." The bell collection is scenery in the Bellroom. Understand "bells" or "clappers" or "clapper" or "tambourine" or "tambourines" or "gongs" as the bell collection. Understand "gong" as the bell collection when the bronze gong is not visible. Instead of searching the bell collection: say "There are hundreds, perhaps thousands of these bells; you could not hope to enumerate them all. Some are so old and dusty, in the back ranks, that they cannot have been used in centuries."

The north window is a backdrop. It is in the Bellroom and the Apothecary. It is not scenery. The initial appearance of the north window is "Roses from the garden below have crept up to grow around the [north window], lending a sickly smell to the place." The description of the north window is "You can't really see out through the framing vines.". Understand "roses" or "rose" or "vine" or "vines" or "framing" as the north window. Instead of searching the north window, try examining the north window. The scent of the north window is "decay".

Understand "look out [something]" as searching. [* Because beta-testers wanted to be able to look out the windows.]

Rule for listing nondescript items of the Bellroom:
	say "Catching your eye among many other unfamiliar items"; 
	list the contents of the Bellroom, as a sentence, 
		tersely, listing marked items only, prefacing with is/are, 
		including contents and giving brief inventory 
		information; 
	say "."

Understand the commands "play" or "shake" or  "ring" as "hit". Understand "ring [ringer]" as attacking.

The worked bronze gong is in Storage-Box. The description is "A heavy thing that you have never seen rung. The upper surface is hammered with the sign of an elephant." 

Instead of attacking the bronze gong for the first time:
	say "You hesitate. He told you not to play idly with the bells whose purposes were unknown to you, you see..."

Instead of attacking the bronze gong:
	say "You strike the gong, but to your disappointment, nothing happens."
	
Instead of attacking the bronze gong in the presence of the elephant harness:
	if the player can see the Beast, continue the action;
	say "You strike the gong, and there is a faint sound, not the full-throated bong you might expect. The harness [italic type]moves[roman type] just a little, as though to say that there is life in it yet; that something still waits and listens for the gong, in case it is needed for use against a wayward king."

Instead of attacking the bronze gong in the presence of Elzibad:
	if the player can see the Beast, continue the action;
	say "You strike the gong, and there is a faint sound, not the full-throated bong you might expect. In the portrait, the elephant turns its painted head to look at you, and it smiles; lifts its foot a little and stomps harder, as though to say, 'here is how tyrants are ended.'"
	
A person can be alive or deceased. A person is usually alive.

Instead of attacking the bronze gong in the presence of the beast:
	if the glass bell is not in Storage-Box
	begin;
		say "You strike the gong and it rings very loudly, as though summoning someone out of a world three over from our own. Then what looks like a large dark cloud descends on the Beast and crushes the last life out of him, like a trodden grape.

What is left is the husk of a man, not too mangled, but certainly dead. You peer curiously into that face, whose expressions you saw only on an animal's maw: but he doesn't look like anyone you recognize. Then his body fades away, just the way the bells always fade.

You find you are laughing a little hysterically.
	
His servants remain enslaved, however."; 
		move the gong to the Bellroom;
		move the Beast to Storage-Box;
		now the beast is deceased;
	otherwise;
		say "You strike the gong and it rings very loudly, as though summoning someone out of a world three over from our own. Then what looks like a large dark cloud descends on the Beast and crushes the last life out of him, like a trodden grape.

Afterward, when you can see, and think, you know that you have helped matters only so much: the Beast is gone, but the servants remain enslaved, no doubt inherited by the next of the line.";
		end the story saying "You have punished the Beast for his sins, but his servants remain enslaved to the line of Kings";
	end if.

The little gold dinner bell is in the Bellroom. The description is "It is the dinner summons, and particularly familiar to you."

The silver bell is in the bellroom. Understand "lamplighter" as the silver bell. The description of the silver bell is "It bears the stamp of a lamplighter."

Instead of attacking the gold dinner bell when location is not the Kitchen:
	if the player is in the Dining Hall, say "You ring the bell hopefully, but apparently it only works in the Kitchen itself.";
	otherwise say "You ring the bell, but those who might hear and heed it are not close enough."

Instead of attacking the gold dinner bell when feast is in Storage-Box:
	if location is not the Kitchen, continue the action;
	say "[The dinner bell] tinkles gaily: as in automatic response, your stomach rumbles. There will be a feast, now, waiting for you in the dining hall.

As for the gold bell, it returns to its place.";
	move the gold bell to the Bellroom;
	move feast to the Dining Hall.
	

A grail is a kind of thing. The feast is a grail. The candle is a grail. 

The silver bell is a ringer. The gold bell is a ringer. The gong is a ringer.  The target locale of the silver bell is the Translation Room. The target locale of the gold bell is the Kitchen. The target locale of the gong is the Gallery of Historical Paintings. The glass bell is a ringer. The target locale of the glass bell is the Lie Library. The glass bell is in Storage-Box. The description of the glass bell is "Thick glass with a clapper on a chain."

The leather tambourine is a ringer. The target locale of the tambourine is the Empty Bedroom. The tambourine is in Storage-Box. The description of the tambourine is "A hoop stretched with good-quality leather."

Instead of attacking the leather tambourine when the player carries the shoes and the shoes are not wearable:
	if the player is not in the Empty Bedroom, continue the action;
	move the tambourine to the Bellroom;
	now the shoes are wearable;
	say "A brisk wind fusses about your feet, then does something to the shoes, resizing and slightly reshaping so that they might have a hope of staying on you."
	
Instead of attacking the leather tambourine when the player does not have the shoes and the shoes are not wearable and the player is in the Empty Bedroom:
	say "You are whisked-about by a busy wind, but, finding nothing about you which it is able to assist with, it departs again."
	
The cow bell is a ringer. Understand "cowbell" as the cow bell. The target locale of the cow bell is Crystal Bedroom. The cow bell is in Storage-Box. The description of the cow bell is "Much like the ones you used on the cows at home."

Instead of attacking the cow bell in the Virgin's:
	say "You feel a strong sense of presence, and listening: this place is important, but the spirit cannot speak to you here. It's for this kind of situation that the mirror-scrying was used, when Lucrezia still lived in the castle..."

Instead of attacking the cow bell in the Green Bedroom:
	say "A presence coalesces, weeps, and tries to speak; but there is no mirror to show it fully, here."
	
Instead of attacking the tambourine in the presence of the mirrors:
	say "An aggrieved, overworked shoemaker appears, just as he looked in the image in Lucrezia's study. He presses his fingers to the glass and begs you in a few words to let him rest; then departs again into the shadows of the east wall, to wherever he natively rests."
	
Instead of attacking the tambourine: say "It does not resonate as it should."

Instead of attacking a ringer in the scrying room:
	say "You ring [the noun] hopefully, but -- despite the old function of the room -- there are no mirrored surfaces remaining in which your summoned spirit can manifest itself, because you took those all upstairs to your bedroom."

Instead of attacking a ringer in the presence of the mirrors:
	say "Many faces press to the far side of the mirror, but no one shade has the strength to speak, and finally they fade away again, half-damned."

Instead of attacking the cow bell in the presence of the mirrors when the girdle is in Storage-Box:
	move the girdle to Virgin's End;
	move the cow bell to the bellroom;
	say "You ring the [cow bell], and a heavy fog coalesces around you; then at the mirror there forms the image of an exceptionally beautiful young woman, wearing a green girdle.
	
'It is a long time since I was called,' she says, pressing her nose and fingers to her side of the glass and looking at you with interest. You see around her neck the burn of a noose, and guess uneasily at what she did to herself. She looks at you with plain curiosity.

'So you're the one?' she asks. 'Did you know that he carried me over the drawbridge into the castle, and made me slave to his wishes even though I was betrothed to another? and that for the breach of contract my father died impoverished?'

You say nothing. You have not known him to be like that; but many human lifetimes have passed since Yvette was alive.

She shrugs one shoulder. 'If you can love such a creature, then I will leave the green girdle for you on my grave; you come take it and kiss him,' she says. 

Then she fades from view."

Instead of attacking the silver bell when candle is in Storage-Box:
	if the location is not the Translation Room, continue the action;
	say "[The silver bell] rings once in triumph, and the room springs to brilliant light.
	
The bell itself fades back to its usual place.";
	move silver bell to Bellroom;
	move candle to the Translation Room. 
	
The description of the Apothecary is "Furnished with [a long countertop] and the equipment of an apothecary; sketches from physicians; [anatomical drawings] of creatures similar to the Beast, bears and lions being especially prominent; also [poison reference books], primarily the work of Italian and (earlier) Persian experts. The room has an unused air, and you do not remember ever coming in before, or seeing the Beast go in. It must have been a hobby that interested him before your arrival."

The long countertop is scenery in the Apothecary. It is a supporter. The description is "The countertop has water stains and the occasional burn on it." Understand "table" or "counter" as the countertop.

The equipment is scenery on the countertop. The description is "Delicate scales and glass bottles, blades and mortars and drying racks and other things you do not recognize." Instead of doing something when the equipment must be touched, say "The conviction that these recently contained powerful contact poisons makes you reluctant to handle them in any way."

To decide whether (item - a thing) must be touched:
	if the item is the noun and the action requires a touchable noun, yes;
	if the item is the second noun and the action requires a touchable second noun, yes;
	no.

Some poison reference books are scenery in the Apothecary. The description is "Assorted disturbing recipes for ways to make your enemies die quickly, or to dispatch them slowly in great pain. The pages most discolored by use and splashed ingredients are those pertaining to swift and pleasant execution." Understand "book" as the reference books. Instead of taking the reference books, say "There are too many of them to carry around, and besides, you lack the skill to concoct poison, even if you wanted to."

The anatomical drawings are scenery in the Apothecary. Understand "drawing" or "diagram" or "bears" or "lions" or "sketches" or "sketch" or "digestive tract" as the drawings. The description of the anatomical drawings is "They concentrate on weak points and the functioning of the digestive tract."
	
Chapter 9 - Assigning Rooms to Regions

[It's usually a good idea to define regions and views sometime after the rooms themselves are defined -- this is not strictly necessary, but doing things in this order does reduce the likelihood of confusion and name clashes. So we save the regions for here:]

Some rain is a view. It is in the Courtyard, the Rose Garden, the Gilded Balcony, Burnt Frame, and the Drawbridge. Understand "clouds" or "cloud" or "sky" or "grey" or "pattering" as the rain. The description is "The raindrops seem to you larger and colder than you remember." The sound of the rain is "pattering". The scent of the rain is "damp earth and electricity". The refusal of the rain is "There is little you can do with the raindrops." Instead of tasting the rain: say "Faintly salty."

The Great Outdoors is a region. The Drawbridge is in the Great Outdoors. Understand "outside" as the Great Outdoors.

The Basement is a region. Rocky Chamber, Bear Corridor, Zoo, Rooted Room, Lucrezia's Study, Bell Castings,  Wax Supply, and Tight Passage are in the Basement. Understand "underground" as the basement.

The Haunted Area is a region. Virgin's End, Father's Regret, Debtor's Paradise, Apprentice's Workshop, Central Crypt, the Dank Room, and Press Room are in the Haunted Area. The Haunted Area is in the Basement. 

Hourglass is a region. Lower Bulb and Upper Bulb are in Hourglass. Instead of going to Hourglass when the player wears the helmet: say "You walk far enough in to get a view of sand falling in a huge hourglass. Though it is only a thin stream, it sounds louder than it should: the noise, magnified by your helmet, becomes too much to bear, and you retreat."

State Rooms is a region. Law Library, Lie Library, Translation Room, State Rotunda, Parliamentary Chambers, Burnt Frame, Smoke-Damaged Chamber, Black Gallery, Armory, and Records Room are in the State Rooms. Hourglass is in State Rooms. The Gallery of Still Life is in the State Rooms.
	
Apartments is a region. Private Parlor, Guest Bedroom, Upstairs, Green Bedroom, Crystal Bedroom, Gilded Balcony, and Empty Bedroom are in Apartments.

Stinky is a region. The White Gallery, Bellroom, and Apothecary are in Stinky. Understand "control rooms" as stinky.

The stench is a view in Stinky. Instead of smelling the stench, try examining the stench. The scent of the stench is "nauseatingly cloying stink". The description of the stench is "It reminds you of the rose garden -- multiplied several times over." After going to a room when the player can see the stench: say "You get far enough to glimpse [a random mentionable thing which is in the location] before being overcome: you reel back from a smell of roses and death, so powerful that you can't go forward. Until there's a breeze through here, you won't be able to stand being in the place."; move the player to the last location.

Definition: a thing is mentionable:
	if it is the player, no;
	if it is a view, no;
	if it is the generic surroundings, no;
	yes.

Fresh breeze is a scene. Fresh breeze begins when fresh breeze has not happened and the thick door is open and the heavy door is open. Fresh breeze ends when the time since fresh breeze began is 2 minutes. 

When fresh breeze begins: if the player can see the thick door or the player can see the heavy door, say "With both doors open, a breeze begins to blow through the smelly area.". When fresh breeze ends: now the stench is nowhere; if the player can see the thick door or the player can see the heavy door, say "The worst of rose stink has mostly gone, now."

[There are a variety of ways to close off part of a game's geography, and Bronze explores many of them: place a whole area behind a single locked or concealed door (as with the ivory door and the Lie Library area, or the trapdoor and the Press Room); make an area that can only be visited while the player is carrying some object (all the dark places, and particularly the haunted area, which requires both the candle and the shoes); or this approach, which is to have multiple entrances and require that the player visit all of them before being allowed in. 

These are all unsubtle pacing mechanisms to make sure that the player experiences the game in the order we intend. In this case, because the player has to open the door to the White Gallery, we are guaranteed he will not get to the Bellroom until he has already solved the State Rooms and probably visited at least some of the Law Library and Translation Room areas. This means he probably won't get the feast before finding the Beast, or discover the bells before he has some inkling what they're for.

Using different pacing tricks in different places makes the game a bit more entertaining (we hope); and besides, it leads to a more interesting geography if single-point-of-access areas are not too numerous. Having a well-connected map means that the place feels more realistic and three-dimensional, and that the minimum number of moves between any two points is kept relatively low.]

Old Castle is a region. Scarlet Gallery, Treasure Room, Scarlet Tower, Gallery of Historical Paintings, Maze are in Old Castle.

Enclosed is a region. Rose Garden, Cloister Walk, Scrying Room, and Walk's End are in Enclosed. Understand "rose cloister" as Enclosed.

Main Castle is a region. The Quarters, Guard Tower, Dining Hall, Kitchen, Entrance, Courtyard, and Ground Floor are in the Main Castle.

To say regional area:
	if in darkness, rule succeeds;
	if location is in Basement, say "Basement";
	if location is in Great Outdoors, say "Great Outdoors";
	if location is in State Rooms, say "[if location is in Hourglass]Hourglass, [end if]State Rooms";
	if location is in Apartments, say "Apartments";
	if the location is in Stinky, say "Control Rooms";
	if location is in Old Castle, say "Old Castle";
	if location is in Enclosed, say "Rose Cloister";
	if location is in Main Castle, say "Main Castle".
	
 
	
Part 3 - The Plot

Chapter 1 - Encouragement

[Here we have a few light elements to nudge the player along. These are fairly trivial and fade out as the game proceeds, but during the first portion, when he has nothing to do but explore, we want to keep him focused on moving from room to room, so that he knows this is the right thing to be doing.]

When play begins:
	now the player is seen;
	say "When the seventh day comes and it is time for you to return to the castle in the forest, your sisters cling to your sleeves. 
	
'Don't go back,' they say, and 'When will we ever see you again?' But you imagine they will find consolation somewhere.
	
Your father hangs back, silent and moody. He has spent the week as far from you as possible, working until late at night. Now he speaks only to ask whether the Beast treated you 'properly.' Since he obviously has his own ideas about what must have taken place over the past few years, you do not reply beyond a shrug.
	
You breathe more easily once you're back in the forest, alone.

[paragraph break]"

The Search is a scene. Search begins when play begins. Search ends when the player can see the Beast.

Scouring Main Castle is a scene. Scouring Main Castle begins when play begins. Scouring Main Castle ends in completion when every room in the Main Castle is visited. Scouring Main Castle ends in irrelevance when Search ends.

When Scouring Main Castle ends in completion: 
	if the location is the Ground Floor
	begin;
		say "Upstairs. That must be the solution. You'll find him up there, and everything will go back to normal; as it always does after a fight or disagreement or odd patch. Sooner or later things just right themselves and resume as they have always gone.";
		rule succeeds;
	end if;
	say "So he's not among the kitchen things.";
	if a room in Apartments is unvisited
	begin;
		suggest upstairs;
	otherwise;
		if every room in Old Castle is visited, 
			suggest downstairs;
		otherwise suggest old castle;
	end if.


Scouring Old Castle is a scene. Scouring Old Castle begins when the location is in Old Castle and Scouring Old Castle has not happened. Scouring Old Castle ends in completion when every room in Old Castle is visited. Scouring Old Castle ends in irrelevance when Search ends.

When Scouring Old Castle ends in completion: 
	say "He's not down here, then, in the east wing.[paragraph break]";
	if a room in Main Castle is unvisited
	begin;
		suggest Main Castle;
	otherwise;
		if every room in Apartments is visited, 
			suggest downstairs;
		otherwise suggest upstairs;
	end if.

Scouring Upstairs is a scene. Scouring upstairs begins when the location is in Apartments and Scouring upstairs has not happened. Scouring upstairs ends in completion when every room in Apartments is visited. Scouring upstairs ends in irrelevance when Search ends.

When Scouring Upstairs ends in completion: 
	say "He's not upstairs, then: there's nowhere in these rooms he could have been hiding, no space large enough to conceal him.[paragraph break]";
	if a room in the Old Castle is unvisited
	begin;
		suggest old castle;
	otherwise;
		if every room in Main Castle is visited, 
			suggest downstairs;
		otherwise suggest Main Castle;
	end if.
	
To suggest Main Castle:
	if the Dining Hall is visited and the Kitchen is visited and the Quarters is visited
	begin;
		say "Perhaps he's in one of the side rooms you've not visited yet...?";
	otherwise;
		say "There is still the chance that he's somewhere in the kitchen wing, west of the entrance hall. Maybe he got hungry.
	
(He never liked to eat in the dining hall alone, and took it up only when you were around. But maybe he's gone there for some reason anyway?)";
	end if.
	
To suggest downstairs:
	say "He must have gone into one of the more... difficult portions of the castle. The state rooms, or the crypt. One of the places he knows you hate to visit alone. 
	
This does not bode well for his state of mind. (Will he be angry? It has been a long time since he was truly angry at you... But you cannot deal with that until you find him.)";

To suggest upstairs:
	say "A new thought occurs to you: perhaps he's waiting for you upstairs, diverting himself with one of the toys or game he brought you. No point in worrying until you have checked the apartments, surely."

To suggest Old Castle:
	say "Perhaps he's [if location is in the Apartments]downstairs somewhere,[otherwise]over[end if] in the east wing. That would make sense. You find those rooms dreary and cold, but he spends time there when he wishes to be alone; perhaps..."


Foodgetting is a scene. Foodgetting begins when Search ends. When foodgetting begins: 
	say "'Nothing bad will happen for the first seven days,' he said, when you left.

And yet here he is, looking very nearly dead." 

Understand "greet [text]" as a mistake ("Unlikely to help much.").

Foodgetting ends when the player carries the feast. When foodgetting ends: 
	say "Perhaps he will feel better when he has eaten, you reflect. He has always had a large appetite -- the result of his change in form, he tells you. 
	
He used to mock your dainty eating, and sit at table long after your plate was empty; and make a game of guessing foods that might tempt you to eat even a little more; vanishing into the kitchen to instruct the staff, and returning a little later; saying roguishly, 'This, I think you will like...'
	
In your defense, you never had sugared violets at home."


Before going to an unvisited room (called destination) during Search:
	if destination is the Crystal Bedroom or the destination is the Gilded Balcony, continue the action;
	if destination is in the State Rooms and the windchimes are in the Rose Garden, continue the action;
	if destination is dark and the player is not carrying the candle, continue the action;
	if most of the rooms are visited
	begin;
		move the Beast to destination;
	end if.
	
Considering Beast is a scene. Considering beast begins when the player can see the beast and Considering Beast has not happened and the player is wearing the girdle. When Considering Beast begins, say "When you look at the Beast this time -- it must be the influence of the girdle -- you see him as more animal than human, though you long ago learned to discern a man's expressions on his face.

[italic type]I was afraid of him[roman type], says the memory of Yvette in your head, as though she's trying to justify herself to you. There are other thoughts as well, murkier; but you are left with the impression that she killed herself, in the end, not because of her family's misfortunes or the lord she was separated from; but because she was carrying a child, and feared that it would be born some kind of monster." Considering Beast ends when the time since considering beast began is 1 minute.
	
Chapter 2 - Recollections

To say memory:
	repeat through the Table of Memories
	begin;
		say "[reply entry]";
		blank out the whole row;
		rule succeeds;
	end repeat.
	
Table of Memories
reply
"'You can leave at any time,' he said, when he first spoke to you. You stared at him, surprised that someone with his face and teeth was capable of human communication. 'Would you like to go?'

There are other memories, more recent, of course. Every glance around the room reminds you of a different one."
"'I'm surprised you haven't gone home yet,' he said very early in your stay.

'I've heard stories,' you replied. 'As if there weren't enough to see around the castle. I know what happens to your servants who try to leave you.'

'Nothing bad would happen to you,' he said. But you could not believe him, not with all the captured spirits, not with the stories, not with the evidence around the castle."
"'And now -- would you like to go home?'

You bit your lip. It had been a pleasant conversation, up until now, when you are reminded: however nicely he may behave, he is still the king of a cursed line, and not to be trusted."
"'I assure you,' he added. 'No harm will come to you if you do go.'

'I only have your word for that,' you replied, looking stubbornly into your soupbowl.

He sat. 'I am unable to lie to you,' he said. 'It is one of the conditions placed upon us. We can only tell the truth.'

'And why should I believe that?'

He raised his glass. 'I'll try again tomorrow.'"
"'Were you ever married?' you asked, ignoring his question.

'No.'

'Then you have no heirs?'

'I have no legitimate sons,' he replied. 'But I certainly have an heir, somewhere. If I died, somewhere, someone would inherit all this, and the whole system would go on as before, the servants and the contracts. But don't worry: I have tried, and it turns out that I don't die easily.'"
"'And you promise I would not regret it? Truthfully.'

He coughed. 'I don't know your future. And -- since you ask I must answer -- I don't think much of your father, a man who would barter his daughter's service for his own, especially since he had unflattering ideas of what I would do with you.'

You sputtered. 'Well of course you couldn't-- I mean, being an animal...'

His teeth gleamed. 'I assure you I could,' he said. 'But I won't.'"
"'I have become used to it here,' you answered, surprising yourself. 'There is plenty to read; there is the chessman, and games; and you are good company.' He raised his glass with a half smile. 'You'd rather stay here without me?'

'No,' he said."
"'I c-care for you,' you said. 'I am lonely without you, and you make me laugh, and you're nice...'

'Stop,' he said. 'And remind me never to order the port again.'

He picked you up from your chair and your head rested on his shoulder. 'But why can I not be in love... Oh, carry me carefully on the stairs: I feel sick!'

'Simply, pet,' he said, walking slowly up the steps. 'What you offer I couldn't accept. In fact, I'm not sure what you are offering. Do you have some fantasy of marrying me? Being my mistress?'

You could not think of the answer; there was no solution that was not absurd. He set you down carefully on the bed and went away. A moment later he came back, bright crimson bell in his left paw. 'When you wake in the morning and are very ill, which you will be, ring this and the servants will bring a tonic appropriate to your condition.'"
"'For a visit, if you won't go to stay?' he asked. 'We could arrange that too, if you liked.'

'And nothing bad would happen to anyone I cared about?' you demanded.

'Nothing bad would happen to you or to your family. There would be no ill health and no spiritual repercussions.'

'You're leaving something out,' you said, having gotten familiar with the precise way he speaks when hedging around a difficult fact.

'It could be unpleasant for me,' he replied, strained. 'But you mustn't stay because of my feelings on the matter. Your family miss you, and I am the villain in this piece.'"
"'Don't mention the leaving thing once more,' you said. 'Or I will throw a glass at your head.'

He sighed. 'You are as stubborn as you are honorable,' he said. 'No doubt the two are related.'"
"After a long time: 'You haven't asked me to leave in a while,' you said. 

'Ah.' He looked at his plate of food. 'Of course you may go. I'm glad you believe my word about the effects, now.'

'I will go to visit my family,' you say, stressing the word visit. 'On condition that you tell me how to do it so that I will not harm you. If you won't do that, I don't go.'

He looked at you, his expression cloudy. 'There is a very good reason why...'

'Those are my terms.'

He sighed. 'Very well,' he said. 'If your trip lasts fewer than seven days, it will have no effect on anything here.' He looked down at his curled paw. 'But if you don't come back -- and I imagine you won't -- I will forgive you.'"

[Now, when we have all the rooms defined, might also be a good time to make the shoes work:]
	
Table of Beast Thoughts
spot	reply
Burnt Frame	"[italic type]A spectacular but unsuccessful attempt. My fur was singed and foul-smelling for weeks[roman type]."
Zoo	"largely self-disgust, the image of himself as the kind of creature who belongs here. He really has very good manners. There are whole evenings when you almost forget that he isn't shaped like a man.[line break]"
Virgin's End	"[italic type]They died without marrying those to whom they were betrothed, but not all died maidens[roman type]. Impossible to tell the tenor of that particular thought. [italic type]Not all of them are to my account, I hasten to add[roman type]."
Gallery of Historical Paintings	"amusement. [italic type]Poor old Elzibad. Though I suppose it wasn't so funny at the time. Remind me to tell you-- but I may not have the chance, I suppose[roman type]."
Walk's End	"an unexpected burst of sentiment. He loves this place, because he so often spoke with you here, and it is overlaid with odd glimpses of yourself, gestures and expressions you did not know looked so funny.[line break]"
the Scrying Room	"[italic type]Mostly we used all this for communicating with the enslaved, bringing their spirits to the mirrors to speak to us. That was easily done, by ringing the bells. The more difficult stuff, real prophecy, foresight -- only a few of our line ever had those powers. Lucrezia, mostly[roman type]."
Study	"[italic type]Interesting. They never let me in here. But then, Lucrezia wanted to bring the family to ruin, so perhaps that is why[roman type]."
Scarlet Tower	"all old innocent recollections, playing at knights when he was still a boy, long ago."
Drawbridge	"[italic type]I'm not sure you can leave just now, poppet[roman type]."
Press Room	"mostly loathing and fear much stronger than your own, but whatever he knows does not come through to you."
Lie Library	"[italic type]Ah, now here's an interesting little locale. Lucrezia had it built. She was always her father's daughter, you perceive. It is so powerful that it makes false the things that are brought in -- I used it once to void a lady's marriage contract --[roman type]

The thread of thought stops. [italic type]On second thought, that is not a story I am proud of[roman type]."
Records Room	"[italic type]We have always retained an extraordinarily good secretary and historian. If there is any good in this damned arrangement[roman type]..."
Green Bedroom	"[italic type]Remorse. Mostly strong remorse. And maybe a faint touch of resentment that things went bad so unexpectedly. That's not a thought I'm proud of[roman type]."
Empty Bedroom	"[italic type]I told your father I doubted anyone would willingly trade places with him. In the whole history of my family, I don't know of a single person who has exchanged contracts, until you[roman type]. Then -- what might be your thought or might be his -- [italic type]He wasn't worth it, you know[roman type]."
Crystal Bedroom	"affection, longing, guilt; amusement at your innocence and anger at your blindness; frank desire. Such a tangled, terrifying mess of emotion that you barely recognize yourself in the mirrors.

[italic type]Sorry[roman type]. The thought is sleepy and not entirely comforting."
Crystal Bedroom	"just a suppressed agitation this time, and some emotions you might not be willing to call love. [italic type]I won't hurt you[roman type]."
Gilded Balcony	"[italic type]Thought the cage metaphor quite unsubtle; but I thought you might like it anyway, being able to see all that distance. This room is built above the watchtower down below, you see, part of a vertical line of power[roman type]."
 

After going to a room when the player wears the shoes:
	if in darkness, continue the action; 
	if the player is hurrying, continue the action;
	repeat through Table of Beast Thoughts
	begin;
		if spot entry is location
		begin;
			try looking;
			say "The Beast's thoughts intrude on yours, courtesy of the enchanted shoes: [reply entry][paragraph break]";
			blank out the whole row;
			stop the action;
		end if;
	end repeat;
	continue the action.

Chapter 3 - Items Reserved For Later	
	 
[Items that aren't inside the map are usually said to be "out of play", but we start out with these things in "storage". This way, we can easily check later whether they have ever been brought into play, even if (like the edible "feast") they can then leave the game map again. 

There are other ways we could track this information, but I chose storage as straight-forward and easily remembered.]

Storage-Box is a container. 


The Beast is a man in Storage-Box. "And here [Beast] lies, sprawled on the ground as if he'd fallen." The description of the Beast is "[if the Beast is fed]Though he has eaten, he looks deeply exhausted, as though something preys on his spirit[otherwise]He looks starved, unwell, near death, in fact. He will need to be given food before he will properly revive -- and who knows what else...

It baffles you to find him in this condition, when he could easily have gotten whatever he needed in the kitchen[end if]."  A person can be hungry or fed. The beast is hungry. The scent of the beast is "night woods and decadent spices".

Instead of asking the beast to try doing something:
	say "'Anything in my power to grant, you may have,' he told you once. 'Only I recommend, for your own safety, that you do not request any poetry recitations or any songs, especially those taken from Italian opera.'
	
Unfortunately at the moment it does not look as though he can grant much of anything."

Instead of doing something other than finding or hunting or smelling or kissing or hinting about or waking or examining to the Beast: say "He sleeps[if the beast is hungry], or inhabits some state deeper than sleep[end if]."

Instead of waking the Beast: say "Though you shake him vigorously, he does not stir."

Instead of kissing the Beast: say "You press your mouth to his cold one, and catch the strange scent of night woods, cinnamon, and blood copper. 

He does not stir."

Instead of kissing the fed Beast when the player wears the girdle:
	say "As you do, you can't help remembering -- because of the girdle -- how many women before you this king imprisoned against their will. And why should he deserve to be forgiven, merely because he has been less cruel to you than to the others?
		
When you lift your head, he is his proper self: a man, about forty-five. Handsome, perhaps, but in the style of the lord mayor, not someone you would have aspired to wed[if the royal portrait is seen]. His face has perhaps softened a little since his youth, but he is still recognizably the same person[end if].";
	if the contract book is in Storage-Box:
		say "[line break]His fingers stretch in experiment. 'Dear virgin mother. You did it. The servants are free?'
			
You nod.

'Good girl.' He touches your cheek affectionately; then freezes. 'And you're wearing Yvette's girdle. I suppose you heard her story, in that case.' He sticks out his jaw. 'You can go now. It won't kill me, this time.'
			
You draw a breath and give him your answer.";
		end the story saying "You have restored the King and freed his servants";
	otherwise:
		say "[line break]He looks ruefully at his restored hands. 'I failed to free them,' he says. 'And now I've dragged you into the trouble with me.'
						
You shake your head, and try to calm him.";
		end the story saying "You have restored the King, but not his servants";
		
Instead of kissing the hungry Beast when the player wears the girdle:
	say "You try to kiss him, but he does not stir. Still hungry, apparently."

Instead of kissing the fed Beast: say "You press your mouth to his cold one, and catch the strange scent of night woods, cinnamon, and -- incongruously -- fish. 

He murmurs in his sleep but does not change or wake."

Instead of showing something to the Beast:
	say "He is in no condition to appreciate displays of things."

Instead of showing the feast to the Beast:
	say "Feeling hopeful, you hold the platter of food where the Beast can smell it, but this does not seem to have the desired effect. You will have to feed it to him more directly. (And didn't he do the same for you, that time when you were deathly ill and could barely move? Even though he could easily have made a servant do it.)"

Instead of giving something to the Beast:
	say "He does not move or wake up enough to take any interest."

Instead of giving the feast to the Beast:
	now the feast is nowhere;
	move the iron key to the player;
	say "With great care, you feed the soup to the Beast. So much spills that you doubt whether you are making any progress; then he swallows.
	
'You are ornery,' he says. 'I guaranteed your return -- you know what that means?'

'That if I had not come back, you would have died,' you reply.

'That is only a small part of what would have happened. The other contracts would have unraveled, the servant souls freed.'

You frown at him. 'I've been trying to use you to this purpose for years,' he says, touching your cheek. 'But you wouldn't [italic type]go[roman type]. I'm touched that you came back for me -- really, I can't tell you how much -- but you've ruined the plan.'

'Is there a way to set them free that doesn't kill you?' you ask.

He looks startled. 'Not for me,' he says. 'There's a room in the basement below the rose garden I can't get into. Lucrezia's room. You'll need to get in, search the crypt, find a way to destroy the contracts book... there are places in the castle I cannot enter, because she sealed them against all her descendants. But you are not one of her descendants, so--' He chuckles weakly at some joke, but he hands you [an iron key]. 'You'll need the shoes.'

'Would that lift the curse on you, too, do you think?' you ask.

'Unlikely. That is another matter. Less happy.' After a moment he begins to sleep again.";
	now the beast is fed;
	repurpose the player. [* This horribly bureaucratic phrase is for the hint system: we have assigned the player some new goals, so it is necessary to change a few terms of the system in order to direct him more fruitfully.]


The iron key is a passkey. It is in Storage-Box. The iron key unlocks the iron cage. The description of the iron key is "The head of the key bears the image of a treasure chest."
	
The feast is in Storage-Box. The feast is edible. Understand "food" or "platter" or "considerable" as the feast. "A considerable [feast] is set out on a platter as big as a shield." The description of the feast is "A platter heaped with -- why, you must this time have woken the chefs of King Yggdram the Piscine: it is pickled whitefish and wilted greens, hot soup made from leviathan's bones, and other dishes you do not recognize, made of things that have not grown in this vicinity for many a year." Understand "whitefish" and "pickled" and "wilted" and "Greens" and "soup" and "dishes" and "dish" and "leviathan's" and "bones" as the feast. The scent of the feast is "troutlike aroma".

Understand "feed [edible thing] to [someone]" as giving it to. Understand "feed [someone] [something edible]" as giving it to (with nouns reversed).

Instead of eating the feast, say "You restrain yourself with difficulty." Instead of tasting the feast: say "You allow yourself a sip of the soup, which goes down warm and bracing. Jonah must not have had things as bad as he always let on."

The candle is in Storage-Box. The candle is lit. "The single [candle] blazes with many times more light than one light source ought to produce." The description of the candle is "Only apparently a single candle, but giving off a great deal of illumination." Understand "light" or "lighting" or "lamp" or "illumination" or "lights" or "candles" or "lamps" as the candle. Instead of burning the candle, say "Already taken care of." Instead of blowing the candle, say "After the trouble you took?"

Instead of burning something when the player is not carrying the candle:
	say "You don't even have a source of flame."

The magic girdle is a grail. It is wearable. It is in Storage-Box. The description of the magic girdle is "It is the green girdle familiar to you from paintings here; a possession of Lucrezia's." After wearing the girdle: say "You put on the girdle, securing it around you. It fits unexpectedly well."
 

Part 4 - Making Play More Friendly

Chapter 1 - New Commands

Section 1 - Echo-location

Understand "shout [text] to/at/for [any person]" as answering it that (with nouns reversed). Understand the commands "hiss" and "whisper" as "say".
 
Instead of answering the player that something, say "Your voice echoes strangely, but no one answers."  

Instead of answering the beast that something when the beast is not visible: 
	if in darkness, make noise;
	otherwise say "You holler as loudly as you are able.";
	say "[line break]But no one replies."

Instead of answering the player that something in the Basement when in darkness: 
	make noise.
	
To make noise:
	if the location is the Crypt
	begin;	
		say "The sound bounces back from all directions; you would seem to be at the center of an open space.";
	otherwise;
		let way be the best route from the location to the Crypt;
		say "The sound echoes[if way is a direction]; if you had to guess, you would say that a larger space lies somewhere to the [way][end if].";
	end if.

Instead of attacking a ringer in the Basement when in darkness:
	make noise.
	
Understand the command "whistle" or "hum" as "sing".

Instead of singing when in darkness:
	make noise.
	
Instead of singing:
	say "You make a little noise, to cheer yourself. Then stop again, when you remember that it is a song he taught you."
	
Section 2 - Reading vs Examining
	 
A thing has some text called printing. The printing of a thing is usually "blank".

Definition: a thing is legible if the printing of it is not "blank".

After examining a legible thing: try reading the noun.

Understand the command "read" as something new. Understand "read about [text] in [something]" as consulting it about (with nouns reversed). Understand "read [something] about/on [text]" as consulting it about. Understand "read [text] in [something]" as consulting it about (with nouns reversed).

Understand "read [something]" as reading. Reading is an action applying to one thing, requiring light. Check reading: if the printing of the noun is "blank", say "Nothing is written on [the noun]." instead. Carry out reading: 
	let typing be the printing of the noun;
	say "You read: [italic type][typing][roman type][paragraph break]". Report reading: do nothing.

Instead of reading the poison reference books: say "You flip idly through some pages in Persian before admitting to yourself that this is fruitless."

Instead of reading the papers: say "You skim the annals of 1102-1105, and decide that life has really gotten more interesting since the twelfth century. However, if you want to find anything specific here, you're going to have to look it up by name."

Instead of reading the contract book:
	if the player is in the Translation Room
	begin;
		if the candle is visible,
			say "You read with interest the indenture of a certain [if a random chance of 1 in 2 succeeds]ostler[otherwise]fighting-man[end if]. Thanks to the neat way the names are written at the top right corner of each page, you could easily look up anyone, though.";
		otherwise
			say "The lettering, though now in the vernacular, is too dim and small for you.";
	otherwise;
		say "The words are in a language you don't understand: even the Beast had to take it to the translation room to make any sense of it.";
	end if.
	
Instead of reading the notes:
	say "Simply flipping through them with no particular goal in mind is inexplicably disquieting to you, as though you might learn a maddening truth if you are not extremely cautious."
	
Instead of reading the helmet when the player is not in the Translation Room:
	say "Lines of writing arc over each ear, but you do not know the language in question."
	
Before reading or examining the helmet when the player wears the helmet: 
	say "You can't, of course, get a good look at the helmet while you're wearing it, so... ";
	try taking off the helmet;
	if the player wears the helmet, stop the action.

Section 3 - Use Command

Understand "use [a ringer]" as attacking.

Understand "use [an edible thing]" as eating.

Understand "use [a wearable thing]" as wearing.

Understand "use [a closed openable container]" as opening. Understand "use [an open openable container]" as closing.

Understand "use [something preferably held] on [a locked lockable thing]" as unlocking it with (with nouns reversed). Understand "use [something preferably held] on [an unlocked lockable thing]" as locking it with (with nouns reversed).

Understand "use [a switched off device]" as switching on.

Understand "use [something]" as using. Using is an action applying to one thing. Carry out using: say "You will have to be more specific about your intentions."

Understand "use [a door]" as opening. Understand "use [an open door]" as entering. 

[And by a similar token, these create preferences in the parser so that the game will try the most obvious items first:]

Understand the commands "revive" or "resuscitate" as "wake".

Understand "eat [an edible thing]" as eating. Understand "wear [a wearable thing]" as wearing. Understand "open [something closed]" as opening. Understand "close [something open]" as closing. Understand "enter [something enterable]" as entering. Understand "enter [a door]" as entering. 

Before eating something which is not carried by the player: try taking the noun; if the player does not have the noun, stop the action. 

Before wearing something which is not carried by the player: if the noun is worn, continue the action; try taking the noun; if the player does not have the noun, stop the action.


Section 4 - Look (a direction) 

Understand "look [direction]" as facing.

Facing is an action applying to one visible thing.

Instead of examining a direction, try facing the noun.

Check facing:
	let the viewed item be the room noun from the location;
	if the viewed item is a room, try looking toward the viewed item instead.

Carry out facing:
	say "You can't see anything promising that way." 

Carry out facing up:
	if the rain is visible, try examining the rain instead;
	otherwise say "Yes, it's the ceiling. Not much help there." instead.
	
Instead of facing east in the Drawbridge:
	say "The castle just goes on and on."
	
Instead of facing west in the Drawbridge:
	say "The castle just goes on and on."


Understand "look toward [any adjacent room]" as looking toward. 

Looking toward is an action applying to one visible thing.

Check looking toward:
	let way be the best route from location to noun;
	if way is a direction, do nothing;
	otherwise say "Your view is obscured." instead;
	let count be the number of moves from the location to the noun;
	if the count is greater than 1, say "Your view in that direction is blocked at the moment." instead.

Carry out looking toward:
	say "You make out [the noun in lower case] that way[if the noun is unvisited], still unexplored since your return to the castle[end if]."
	
Instead of looking toward a room which is in the State Rooms when the windchimes are in the rose garden:
	say "You glance toward [the noun in lower case]: when you stand and look in from the inside, nothing stands in your way. But there are also portions of the room you can't view from this angle."
	
Before looking toward a room which contains the Beast:
	say "You check: the Beast is still in there, still motionless. Nothing has changed." instead.
	
Instead of looking toward the rose garden:
	say "The rose garden looks better from the comfort of the walk: a pretty riot of petals and vines, but the smell dulled."
 
Instead of looking toward a lit room when in darkness:
	say "Your chief impression is of light streaming in."
	
Instead of looking toward the Law Library:
	say "You see into the law library: rows of books, augustness and age. The place always gave you from the creeps, but from the outside it's not quite so bad."
	
Instead of looking toward the State Rotunda:
	say "You glance into the state rotunda, with its fancy flooring -- hard to get a full view from outside, though."
	
Instead of looking toward Lucrezia's Study when Lucrezia's Study is unvisited:
	if in darkness, say "You can't see anything promising that way." instead;
	if the sinister door is closed, say "Yes: it is a door.";
	say "You poke your head in and get the rough impression of a darkened room dominated by an enormous painting. But it's hard to say more than that."
	
Instead of looking toward Crystal Bedroom:
	say "The bedroom -- your bedroom -- glitters and sparkles at you. You can imagine what your father and sisters would say about the fact that you sleep amid such luxury. Like a kept woman."
	
Instead of looking toward the Balcony:
	say "There's fresh air that way, and a vista."
	
Instead of looking toward the Central Courtyard:
	say "It is still, as always, raining in the central courtyard: the only thing that ever changes is how hard it rains, how swiftly the water runs from the gutters and pools in the gravel, the angle at which the droplets come in."
	
Instead of looking toward a room which is in the Hourglass:
	say "You get a giddy glimpse of sand and glass."
	
Instead of looking toward the Black Gallery:
	say "Your primary impression, from here, is of scorched walls and general ruination."
	
Instead of looking toward the Burnt Frame:
	say "That way it's just blackened timbers and sky."
	
Instead of looking toward a dark room:
	if in darkness, say "You can't see anything promising that way.";
	otherwise say "It's too dim to see much that way, though there is open space."
	
Include Case Management by Emily Short.
	  
Section 5 - Go To (any room)

Understand "go to/around/near/by [something]" as walking toward. Walking toward is an action applying to one visible thing. Carry out walking toward: say "It is not necessary to specify movement within the room." Understand "go on/through/across/around [a floor]" as walking toward.

Instead of walking toward the castle when the player is in the Drawbridge:
	try going north.
 
A person can be staid or hurrying. The player is staid.

Understand "go to [any room]" or "go back to [any room]" or "return to [any room]" or "revisit [any room]"  as approaching.  

Approaching is an action applying to one thing.

Check approaching:
	if the noun is the location, say "You're already in [the location]." instead.

Carry out approaching:
	let initial location be the location; 
	while the player is not in the noun
	begin;
		let heading be nothing;
		if the noun is adjacent to the location
		begin; 
			let heading be the best route from the location to the noun, using doors;
		otherwise;
			if the player carries the candle, let heading be the best route from the location to the noun through visited rooms, using doors;
			otherwise let heading be the best route from the location to the noun through scouted rooms, using doors;
			if heading is not a direction
			begin;
				if the player carries the candle, let heading be the best route from the location to the noun through visited rooms, using even locked doors;
				otherwise let heading be the best route from the location to the noun through scouted rooms, using even locked doors;
			end if;
		end if;
		if heading is not a direction
		begin; 
			say "You can't think how to get there from here." instead; 
		end if;
		let destination be the room heading from the location;
		if location is initial location, say "You head ";
		if in darkness
		begin;
			if the location is initial location, say "uncertainly in what feels like the right direction, based on dimly apprehended light, and the movements of air[run paragraph on]";
		otherwise;
			if location is not the initial location
			begin;
				if destination is the noun, say "And [if the initial location is dark]then[otherwise]finally[end if] ";
				otherwise say "Then ";
			end if;
			say "[heading] to [the destination in lower case]. [run paragraph on]";
		end if; 
		if the destination is not the noun
		begin;
			now the player is hurrying;
			silently try going heading;
		otherwise;
			say "[paragraph break]";
			now the player is staid;
			try going heading;
		end if;
		if the player is not in the destination
		begin;
			now the player is staid;
			rule fails;
		otherwise;
			if initial location is dark and destination is not dark and destination is not the noun, say ", emerging into [the destination in lower case]. [run paragraph on]";
		end if;
	end while.
	
Before going through a closed door (called obstacle) when the player is hurrying:
	silently try opening the obstacle.
	
Before opening a locked door when the player is hurrying and the player carries the matching key of the noun:
	silently try unlocking the noun with the matching key of the noun.
	
A room can be scouted or unscouted. A room is usually unscouted. After going: now the location is scouted; continue the action. [* This is necessary because we want the automatic movement to plot a course through areas the player has passed through, whether or not they were dark at the time. Rooms only traversed in darkness are not marked 'visited', so we have to find another way to keep track: 'scouted' means that the player has entered the room at some time or other but may or may not have seen it in the light. Without this restriction, the pathfinder might take the player through rooms not yet explored, which would be less fun; and it might also try to go through off-limits regions.]
	
[And now an even fancier flourish. This is because the descriptions occasionally refer to whole areas of the castle (e.g., the courtyard description mentioning the "state rooms", so it would be nice if the game understood these titles as input, as well. The basic principle at work here is to make it as easy as possible to return to any area the player has scene and to automate movement to such a degree that mapping is unnecessary and the space-covering trips of the endgame are easy.]

Understand "go to [any region]" or "walk [around] [any region]" or "search [any region]" as region-seeking. Region-seeking is an action applying to one thing.

Check region-seeking:
	if the map region of location is the noun or the map region of the location is in the noun, say "You're already in [the noun]; if you'd like to investigate other rooms, you'll have to be more specific about directions." instead.
	
Carry out region-seeking:
	let the goal be nothing;
	repeat with space running through pivotal rooms
	begin;
		if the map region of the space is the noun, let goal be the space; 
		if the map region of the space is in the noun, let goal be the space; 
	end repeat; 
	while the map region of the location is not the noun and the player is not in the goal
	begin;
		let heading be the best route from the location to the noun through scouted rooms, using doors;
		if heading is not a direction, 
			let heading be the best route from the location to the noun through scouted rooms, using even locked doors;
		if heading is not a direction, say "You can't think how to get there from here." instead;
		let destination be the room heading from the location;
		say "(heading [heading])[line break]";
		try going heading;
		if the player is not in the destination, rule fails;
	end while.
	
A room can be pivotal or outlying. A room is usually outlying. The Courtyard is pivotal. The Scarlet Gallery is pivotal. The State Rotunda is pivotal. The Rose Garden is pivotal. The Bellroom is pivotal. The Parlor is pivotal. The Drawbridge is pivotal. The Upper Bulb is pivotal. The Central Crypt is pivotal.

[This system works only because every room in the map has at least one region, and because regions are not stacked more than two deep; otherwise, a more complicated method would have had to be devised.]
	
Section 6 - Going Nowhere


[Part of the minimalist flavor of this game is a reserve -- one might even say negligence -- about listing exits in the room descriptions. The regular room descriptions are often quite short, and we don't want them overwhelmed by text about the doorways out. And besides, exits are always shown in full in the status line.

All the same, as a politeness to the player, we will always remind him about exits in the event that he strikes off in the wrong direction. Our exit-listing will follow the same rules as the status line, when it comes to identifying dark and lighted exits.]

Instead of going nowhere:
	say "[exit description]"
	
Instead of exiting when the player is in a room:
	try departing the location. 
	
Instead of departing a room when in darkness:
	say "By dead reckoning, you head back towards where you think the surface ought to be...";
	try approaching the Servant Quarters.
	
To say exit description:
	let count of exits be 0;
	repeat with way running through directions
	begin;
		let place be the room way from location;
		if place is a discernible room
		begin;
			increase count of exits by 1;
		end if;
	end repeat;
	if count of exits is 0 
	begin;
		say "You appear to be lost in here, except that you recall you came in from [the opposite of the former direction]. If necessary you can always try going to a room you've already visited, or heading roughly out.";
		rule succeeds;
	end if;
	say "From here, you can head ";
	let index be count of exits;
	repeat with way running through directions
	begin;
		let place be the room way from location;
		if place is a discernible room
		begin;
			decrease index by 1;
			say "[way]";
			if index is greater than 1, say ", ";
			if index is 1
			begin;
				if the count of exits is greater than 2, say ",";
				say " and ";
			end if;
			if index is 0, say ".";
		end if;
	end repeat.
	
Section 7 - Go Back (the way we came)

The former direction is a direction that varies. The last location is a room that varies.

Carry out going a direction:
	now the last location is the location;
	now the former direction is the noun. 

Understand "go back" as retreating. Understand "back" or "return" or "retreat" as retreating.

Retreating is an action applying to nothing. 

Carry out retreating:
	let new direction be the opposite of the former direction;
	say "(heading [new direction])[line break]";
	try going the new direction.
	
Understand "leave [any room]" or "go outside [any room]" as departing. Departing is an action applying to one thing.

Check departing: if the noun is not the location, say "You aren't in [the noun]." instead.

Carry out departing:
	let chosen way be the logical exit;
	if chosen way is a direction
	begin;
		say "(heading [chosen way], since that is the only direction available)[line break]";
		try going chosen way;
	otherwise;
		 say "You will have to be more specific about which direction you want to go[if novice mode is functioning]. [exit description][end if].";
	end if.
	
Understand "exits" or "dirs" or "directions" or "dir" or "find exits" or "find exit" as asking for directions. Asking for directions is an action out of world. Carry out asking for directions: say exit description.
	
To decide what direction is the logical exit:
	let counter be 0;
	let chosen way be north;
	repeat with way running through directions
	begin; 
		let place be the room way from the location; 
		if place is a room
		begin;
			increase counter by 1;
			let chosen way be the way;
		end if;
	end repeat;
	if counter is 1, decide on the chosen way.
	
Section 8 - Find (any object we have seen)

Understand "find [any pending thing]" as hunting. Hunting is an action applying to one visible thing. Carry out hunting: try hinting about the noun instead. Understand "look for [any pending thing]" as hunting. Understand "go to [any pending thing]" as hunting.

Instead of hunting the beast: 
	if the beast is deceased, say "You doubt you'll find him again unless you have the misfortune to meet in Hell.";
	otherwise say "You will have to wander until you discover where he is." 

Definition: a thing is pending:
	if it is a ringer, no;
	if it is in Storage-Box, yes;
	no. 

Understand "find [any seen thing]" as finding. Understand the command "seek" as "find". Understand "look for [any seen thing]" as finding. Understand "go to [any seen thing]" as finding.

Finding is an action applying to one visible thing.

Instead of finding the windchimes when the Rose Garden is unvisited: say "That's the trick, isn't it?"

Carry out finding:
	if the player is carrying the noun
	begin;
		say "You're holding [the noun]!";
	otherwise;
		let place be the ultimate location of the noun;
		if place is not a room and the noun is a door
		begin;
			let place be the front side of the noun;
			if place is not visited, let place be the back side of the noun;
		end if;
		if place is a room and place is not the location
		begin;
			try approaching place;
			if the noun is visible, stop the action;
		end if;
		if noun is a backdrop
		begin;
			say "That wasn't in one specific location.";
		otherwise;
			if the place is the location, say "You have [the noun] in front of you.";
			otherwise say "[The noun] [are] gone.";
		end if;
	end if. 
	
	
Chapter 2 - Adaptive Hints
	
Dependence relates various things to various things. The verb to follow (it follows, they follow, it followed, it is followed, it is following) implies the dependence relation.

Before hinting about something which follows something (called the prior issue):
	if the prior issue is solved, continue the action;
	say "The current problem cannot be fully dealt with until you have addressed another issue; further exploration is called for[if the prior issue is tantalizing]. You might concentrate on [the prior issue] for now[end if]." instead.


Explaining relates various things to various things. The verb to explain (it explains, they explain, it explained, it is explained, it is explaining) implies the explaining relation.

Instead of hinting about something when something unexamined (called the clue) explains the noun:
	if the clue is the noun, say "Try examining [the noun]." instead;
	say "You're still missing some information that might be useful to understanding the problem. [More]";
	if player consents, try hinting about the clue.

Requiring relates various things to various things. The verb to require (it requires, they require, it required, it is required, it is requiring) implies the requiring relation.

Instead of hinting about something when the noun requires something (called the implement) which is not had by the player:
	if the noun is solved, continue the action;
	if the implement is the stool and the stool is visible, continue the action;
	say "You're missing an object that might be useful to resolving this problem. [More]";
	if player consents, try hinting about the implement.
	
Definition: a thing is unsolved:
	no.

Understand the command "hint" as something new. [* This would not be necessary except that the help extension does define Hint.]

Understand "hint" as asking for a hint. Asking for a hint is an action out of world. Instead of thinking, try asking for a hint.

Carry out asking for a hint: 
	if the Beast is unseen
	begin;
		say "Your goal is to discover the beast; you might try exploring and looking for him. ";
	otherwise;
		if the beast is hungry, say "You might try finding some food for the Beast. ";
		otherwise say "The Beast has asked that you destroy the contract book. You could work on that problem, or consider some of the other possibilities. ";
	end if;
	if the number of tantalizing things is greater than 0
	begin;
		say "Tantalizing leads at the moment include [the list of tantalizing things].";
	otherwise; 
		if the number of unvisited rooms is greater than 0, say "Exploring further might be a good idea.";
		otherwise say paragraph break;
	end if.

Definition: a thing is tantalizing:
	if it is solved, no;
	if it is unseen, no;
	if it follows an unsolved thing, no;
	if it is unsolved, yes.
	
After reading a command:
	if the player's command includes "think", replace the matched text with "hint".
	
Hinting topically about is an action applying to one topic. Understand "hint about [text]" as hinting topically about.

Carry out hinting topically about: say "Sorry, there is nothing to say about that."

Instead of hinting topically about a topic listed in the Table of Topic Hints:
	say "[reply entry][paragraph break]".

	
Table of Topic Hints
topic	reply
"djinn/genie/djinni/elephant"	"You recollect some stories about King Elzibad and the elephant that destroyed him (though it's said that that was not a true elephant, but a powerful djinn who resented being enslaved and took a vengeance of its own. Some version of the story is recorded in the tapestry of the Guest Bedroom."
"bell/bells"	"The Beast's collection of bells lives upstairs in the bell room, and provides him more or less whatever he needs, by summoning the servants indentured to his house. You have yet to discover any task, however menial or obscure, for which there is not some slave or other recorded."
"spirits/spirit/ghost/ghosts"	"The spirits have been here since long before you arrived, but they are an invisible presence, without much volition, and useless unless summoned."
"dark/darkness"	"Moving in darkness requires either a light source or some reliance on other senses. The Beast was always uncannily good at that, moving around the Castle at night silently... but of course he lived here for hundreds of years, and there cannot have been many corners of the place he did not know."
"father" or "my father"	"You've thought about him enough in the last week, and would prefer not to do so further."
"sister/sisters/siblings/family" or "my family/sister/sisters/siblings"	"Your sisters are all right. But they are a little frivolous, and too much present in this world to understand much about your life at the castle. It has been hard talking with them when there is so little common that you can now discuss."
"village/home"	"Your family's village seems smaller now than it used to."
"past/childhood" or "my past/childhood"	"Your early childhood, while your mother yet lived, was pleasant enough; but it is also so long ago that it seems to have faded into another life entirely. And your father changed almost beyond recognition, after that happened."
"me" or "myself"	"You'll be well enough, if you can settle matters here."
"stench/stink/smell/wind/breeze"	"Rooms with a strong smell will sometimes air out when doors at both sides are opened, allowing a breeze to go through."
"shoemaker/cobbler"	"There's almost certainly some such person indentured to the castle."

Hinting about is an action applying to one visible thing. Understand "hint about [any seen thing]" as hinting about. Understand "remember [any seen thing]" as hinting about.


Understand "hint about [any pending thing]" as hinting about. Understand "remember [any pending thing]" as hinting about.

Understand "hint about [any visited room]" as hinting roomily about.  Understand "remember [any visited room]" as hinting roomily about. Hinting roomily about is an action applying to one visible thing. 

Instead of hinting about a ringer when the Bellroom is not visited:
	say "There's a room on the upstairs level that may be relevant to all this."

Instead of hinting roomily about a solved room:
	say "You have already accomplished the changes that need to be made to this room."
	
Instead of hinting roomily about a room which is controlled by a ringer (called the control):
	if the noun is solved, continue the action;
	say "[The noun] was built for a specific purpose. [more]";
	if player consents,
		say "When it comes to [the noun], it may help to have the right implements. [more]";
	otherwise stop the action;
	if player consents, try hinting about the control.
	
Instead of hinting roomily about paradise when the trapdoor is scenery:
	say "Something seems unusual about the floor, but you're not able to see what it is. [more]";
	if player consents,
		say "Maybe you need to shed some new light on the subject. [more]";
	otherwise stop the action;
	if player consents,
		say "How did you read the inscription? [more]";
	otherwise stop the action;
	if player consents,
		say "Try putting the candle on the ground in an adjacent room, then returning to Debtor's Paradise.";
	otherwise stop the action;
	
Instead of hinting roomily about the location: 
	if the noun contains a visible thing which is not the player, say "You notice here [the list of visible things which are not irrelevant].";
	otherwise say "There isn't much here for you to play with."
	
Definition: a thing is irrelevant:
	if it is the player, yes;
	if it is the generic surroundings, yes;
	no.

Instead of hinting roomily about a dark room:
	say "You will need a light source to explore. [more]";
	if player consents, try hinting about the candle.
	
Carry out hinting roomily about:
	say "If there is a clear path, you can go to any room you like, just by saying go to [noun]."

Control relates a thing (called X) to a room (called Y) when Y is the target locale of X. The verb to control (it controls, they control, it controlled, it is controlled, it is controlling) implies the control relation.

[This allows us to create the most absolutely generic sort of hint -- boring, perhaps, but in practice the player often just needs a nudge about what part of the game world he should be examining for a solution:]

Carry out hinting about:
	if something explains the noun, say "You might want to review [the list of things which explain the noun]. ";
	if the noun requires something
	begin;
		say "You should be sure that you have [the list of things required by the noun]. ";
	otherwise;
		say "You can't think of anything further on the topic.";
	end if.

[These things cover hinting about objects that are themselves puzzles. But what if the player asks for hints about a tool or piece of information because he doesn't know how to apply it yet? We might want to give some guidance there, as well.]

Carry out hinting about an unexamined thing which explains something (called target):
	if target is solved
	begin;
		say "[The noun] was mostly useful as a source of clues about [the target]." instead;
	end if;
	if target is unseen
	begin;
		if the target is in Storage-Box, continue the action;
		otherwise say "[The noun] might prove useful information, sooner or later." instead;
	otherwise;
		say "You could examine [the noun]." instead;
	end if.

Carry out hinting about something which is required by something:
	say "[The noun] might be useful to have. [More]";
	if player consents
	begin;
		if a seen thing requires the noun, say "[The noun] may help with [the list of seen things which require the noun]." instead;
		otherwise say "There [if the number of things which require the noun is 1]is[otherwise]are[end if] [number of things which require the noun in words] problem[s] for which [the noun] might come in handy." instead;
	end if;
	stop the action.
	
Carry out hinting about a ringer which is required by something (called target):
	if the target is solved
	begin;
		say "[The noun] was mostly useful to get [the target]." instead;
	end if;
	say "[The noun] might be useful to have. [More]";
	if player consents
	begin;
		if a seen thing requires the noun, say "[The noun] may help with [the list of seen things which require the noun]." instead;
		otherwise say "Try ringing [the noun] in [the target locale of the noun]." instead;
	otherwise;
		stop the action;
	end if.

[Now we have these general hints written, but we want to pre-empt them if the player has not yet fulfilled all the prerequisites.]

Instead of hinting about the cow bell:
	say "Perhaps you could summon the spirit of Yvette to speak with you. [More]";
	if player consents, say "Lucrezia was able to do this by ringing bells in the presence of a mirror. [More]";
	otherwise stop the action;
	if player consents, say "Go to the mirrors, then ring the bell."

Instead of hinting about something unseen:
	if the noun is visible
	begin;
		now the noun is seen;
		continue the action;
	end if;
	say "Perhaps you should explore further. ";
	if the ultimate location of the noun is an unvisited room
	begin;
		try hinting about the ultimate location of the noun;
	otherwise;
		if the ultimate location of the noun is the location
		begin;
			say "You're in the correct room right now[if the visible shell of the noun is a thing]. Try further exploring [the visible shell of the noun][end if].";
		otherwise;
			if the ultimate location of the noun is a room,
				try hinting about the ultimate location of the noun;
			otherwise say "Focus on other things for the time being.";
		end if;
	end if.

Instead of hinting about a visited room:
	say "There's a room you've visited, but you haven't exhausted all there is to see there. (The [if novice mode is functioning][bold type][end if]place[roman type] command will list every room you've visited, if you'd like to review.) [More]";
	if player consents
	begin;
		say "Try going back to [the noun].";
	end if.

Instead of hinting about an unvisited room:
	say "There's a room you haven't yet visited.  [More]";
	if player consents, direct player to the noun.

To direct player to (goal - a room):
	if the goal is visited
	begin;
		say "Try going to [the goal]."; rule succeeds;
	end if;
	if goal is location
	begin;
		say "Something in this very location will help you.";
		rule succeeds;
	end if;
	let way be the best route from location to the goal, using doors;
	if way is a direction, say "Try going [way] to start your explorations.";
	otherwise say "The way is long, and possibly blocked by a locked door.";

Instead of hinting about a portable seen thing which is not visible:
	if the noun is scenery, continue the action;
	if the noun is a person, continue the action;
	if in darkness and the player has the noun
	begin;
		say "You have something useful in your inventory. [more]";
		if player consents, continue the action;
	end if;
	say "You have seen the item you need to solve this problem, but it's not in sight at the moment.  (The [if novice mode is functioning][bold type][end if]objects[roman type] command will list everything you remember seeing, if you'd like to review.) [More]";
	if player consents
	begin;
		try hinting about the ultimate location of the noun;
	end if.

[And this business of "seen" things requires, of course, that we keep track:]

A thing can be seen or unseen. A thing is usually unseen. The player is seen. Before printing the name of something (called target): now the target is seen. 

[We also need to deal with the question of whether the player has examined an object, for those objects whose descriptions carry vital information:]

A thing can be examined or unexamined. A thing is usually unexamined. Carry out examining something: now the noun is examined.

After taking something unexamined:
	say "You acquire [the noun], and assess it curiously.";
	try examining the noun.
	
After taking something, say "You acquire [the noun]."

[This is meant to speed up play, in that the player does not need to examine portable object separately.]

To decide what room is the ultimate location of (item - a thing):
	let place be the holder of the item;
	while the place is a thing:
		let the place be the holder of the place;
	if the place is a room, decide on the place.

To decide what thing is the visible shell of (item - a thing):
	if item is visible, decide on the item;
	let place be the holder of the item;
	while place is a thing and place is not visible:
		let place be the holder of the place;
	if the place is visible, decide on the place.

To say more:
	say "[paragraph break]Shall I go on? > ";


[That covers most of the generic hints, but let's also add some slightly more precise hints about a few kinds of objects that are especially important in the model world. These hints will probably not be very interesting to a seasoned IF veteran, but a novice player who does not know the wording or cannot guess what something might be for may still find them useful:]

Carry out hinting about a locked lockable thing:
	say "You could unlock [the noun] with [the matching key of the noun]." instead.

Instead of hinting about the windchimes when the windchimes are not handled and the player is not on a supporter:
	say "To reach the windchimes, it might help to stand on something. [more]";
	if player consents, say "Try standing on the stool."

Carry out hinting about a closed openable unlocked thing:
	say "You could open [the noun]." instead.

Carry out hinting about an open door:
	say "You could enter [the noun]." instead.

Carry out hinting about an unexamined thing:
	say "You might find out something if you examine [the noun]. (Then again, you might not -- but it's worth a try.)" instead.

Carry out hinting about an edible thing:
	say "You could eat [the noun]." instead.

Carry out hinting about a wearable thing:
	say "You could wear [the noun]." instead.
	
Instead of hinting about the shackle:
	say "The shackle has little purpose now, except as a symbol of the enslavement that everyone in the castle -- including you -- would prefer to escape."

Carry out hinting about a pushable between rooms thing:
	say "You could push [the noun] some direction." instead.
	
Carry out hinting about a visited room:
	say "To return to any room you've already visited, try GO TO {the room}." instead.
	
Carry out hinting about an enterable supporter:
	say "You could sit on [the noun]." instead.

Carry out hinting about an enterable container:
	say "You could get inside [the noun]." instead. 
	
Instead of hinting about the unexamined quill:
	say "Try having another look at it."
	
Instead of hinting about the sign:
	say "There were many times when you wanted to believe it was nonsense, but it conveys unmistakeable seriousness; and in any case you have seen enough else in various parts of the castle to be aware that strange powers do apply.

But the Beast assured you that you could leave and come back safely, with the right arrangements, which he was willing to make."

Instead of hinting about the leak: say "It should probably be patched in the long run if it's not to damage the castle wall, but for now it has no effect important enough to worry over." 

Instead of hinting about the sinister door:
	say "The inscription may be some help."

Instead of hinting about the storybook:
	say "It does seem to suggest a means of scrying or communicating with sympathetic spirits -- at least with those who might wish to talk with you."
	
Instead of hinting about the cord:
	try hinting about the inscription.
	
Instead of hinting about the bars of wax, say "You can't possibly use these yourself."

Instead of hinting about the scrap, say "There's nothing you can do with the scrap." 

Instead of hinting about the forest:
	say "Your family home is better remembered than visited, now: this is your conclusion. Or, if things were different and your sisters could visit you here... but to live there again holds no appeal for you."

Instead of hinting about the sea:
	say "It is many many miles away; but if you find yourself without a place to live after this, perhaps you will go back to the seashore and find passage to some other country."
	
Instead of hinting about the helmet:
	if the helmet is solved, continue the action;
	if the helmet is unexamined, say "Try examining the helmet first." instead;
	say "It seems that the helmet helps with hearing. [More]";
	if player consents, say "Perhaps you can use it in a situation where you need good hearing. [More]";
	otherwise stop the action;
	if player consents
	begin;
		if the Maze Room is unvisited and the Quarters is unvisited, say "You have yet to run into the situation where you need good hearing, though. Explore more rooms, then come back to this problem." instead;
		say "The helmet might be a useful guide to you in darkness, for instance. [More]";
	otherwise;
		stop the action;
	end if;
	if player consents, say "With the helmet on, you can hear sounds from several rooms away in the darkness, and use these noises to guide your movements. [More]";
	otherwise stop the action;
	if player consents, say "You should concentrate on the sound that you have heard before in an interesting context, and ignore any other noises. [More]";
	otherwise stop the action;
	if player consents, say "Try going down from the Servant Quarters, then following the sound of the windchimes until you surface in daylight again. If the room description does not mention chimes, try listening to get your bearings.";
	otherwise stop the action.
	
	
Definition: the windchimes is unsolved if it is not handled. 

Definition: the windchimes is solved:
	 if it is handled, yes;
	if it is in the Bellroom, yes;
	no.

Instead of hinting about the windchimes when the windchimes are not handled and the windchimes are unlocked:
	say "Try taking them down, to silence them."
	
Instead of hinting about the windchimes when the windchimes are in the bellroom: say "The windchimes have served their purpose."

Definition: the helmet is solved if the Rose Garden is visited. Definition: the helmet is unsolved if it is not solved.

Instead of hinting about the solved helmet: say "The helmet was useful to get you to the rose garden, and may come in handy for problems involving sound again, if you run into any. But there is nothing further that you can think of to do with it at the moment."

The windchimes require the helmet and the stool and the small key. The windchimes follow the helmet.

The small door requires the small key. The small key follows the helmet.

Definition: the heavy door is unsolved if the Bellroom is unvisited and the White Gallery is unvisited. Definition: the heavy door is solved if it is not unsolved. Definition: the thick door is unsolved if the Bellroom is unvisited and the White Gallery is unvisited. Definition: the thick door is solved if it is not unsolved.

The heavy door and the thick door follow the windchimes. 

The silver bell follows the heavy door. The candle requires the silver bell. 

The dinner bell follows the heavy door. The feast requires the dinner bell. The Beast requires the feast. Definition: the Beast is solved if it is deceased. Definition: the Beast is unsolved if the Beast is not solved.

Definition: the dinner bell is solved if the feast is not in Storage-Box. Definition: The dinner bell is unsolved if the feast is in Storage-Box. Definition: the silver bell is solved if the candle is not in Storage-Box. Definition: the silver bell is unsolved if the candle is in Storage-Box.

The shoes follow the iron cage. 

The iron cage requires the iron key. The iron key follows the Beast.

Definition: the cage is unsolved if it is locked. Definition: the cage is solved if it is unlocked.

The image follows the sinister door. The inscription explains the sinister door and the cord. The inscription requires the stool and the candle.

The notes follow the sinister door. The notes explain the girdle and the inkpot. The Wedding Treasure explains the inkpot. The inkpot follows the ivory door.

The ivory door requires the ivory key. The ivory door follows the shoes. The ivory key follows the shoes. The shoes require the leather tambourine. The image explains the tambourine.

Definition: the shoes are solved if it is wearable. Definition: the shoes are unsolved if it is not wearable.
 
The contract book requires the candle.

To repurpose the player: now the contract book requires the glass bell; now the contract book requires the inkpot; now the contract book does not require the candle; now the contract book follows the ivory door; now the beast requires the girdle; now the beast does not require the feast.

The inkpot follows the trapdoor. The fountain explains the inkpot. The stand explains the stand.

Definition: the trapdoor is solved if it is not scenery. Definition: the trapdoor is insolved if it is scenery.

The contract book and the miniature explain the girdle. The contract book explains the glass bell.

The harness explains the gong. The papers explain the quill.

The jigsaw puzzle requires the jagged piece. The jagged piece follows the iron cage.

Elzibad requires the gong. 


Instead of hinting about the map when the candle is in the Rotunda:
	say "By the candlelight, you can see all there is to see; there's nothing else that the map will tell you."

The map requires the candle.

Carry out hinting about the map:
	say "It looks as though it can be illuminated with the candle, if the candle is set in the right place."

Instead of hinting about the quill: say "It isn't for you to use."

Instead of hinting about the inkpot when the stones are unsolved:
	say "Before concerning yourself with that, you should thoroughly explore the crypt. ";
	if the Debtor's Paradise is not visited
	begin;
		say paragraph break;
	otherwise;
		say "[More]";
		if player consents, say "Especially the Debtor's Paradise. [More]";
		otherwise stop the action;
		if player consents, say "Do you notice anything odd about walking into and out of it repeatedly?";
	end if.

Definition: the stones are solved if the trapdoor is not scenery. Definition: the stones are unsolved if the trapdoor is scenery.

Instead of hinting about the stones:
	say "Perhaps there is some unevenness in the floor that would show where a trapdoor is. [more]";
	if player consents, 
		say "In the past, you've needed to discern irregularities in floors and walls... [more]";
	otherwise stop the action;
	if player consents,
		say "How did you resolve the inscription problem? [more]";
	otherwise stop the action;
	if player consents,
		say "Drop the candle in any adjoining room, then come back and see what has changed."

Carry out hinting about the book return stand:
	say "The stand is here to allow you to get things shelved in the Lie Library. [more]";
	if player consents
	begin;
		say "Judging by the pictures would need to place the required object on the stand, then ring the correct bell for the librarian. [more]";
	otherwise;
		stop the action;
	end if;
	if player consents
	begin;
		say "Doing this might render the book in question false. [more]";
	otherwise;
		stop the action;
	end if;
	if player consents
	begin;
		say "This decision is up to you, but you could, if you wished, put the contract book on the book return stand, then ring the glass bell, thus converting the book to a work of fiction, and freeing everyone under contract." instead;
	end if;


Instead of hinting about the glass bell when the glass bell is in Storage-Box:
	say "The Lie Library might work if you could summon the librarian. He (or she) might reshelve whatever you take there. [more]";
	if player consents
	begin;
		say "First, you'll need to find out how to summon the librarian. [more]";
	otherwise;
		stop the action;
	end if;
	if player consents, say "Try consulting the contract book about the librarian."

Instead of hinting about feast when the feast is in Storage-Box:
	say "The beast seems to be suffering extreme hunger. [More]";
	if player consents,
		say "You will not be able to find food; you'll have to get the castle servants to bring it to you. [More]";
	otherwise stop the action;
	if player consents,
		say "Therefore, you'll need a way to control them. [More]";
	otherwise stop the action;
	if player consents, try hinting about gold dinner bell.
	
Instead of hinting about candle when candle is in Storage-Box and the Translation Room is visited:
	say "Lighting the translation room might be useful. [More]";
	if player consents,
		say "You will not be able to find light; you'll have to get the castle servants to bring it to you. [More]";
	otherwise stop the action;
	if player consents,
		say "Therefore, you'll need a way to control them. [More]";
	otherwise stop the action;
	if player consents, try hinting about silver bell.
	
Instead of hinting about the candle when the candle is in Storage-Box and the Rose Garden is visited and the Translation Room is unvisited:
	say "There is a room here where you might be able to acquire light, but you haven't reached it yet. Try exploring further."
	
Instead of hinting about the contract book when the Translation Room is unvisited:
	say "The contract book's script is incomprehensible to you. You'll have to find some way to decipher it, or some location that assists you. Further exploration of the State Rooms might be in order."

Instead of hinting about candle when candle is in Storage-Box and the Rose Garden is unvisited:
	if the location is dark
	begin;
		say "It is possible to wander in the dark, for the time being. [more]";
		if player consents,
			say "Perhaps you could rely on one of your other senses to guide you. [More]";
		otherwise stop the action;
		if player consents,
			say "Listening might tell you something. [More]";
		otherwise stop the action;
		if player consents, try hinting about helmet;
	otherwise;
		say "There is enough light to see by for now.";
	end if.
	
Instead of hinting about the pending feast when the Beast is unseen:
	say "Finding the beast is your first priority." 
	
Instead of hinting about the beast when the beast is in Storage-Box:
	if the beast is deceased, say "You've avenged the wrongs of centuries, and put him out of his misery. There is nothing more you could do for or to him, even if you were able to find him again." instead;
	say "Keep exploring: you'll find him sooner or later. [more]";
	if player consents
	begin;
		if the helmet is unsolved
		begin;
			say "There are more rooms you can walk through, though not all of them are lit.";
			stop the action;
		end if;
		if windchimes are unsolved
		begin;
			say "There is a way to make the state rooms available for exploration. [more]";
			if player consents, say "Whenever you encounter the spirit guards, you hear a peculiar sound... [more]";
			otherwise stop the action;
			if player consents, try hinting about windchimes;
		otherwise;
			say "There are more rooms that you can reach if you wander.";
		end if;
	end if.
	
Instead of hinting about a solved thing:
	if something requires the noun, continue the action;
	otherwise say "There's nothing more you need to do about [the noun]."

Instead of hinting about yourself:
	say "You'll be all right, as soon as you see Him well again."
	 

Instead of hinting about the contract book in the presence of the candle: 
	say "Now that you have adequate lighting, you will be able to read the contract book in the translation room. [More]";
	if player consents
	begin;
		say "You can just read it, or you can look up specific people in it. [More]";
	otherwise;
		stop the action;	
	end if;
	if player consents
	begin;
		say "It's a book of contracts for enslavement, so consider looking up people you know have been enslaved here. [More]";
	otherwise;
		stop the action;
	end if;
	if player consents
	begin;
		say "Though there are other possibilities, you may find it most enlivening to look up yourself in the book; also perhaps your father, and any of the bells you are still curious about." instead;
	otherwise;
		stop the action;
	end if.
		

Definition: the Translation Room is solved if the candle is not in Storage-Box. Definition: the Translation Room is unsolved if the candle is in Storage-Box.

Definition: a door is solved if it is unlocked. Definition: a door is unsolved if it is locked.

Definition: the Kitchen is solved if the feast is not in Storage-Box. Definition: the Kitchen is unsolved if the feast is in Storage-Box.

Definition: the Dining Hall is solved if the feast is not in Storage-Box. Definition: the Dining Hall is unsolved if the feast is in Storage-Box.

Definition: a grail is solved if it is not in Storage-Box. Definition: a grail is unsolved if it is in Storage-Box.

Instead of hinting about the miniature when the miniature is unseen:
	say "What gave the Beast his beastly form was an incident from his personal history, not a part of his family's troubled dealings. Therefore it is not Lucrezia's magic that will help you with this, but whatever you can find out about his own history. [More]";
	if the player consents, say "The Beast has some living rooms underground. If you explore these, you may find evidence of elements in his past that mattered to him, which you could then research further."

Instead of hinting about the miniature:
	say "Obviously this is the picture of someone who is (or was) significant to the Beast. [More]";
	if player consents, say "Perhaps some reference to her will appear in one of the castle's books or records. [More]";
	otherwise stop the action;
	if player consents, say "Of course, the only identifying sign you have is that green girdle. [More]";
	otherwise stop the action;
	if player consents, say "You could try looking the girdle up in the contract book."
	
Instead of hinting about the roses:
	say "They have a pungent, sickly smell: from a distance it isn't so bad, almost pleasant at times, but up close it is nauseating. You've been given to understand that the strain was developed by Lucrezia herself."

Understand "rooms" or "places" as seeking room list. Seeking room list is an action out of world. Carry out seeking room list: say "Thus far you have visited [the list of visited rooms]."

Understand "objects" or "things" as seeking object list. Seeking object list is an action out of world. Carry out seeking object list: say "Thus far you have seen [a list of listable things]."

Definition: a thing is listable:
	if it is the player, no;
	if it is unseen, no;
	if it explains something, yes;
	if it requires something, yes;
	if something requires it, yes;
	if it is scenery, no;
	yes.

Chapter 3 - "Novice Mode" 

Section 1 - Training Wheels
[It has been observed that very untrained players, confronting a game for the first time, have some difficulty understanding how to communicate with the game, and in particular what sorts of interaction are expected of them. This novice mode provides two kinds of help: one, it highlights the names of everything interesting in room descriptions, to draw attention to useful nouns; and two, it lists commands that the player might want to try, based on what is currently available in the room. This functionality can be turned off at any time through the command line or the menu.] 

After printing the banner text:
	if novice mode is unset
	begin;
	say "[line break]Have you played interactive fiction before? >";
	if the player consents
	begin;
		now novice mode is dead;
		say "[line break]If you have not played Bronze before, you may still want to type HELP to learn about special commands unique to this game."; [* These remarks added because beta-testers thought it was a little unfriendly to have the game not acknowledge the player's response to this question. Originally we said nothing, but went straight into play.]
	otherwise;
		now novice mode is functioning;
		say "[line break]Some extra command help is provided, though you may turn it off at any time.";
	end if;
	end if.

Setting is a kind of value. The settings are unset, functioning and dead.

Novice mode is a setting that varies. Novice mode is unset. Stopping novice mode is an action out of world. Starting novice mode is an action out of world. Understand "novice mode off" as stopping novice mode. Understand "novice off" as stopping novice mode. Understand "novice mode on" as starting novice mode. Understand "novice on" as starting novice mode. Carry out stopping novice mode: now novice mode is dead. Carry out starting novice mode: now novice mode is functioning. Report stopping novice mode: say "Novice mode is now off. You may still consult HELP at any time, or use THINK ABOUT specific puzzles." Report starting novice mode: say "Novice mode is now on."

Include Complex Listing by Emily Short. [* This allows us to list things with inserted 'or' rather than 'and' (and also to do a number of considerably more challenging things, but we won't need most of them right away).]

Before reading a command when novice mode is functioning:
	say "[line break]Some options to try (to play without guidance, type [bold type]novice mode off[roman type]): ";
	if not looking and not going, say "[line break]  [bold type]look[roman type]";
	if the player wears the helmet, say "[line break]  [bold type]listen[roman type]";
	if the player carries something and we are not taking inventory, say "[line break]  [bold type]inventory[roman type] (I)"; 
	if the player carries something and a free-standing supporter is relevant
	begin; 
		prepare a list of free-standing relevant supporters; 
		say "[line break]  [bold type]put[roman type] something [bold type]on[roman type] [the prepared list delimited in disjunctive style]"; 
	end if;
	if a gettable thing is relevant
	begin;
		prepare a list of relevant gettable things;  
		say "[line break]  [bold type]take[roman type] [the prepared list delimited in disjunctive style]";
	end if;  
	if an unexamined thing is relevant
	begin; 
		prepare a list of relevant unexamined things; 
		say "[line break]  [bold type]examine[roman type] (X) [the prepared list delimited in  disjunctive style]";
	end if;  
	if a relevant thing is worth entering
	begin;
		prepare a list of relevant worth entering things; 
		say "[line break]  [bold type]enter[roman type] [the prepared list delimited in  disjunctive style]";
	end if;   
	if an unlocked openable thing is relevant
	begin;
		prepare a list of relevant worth entering things; 
		say "[line break]  [bold type]open[roman type] or [bold type]close[roman type] [the prepared list delimited in  disjunctive style]";
	end if;
	if a closed lockable thing is relevant
	begin;
		prepare a list of closed lockable relevant things; 
		say "[line break]  [bold type]lock[roman type] or [bold type]unlock[roman type] [the prepared list delimited in  disjunctive style]";
	end if; 
	if the player carries an edible relevant thing
	begin;
		prepare a list of edible relevant things; 
		say "[line break]  [bold type]eat[roman type] [the prepared list delimited in  disjunctive style]";
	end if;  
	if the player carries a wear-worthy thing
	begin;
		prepare a list of the wear-worthy things carried by the player; 
		say "[line break]  [bold type]wear[roman type] [the prepared list delimited in disjunctive style]";
	end if;
	if a device is relevant, say "[line break]  [bold type]turn on[roman type] or [bold type]turn off[roman type] [the list of relevant devices]";
	if a room is adjacent, say "[line break]  [bold type]go[roman type][exit list][if in darkness] or try other directions in the dark[otherwise] or [bold type]go to[roman type] any room you've visited[end if]";
	if an open door is relevant
	begin;
		prepare a list of the relevant open doors; 
		say "[line break]  [bold type]go through[roman type] [the prepared list delimited in disjunctive style]";
	end if;
	if another person is relevant, say "[line break]  [bold type]kiss[roman type] or [bold type]wake[roman type] [the list of relevant other people][if the player carries something], or [bold type]give[roman type] things [bold type]to[roman type] him[end if]";
	if the cord is relevant, say "[line break]  [bold type]pull[roman type] [the cord]";
	if the player carries a ringer
	begin;
		prepare a list of the ringers carried by the player; 
		say "[line break]  [bold type]ring[roman type] [the prepared list delimited in disjunctive style]";
	end if;
	if the player is in an active room and the inscription is examined, say "[line break]  [bold type]wait[roman type] (Z)";
	if the fountain is relevant, say "[line break]  [bold type]fill[roman type] a container";
	if the player can see the contract book and the contract book is examined and the player is in the Translation Room and the candle is visible, say "[line break]  [bold type]look up[roman type] someone [bold type]in[roman type] the contract book";
	say "[line break]  [bold type]think about[roman type] a specific room or object to get a clue";
	say "[line break]  [bold type]help[roman type] to see a more complete set of instructions";
	say "[paragraph break]";
	
Definition: a thing is wear-worthy if it is not the shackle and it is wearable and it is relevant.

Definition: a person is other if it is not the player. Definition: a person is another if it is other.

Definition: a thing is free-standing if it is in a room.

After taking inventory when novice mode is functioning: 
	if the player is carrying something
	begin;
		say "To get rid of any of these objects, [bold type]drop[roman type] it, or [bold type]take off[roman type] anything you are wearing.";
	otherwise;
		if the player is wearing something, say "You can always [bold type]take off[roman type] anything you are wearing.";
		otherwise say "To acquire an inventory, [bold type]take[roman type] such portable objects as you find lying around.";
	end if.

Before printing the name of something (called the target): if novice mode is functioning, say "[bold type]". After printing the name of something: say "[roman type]".

To say exit list:
	let place be location;
	let count be 0;
	repeat with way running through directions
	begin;
		let place be the room way from the location;
		if place is a discernible room, now way is marked for special listing; 
	end repeat;
	register things marked for listing;
	say " [a prepared list delimited in disjunctive style]".

Definition: a thing is gettable:
	if it is scenery, no;
	if it is fixed in place, no;
	if it is a person, no;
	if the player is carrying it, no;
	if the player is wearing it, no;
	if the player can touch it, yes;
	no.

Definition: a thing is relevant if it is visible and it is seen.

Definition: a supporter is worth entering:
	if the player carries it, no;
	if it is enterable, yes.

Definition: a container is worth entering:
	if the player carries it, no;
	if it is enterable and it is open, yes.

Section 2 - Adjustments to Wording of Standard Refusals 

The helpful can't enter something carried rule is listed instead of the can't enter something carried rule in the check entering rules.

The fulsome report dropping rule is listed instead of the standard report dropping rule in the report dropping rules.

The block vaguely going rule is not listed in any rulebook.

Rule for supplying a missing noun while going:
	if going
	begin;
		let chosen way be the logical exit;
		if chosen way is a direction
		begin;
			say "(heading [chosen way], since there are no other options)";
			now the noun is the chosen way;
		otherwise;
			 say "You will have to be more specific about which direction you want to go[if novice mode is functioning]. The available directions are[exit list][end if].";
		end if; 
	end if;


This is the fulsome report dropping rule: say "You set down [the noun]."

This is the helpful can't enter something carried rule:
	if the player carries the noun
	begin;
		say "You decide that you'll need [the noun] to be on the ground first. [run paragraph on]";
		try dropping the noun;
	end if;
	if the player carries the noun, stop the action.
	
Before going somewhere when the holder of the player is not a room:
	say "You decide that you'll need to get down first. [run paragraph on]";
	try exiting;
	if the player is not in a room, stop the action.
	


Section 3 - Miscellaneous Other Assistance for Novices

Taking inventory is acting confused. Looking is acting confused. Examining an examined thing is acting confused.

After acting confused for the sixth turn: 
	if the location is the Great Dining Hall, do nothing;
	otherwise remind about assistance.

To remind about assistance:
	say "(If you are feeling lost, try typing HELP for complete instructions, HINT for general guidance on what to do next, or THINK ABOUT a specific item that is giving you trouble.)"
	
After waiting for more than three turns:
	say "Matters will not mend themselves on their own."
	
After waiting for more than six turns: 
	remind about assistance.

Understand "who" or "what" or "when" or "where" or "why" or "how" or "who's" or "what's" or "when's" or "where's" or "why's" or "how's" as "[query]". 

After reading a command:
	if the player's command includes "[query]" begin;
		say "[story title] understands commands, such as '[command prompt]examine [a random thing that can be seen by the player]', but not questions. You can get some information about the current game state with commands such as LOOK, EXAMINE, INVENTORY, PLACES, and OBJECTS; or, for more instructions, type HELP.";
		reject the player's command;
	end if;
	if the player's command includes "please" begin;
		say "(There is no need to say please.)";
		cut the matched text;
	end if.
	
Understand the command "breathe" as "smell".

Understand "look [something]" as examining. [* This is not good syntax but has been shown to be used frequently by both novice players and players whose only IF contact is very old IF.] 

Understand the commands "see" and "view" as "look". Understand the commands "observe" and "inspect" as "examine".

Understand the commands "wander" and "proceed" and "stroll" and "stride" and "strut" and "sneak" and "creep" and "rush" as "walk".

Understand the commands "hand" and "deliver" as "give".

Understand the command "depart" as "leave". 

Understand the command "carve" as "cut".
 
Understand the commands "grab" and "bring" and "fetch" and "steal" and "acquire" and "snatch" as "take".

Understand the commands "place" and "stick" and "shove" and "stuff" as "put".

Understand the commands "strike" and  "smack" and "injure" as "hit". 

Understand the commands "scream" and "yodel" and "yell" and "holler" and "roar" as "shout".

Understand the command "board" as "enter".

Understand the commands "toss" and "fling" and "hurl" as "throw".

Understand the commands "melt" and "ignite" and "incinerate" and "kindle" as "burn".

Understand "bite [something edible]" as eating. Understand "bite [something]" as attacking.

Understand "kick [something]" or "kick in/down/through [something]" as attacking.

Understand "start [something]" as switching on. Understand the command "activate" as "start". Understand "start over/again" as restarting the game.

Understand "stop [something]" as switching off. Understand the command "deactivate" as "stop".

Understand "reach for/towards/to [something]" as taking.

Understand "throw away [something]" as dropping.

Understand "jump on/onto [something]" as entering.

Understand "get down" as exiting.

Understand "around/about/away" as "[around]". Understand "castle/palace" as "[location name]". Understand "the [location name]" or "[location name]" as "[castle]". Understand "here/room/space/location" as "[locale]". Understand "in/at [locale]" or "in/at this [locale]" or "this [locale]" or "[locale]" as "[locally]".

Understand "wait [around]" or "wait [locally]" as waiting. Understand "wait in [any room]" as waiting within. 

Waiting within is an action applying to one thing. 

Carry out waiting within:
	if the noun is the location, try waiting instead;
	try approaching the noun;
	if the noun is the location, try waiting instead;
	otherwise stop the action.

Understand "look [around]" as looking.

Understand "go [around]" as going. Understand "go [around] [castle]" as going. Understand "search [castle]" or "look [around] [castle]" as going.

Understand "put out [something]" as extinguishing. Understand "blow out [something]" as extinguishing. Understand "blow on/in/through [something]" as blowing. Understand "extinguish [something]" as extinguishing. Understand the command "snuff" as "extinguish". Blowing is an action applying to one thing.

Understand "show inventory/invent/i/inv" as taking inventory.

Understand "pray for/to [text]" as praying to. Praying to is an action applying to one topic. Carry out praying to: say "You can see no immediate result."

Extinguishing is an action applying to one thing. Carry out extinguishing: say "[The noun] would have to be on fire, first." Instead of extinguishing the candle: try blowing the candle.

Understand "out of/from" or "from" as "[out of]". Understand "down on" or "on" as "[on]".

Understand "get [things inside] [out of] [something]" as removing it from.

Understand "set [things preferably held] down" as dropping. Understand "set [things preferably held] [on] [something]" as putting it on. Understand "set down [things preferably held]" as dropping.

Understand "end" as quitting the game.

[Understand "i [text]" as a mistake ("(Only imperative commands, such as LOOK, EXAMINE, GO WEST, and TAKE THE KEY, are understood. For more instructions, type HELP.)").]

Understand "finger/fingers/hand/hands/fist/fists/feet/foot/arm/arms/legs/leg/head/face/mouth/eyes/nose/ears/ear/eye" as "[body part]". Understand "my [body part]" or "[body part]" as "[specific anatomy]".

Understand "by/with/using" as "[means]".

After reading a command:
	if the player's command includes "head [a direction]":
		if the player's command includes "head":
			replace the matched text with "go";
	if the player's command includes "[means] [specific anatomy]":
		say "(It is usually not necessary to refer to specific body parts.)";
		cut the matched text;
		while the player's command includes "[means] [specific anatomy]":
			cut the matched text;
	if the player's command includes "[specific anatomy]":
		say "(It is usually not necessary to refer to specific body parts.)";
		replace the matched text with "me";
		while the player's command includes "[specific anatomy]":
			replace the matched text with "me";

	
Before putting something wearable on the player:
	if the player does not have the noun, try taking the noun;
	if the player has the noun, try wearing the noun instead. [* handles PUT THE HELMET ON MY HEAD]

Before removing something worn by the player from the player:
	try taking off the noun instead. [* handles REMOVE THE HELMET FROM MY HEAD, TAKE THE HELMET OFF MY HEAD, etc.]

Understand the command "ransack" as "search". Understand "search [any visited room]" as ransacking. Ransacking is an action applying to one thing. 

Carry out ransacking: 
	if the location is not the noun, try approaching the noun;
	otherwise try looking.
	
Understand the commands "wash" and "cleanse" as "clean".


Part 5 - Fancy Screen Effects

Section 1 - Improved Status Line

[This status line is designed to help the player track his exploration through the game: rooms that aren't explored yet are highlighted in red, and a count of explored rooms is kept in the lower left corner. We add the further refinement that, if the player is in a dark room, the compass line shows only exits which lead to lit rooms, on the assumption that he will be able to see lighted exits but not dark ones.]

Include Flexible Windows by Jon Ingold.

Table of User Styles (continued)
window	style name	background color
all-grid-windows	special-style-1	"#FF0000"

Table of Fancy Status
left	central	right 
" [if in darkness]Darkness[otherwise][location][end if]"	""	"[top rose]"
" [regional area]"	""	"[middle rose]"
" Rooms searched: [number of rooms which are visited]/[number of rooms]"	""	"[bottom rose]"
 
To say red reverse:
	say special-style-1;
	
To say default letters:
	say roman type;

Definition: a room is discernible: 
	if it is the Dank Room and the trapdoor is scenery, no;
	if it is lit, yes;
	if it is the ultimate location of the candle, yes;
	if in darkness, no;
	yes.

To say top rose:
	let place be the room up from the location;
	if the place is a discernible room, say "[if the place is unvisited][red reverse][end if]U   [default letters]"; otherwise say "    "; [* Originally I assumed that everyone would be using a white-letters-on-black status bar, and set the lettering to black and white after printing the first letter. This was a mistake, as many people on Windows Frotz have a default color scheme that makes the status bar blue-on-white -- so of course the white lettering on a white background didn't show at all. Moral: never ever make assumptions about the color scheme used by your audience.]
	let place be the room northwest from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]NW [default letters]"; otherwise say "   ";
	let place be the room north from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]N [default letters]"; otherwise say "  ";
	let place be the room northeast from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]NE[default letters]"; otherwise say "  ".
	
To say middle rose:
	say "    ";
	let place be the room west from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]W [default letters]"; otherwise say "  ";
	say " . ";
	let place be the room east from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if] E[default letters]"; otherwise say "  ".
	
To say bottom rose:
	let place be the room down from the location;
	if the place is a discernible room, say "[if the place is unvisited][red reverse][end if]D   [default letters]"; otherwise say "    ";
	let place be the room southwest from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]SW [default letters]"; otherwise say "   ";
	let place be the room south from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]S [default letters]"; otherwise say "  ";
	let place be the room southeast from the location;
	if place is a discernible room, say "[if the place is unvisited][red reverse][end if]SE[default letters]"; otherwise say "  ".

Rule for constructing the status line:
	fill status bar with Table of Fancy Status;
	say default letters;
	rule succeeds. 


Section 2 - Menu System

Include Menus by Emily Short. [* An extension to do menu systems on screen, using tables.]

Include Basic Help Menu by Emily Short. [* An extension that contains some boilerplate help text in a form compatible with the menu extension.]

Understand "menu" as asking for help.

When play begins:
	choose row 1 in the Table of Basic Help Options;
	now description entry is "[bold type][story title][roman type][paragraph break][story description]";
	choose row 2 in the Table of Basic Help Options;
	now title entry is "Instructions for Playing IF in General";

Table of Basic Help Options (continued)
title	subtable	description	toggle
"Special Commands In [story title]"	--	"[story title] has a few special commands not found in every game. 

GO TO {any room} will allow you to travel automatically, assuming that there are no locked doors or other impediments in your way. 

FIND {any object} will similarly take you to any items you have seen already (but not find anything that you haven't seen yet). 

LOOK {a direction} will tell you what lies that way without your having to go there.

ROOMS will list all the rooms you have visited so far; OBJECTS will similarly list all the things you have seen in the course of the game.

THINK ABOUT {any object} will provide extra information and sometimes context-sensitive hints, depending on what you have done so far.

NOVICE MODE ON and NOVICE MODE OFF toggle the functioning of novice mode, which puts in bold-face the names of objects the player might want to attend to, and offers some command suggestions each turn. The game runs very slightly more slowly in novice mode because it is also calculating what the player might like to do at each turn. It is recommended that the novice player try this for a while, then turn it off when he gets the hang of the command-driven interface. Novice mode does not list every possible command, only those that seem especially obvious or relevant at any given moment."	--
"Credits"	--	"Inform 7 is the work of Graham Nelson, and [story title] was compiled using Andrew Hunter's compiler for Mac OS X.

Admiral Jota, Dan Shiovitz, and David Welbourn offered some beta-testing corrections on an early prototype version of Bronze. The fuller version of the game was beta-tested by Annette Edelman, Michael Gentry, Dene Goodman, Yoon Ha Lee, Nick Montfort, Brian Rapp, and Dan Shiovitz. Bugs corrected after the first public release were submitted by Paul Trembath, Brett Witty, Nick Montfort, L. Ross Raszewski, Samuel Bronson, Christopher Tate, Brian Campbell, and Eric Eve.

Novice-friendly features are designed based on observations of frequent errors in logs of phpZork, rec.arts.int-fiction posts from players, and some analysis of novice transcripts by Aaron Reed."	--
"Contacting the Author"	--	"If you have any difficulties with [story title], feel free to contact me at emshort@mindspring.com."	--

[Number of beta-testers is negotiable; in general, the larger and more complex the piece, the more testers it needs. I try to get at least three for all but the simplest, smallest pieces. With Bronze, I was aiming at novice-friendliness, and so it was especially important to smooth down the rough edges of the parser and find the places where puzzles were underclued. So I looked for more testers and included some I hadn't worked with before, specifically because I wanted to test with some users who were *not* familiar and comfortable with my writing style. The testing list also includes a mix of more- and less-experienced players, and a range of interests (some are more apt to comment on writing, some on puzzle design, and so on).]
 
Table of Stuckness Advice (continued)
title	subtable	description	toggle
"Try hints"	--	"If you're still stuck after your best efforts, figure out what seems to be stumping you and try THINK ABOUT {whatever it is}. The game may have some suggestions to offer you."	--
 
	  
[And here we get rid of the "score notification" setting, because we don't want anyone to try turning it on.]
When play begins:
	choose row 2 in Table of Setting Options;
	now title entry is "[if novice mode is functioning]Novice mode on[otherwise]Novice mode off[end if]";
	now toggle entry is the switch novice mode rule.

This is the switch novice mode rule:
	if novice mode is functioning, now novice mode is dead;
	otherwise now novice mode is functioning.
	
Understand "credits" as asking for help. 

