Version 15/160122 of Flexible Windows (for Glulx only) by Jon Ingold begins here.

"Exposes the Glk windows system so authors can completely control the creation and use of windows"

[ Flexible Windows was originally by Jon Ingold, with many contributions by Erik Temple. This version has been essentially rewritten from scratch for 6L38 by Dannii Willis. ]

[ Migration guide from version 14:
- Many kinds, properties and the main/status windows have lost their hyphens
- Colours/styles updated to match GTE
- The window-drawing rules have been turned into the refreshing activity. It is no longer necessary to focus or clear the window
- The hyperlink processing rules have been turned into the processing hyperlinks activity.
]

[ TODO:
model the quote window too?
bordered windows
echo streams?
input phrases
]



Use authorial modesty.

Include version 1/140512 of Alternative Startup Rules by Dannii Willis.
Include version 10/150620 of Glulx Entry Points by Emily Short.
Include version 5/140516 of Glulx Text Effects by Emily Short.



Section - Interpreter Sniffing (for use with Interpreter Sniffing by Friends of I7)

[ Because we hack the glk_window_open() function, we must delay the resniffing rules until after the initialise memory rule ]
The resniffing stage rule is not listed in the startup rules.
Before starting the virtual machine (this is the alternate resniffing stage rule):
	consider the resniffing rules;



Part - Windows

Chapter - The g-window kind

[ g-windows must be a kind of container in order to use the containment relation as the spawning relation. Be careful if you iterate through all containers! ]
A g-window is a kind of container.
The specification of a g-window is "Models the Glk window system."

A g-window type is a kind of value.
The g-window types are g-text-buffer, g-text-grid and g-graphics.
The specification of a g-window type is "Glk windows are one of these three types."
A g-window has a g-window type called type.
Definition: a g-window is graphical rather than textual if the type of it is g-graphics.

A graphics g-window is a kind of g-window.
The type of a graphics g-window is g-graphics.
A text buffer g-window is a kind of g-window.
The type of a text buffer g-window is g-text-buffer.
A text grid g-window is a kind of g-window.
The type of a text grid g-window is g-text-grid.

A g-window position is a kind of value.
The g-window positions are g-placenull, g-placeleft, g-placeright, g-placeabove and g-placebelow.
The specification of a g-window position is "Specifies which direction a window will be split off from its parent window."
A g-window has a g-window position called position.
Definition: a g-window is vertically positioned rather than horizontally positioned if the position of it is at least g-placeabove.

A g-window scale method is a kind of value.
The g-window scale methods are g-proportional, g-fixed-size and g-using-minimum.
The specification of a g-window scale method is "Specifies how a new window will be split from its parent window."
A g-window has a g-window scale method called scale method.

A g-window has a number called measurement.
The measurement of a g-window is usually 40.

A g-window has a number called minimum size.

A g-window has a number called the rock.

A g-window has a number called ref number.

A g-window can be g-required or g-unrequired.
A g-window is usually g-unrequired.

A g-window can be g-present or g-unpresent.
A g-window is usually g-unpresent.



Chapter - The spawning relation

[ The most efficient relations use the object tree. Inform will only use the object tree for a few built in relations however, so we piggy back on to the containment relation. ]
The verb to spawn implies the containment relation.

The verb to be ancestral to implies the enclosure relation.
The verb to be descended from implies the reversed enclosure relation.



Chapter - Windows for the styles table

[ These things *must* be defined first in order for sorting to work. ]

All-windows is a g-window.
All-buffer-windows is a g-window.
All-grid-windows is a g-window.



Chapter - The built-in windows

The main window is a text buffer g-window.

The status window is a text grid g-window spawned by the main window.
The position of the status window is g-placeabove.
The scale method of the status window is g-fixed-size.
The measurement of the status window is 1.

Use no status line translates as (- Constant USE_NO_STATUS_LINE 1; -).
[Include (-
#ifndef USE_NO_STATUS_LINE;
Constant USE_NO_STATUS_LINE 0;
#endif;
-).]



Section - Styles for the built-in windows

[ These are the original styles set by Inform in VM_Initialise(). ]

Table of User Styles (continued)
window	style name	reversed	justification	font weight	italic
all-buffer-windows	italic-style	--	--	regular-weight	true
all-buffer-windows	header-style	--	left-justified
all-grid-windows	all-styles	true



Section - Open the built-in windows

The open the built-in windows using Flexible Windows rule is listed instead of the open built-in windows rule in the for starting the virtual machine rulebook.
This is the open the built-in windows using Flexible Windows rule:
	if the main window is g-unpresent:
		open the main window;
	otherwise:
		clear the main window;
	if the no status line option is active:
		close the status window;
	otherwise:
		open the status window;
	continue the activity;



Part - Variables and phrases to access the I6 template layer - unindexed

GG_MAINWIN_ROCK is a number variable.
GG_MAINWIN_ROCK variable translates into I6 as "GG_MAINWIN_ROCK".
GG_STATUSWIN_ROCK is a number variable.
GG_STATUSWIN_ROCK variable translates into I6 as "GG_STATUSWIN_ROCK".
GG_QUOTEWIN_ROCK is a number variable.
GG_QUOTEWIN_ROCK variable translates into I6 as "GG_QUOTEWIN_ROCK".

gg_mainwin is a number variable.
The gg_mainwin variable translates into I6 as "gg_mainwin".
gg_statuswin is a number variable.
The gg_statuswin variable translates into I6 as "gg_statuswin".
gg_quotewin is a number variable.
The gg_quotewin variable translates into I6 as "gg_quotewin".

[ We often wrap a phrase or rule around a core glk function, so that there is no good name to give to the actual function's phrase. So instead let's just define them using the I6 function's name here. This also means we can reduce the number of unindexed sections. ]

To call glk_request_hyperlink_event for (win - a g-window):
	(- glk_request_hyperlink_event( {win}.(+ ref number +) ); -).

To call glk_set_window for (win - a g-window):
	(- glk_set_window( {win}.(+ ref number +) ); -).

To call FW_glk_window_close for (ref - a number):
	(- FW_glk_window_close( {ref}, 0 ); -).

Include (-
[ FW_glk_window_close _vararg_count;
  ! glk_window_close(window, &{uint, uint})
  @glk 36 _vararg_count 0;
  return 0;
];
-).

To set the background color of (win - a g-window) to (T - a text):
	(- glk_window_set_background_color( {win}.(+ ref number +), GTE_ConvertColour( {-by-reference:T} ) ); -).

To decide which number is the glk event window reference:
	(- ( gg_event-->1 ) -).

To decide which number is the glk event val1:
	(- ( gg_event-->2 ) -).
	
[ Fix spurious line breaks from being printed in the main window after running the refreshing activity ]
To safely carry out the (A - activity on value of kind K) activity with (val - K):
	(- @push say__p; @push say__pc; CarryOutActivity( {A}, {val} ); @pull say__pc; @pull say__p; -).



Section - And some phrases to find windows - unindexed

To decide which g-window is the invalid window:
	(- ( nothing ) -).

To decide which g-window is the parent of (win - a g-window):
	if the holder of win is a g-window:
		decide on the holder of win;
	decide on the invalid window;

To decide which g-window is the glk event window:
	let N be the glk event window reference;
	repeat with win running through g-present g-windows:
		if N is the ref number of win:
			decide on win;
	decide on the acting main window;

To decide which g-window is the window with ref (ref - a number):
	if ref is not 0:
		repeat with win running through g-windows:
			if the ref number of win is ref:
				decide on win;
	decide on the invalid window;

To decide which g-window is the window with rock (rock - a number):
	if rock is not 0:
		repeat with win running through g-windows:
			if the rock of win is rock:
				decide on win;
	decide on the invalid window;



Part - The Flexible Windows API

Chapter - Opening and closing windows

To open up/-- (win - a g-window), as the acting main window:
	if win is g-unpresent and (win is the main window or the main window is ancestral to win):
		now win is g-required;
		now every g-window ancestral to win is g-required;
		calibrate windows;
		if as the acting main window:
			set win as the acting main window

To close (win - a g-window):
	if win is g-present:
		now win is g-unrequired;
		now every g-window descended from win is g-unrequired;
		calibrate windows;

To shut down (win - a g-window) (deprecated):
	close win;



Section - Calibrating windows - unindexed

A g-window can be currently being processed.

Definition: a g-window is paternal rather than childless if it spawns a g-present g-window.

Definition: a g-window is a next-step if it is the main window or it is spawned by something g-present.

To calibrate windows:
	[ Close windows that shouldn't be open and then open windows that shouldn't be closed ]
	while there is a not currently being processed g-unrequired g-present childless g-window (called win):
		[ Only run each window once, even if we end up back in this loop (by open/close being called in a before rule), to prevent infinite loops ]
		now win is currently being processed;
		safely carry out the deconstructing activity with win;
		now win is not currently being processed;
	while there is a not currently being processed g-required g-unpresent next-step g-window (called win):
		now win is currently being processed;
		safely carry out the constructing activity with win;
		now win is not currently being processed;



Section - Constructing a window

Constructing something is an activity on g-windows.

Before constructing a g-window (called win) (this is the fix method and measurement rule):
	let the parent be the parent of win;
	if parent is the invalid window:
		continue the activity;
	[ Fix broken proportions ]
	if the scale method of win is g-proportional:
		if the measurement of win > 100 or the measurement of win < 0:
			now the scale method of win is g-fixed-size;
	[ Tile windows automatically ]
	if the position of win is g-placenull:
		if the parent is vertically positioned:
			now the position of win is g-placeright;
		otherwise:
			now the position of win is g-placeabove;
	[ Reset the minimum ]
	if the scale method of win is g-using-minimum:
		now the scale method of win is g-proportional;
	[ Use the minimum size ]
	if the scale method of win is g-proportional:
		let the minimum size be 100 multiplied by the minimum size of win;
		let the calculated size be the measurement of win multiplied by the width of the parent;
		if win is vertically positioned:
			now the calculated size is the measurement of win multiplied by the height of the parent;
		if the minimum size > the calculated size:
			now the scale method of win is g-using-minimum;

The construct a g-window rule is listed in the for constructing rules.
The construct a g-window rule translates into I6 as "FW_ConstructGWindow".
Include (-
[ FW_ConstructGWindow win parentwin method size type rock;
	win = parameter_value;
	! Fill in parentwin, method and size only if the window is not the main window
	if ( win ~= (+ main window +) )
	{
		parentwin = parent( win ).(+ ref number +);
		if ( win.(+ scale method +) == (+ g-proportional +) )
		{
			method = winmethod_Proportional;
		}
		else
		{
			method = winmethod_Fixed;
		}
		method = method + win.(+ position +) - 2;
		if ( win.(+ scale method +) == (+ g-using-minimum +) )
		{
			size = win.(+ minimum size +);
		}
		else
		{
			size = win.(+ measurement +);
		}
	}
	type = win.(+ type +) + 2;
	rock = win.(+ rock +);
	win.(+ ref number +) = FW_glk_window_open( parentwin, method, size, type, rock );
	rfalse;
];

[ FW_glk_window_open _vararg_count ret;
  ! glk_window_open(window, uint, uint, uint, uint) => window
  @glk 35 _vararg_count ret;
  return ret;
];
-).

First after constructing a g-window (called win) (this is the check if the window was created rule):
	if the ref number of win is zero:
		now win is g-unrequired;
		rule fails;
	otherwise:
		now win is g-present;



Section - Deconstructing windows

Deconstructing something is an activity on g-windows.

For deconstructing a g-window (called win) (this is the basic deconstruction rule):
	now win is g-unpresent;
	call FW_glk_window_close for the ref number of win;



Chapter - Clearing and refreshing windows

To clear (win - a g-window):
	(- glk_window_clear( {win}.(+ ref number +) ); -).

To refresh (win - a g-window):
	safely carry out the refreshing activity with win;

To refresh all/-- windows:
	repeat with win running through g-present g-windows:
		refresh win;

Refreshing something is an activity on g-windows.
The refreshing activity has a g-window called stored current window.

Before refreshing a g-window (called win) (this is the prepare for refreshing rule):
	now the stored current window is the current focus window;
	if win is g-present:
		clear win;
		focus win;

A first for refreshing a g-window (called win) (this is the check the window is present rule):
	if win is g-present:
		continue the activity;

After refreshing a g-window (this is the refocus the current focus window rule):
	focus the stored current window;

After constructing a g-window (called win) (this is the refresh the window rule):
	refresh win;

A glulx input handling rule for an arrange-event (this is the refresh windows after arranging rule):
	refresh all windows;

A glulx input handling rule for a redraw-event (this is the refresh graphical windows rule):
	repeat with win running through g-present graphical g-windows:
		refresh win;

A glulx object-updating rule (this is the refresh windows after restoring rule):
	refresh all windows;



Chapter - Focus and changing the acting main window

The current focus window is a g-window variable.

The acting main window is a g-window variable.
The acting main window is the main window.

The current input window is a g-window variable.
The current input window is the main window.

To focus (win - a g-window):
	if win is g-present:
		now the current focus window is win;
		call glk_set_window for win;

To set (win - a g-present textual g-window) as the acting main window:
	now the acting main window is win;
	now the current input window is win;
	now gg_mainwin is the ref number of win;
	focus win;
	let the status window state be whether or not the status window is g-present;
	close the status window;
	now the status window is spawned by win;
	if the status window state is true:
		open the status window;

[ Not strictly needed, but to allow FW to be controlled solely through phrases rather than variables ]
To set (win - a g-window) as the current input window:
	if win is g-present:
		now the current input window is win;

To set/move/shift the/-- focus to (win - a g-window), clearing the window (deprecated):
	if win is g-present:
		focus win;
		if clearing the window:
			clear win;

To open up/-- (win - a g-window) as the/-- main/current/-- text/-- output window (deprecated):
	open win, as the acting main window;

To open up/-- (win - a g-window) as the/-- main/current/-- text/-- input window (deprecated):
	open win;
	set win as the current input window;



Chapter - Window measurements

To decide what number is the height of (win - a g-window):
	(- FW_WindowSize( {win}, 1 ) -).

To decide what number is the width of (win - a g-window):
	(- FW_WindowSize( {win}, 0 ) -).

[ Is this useful? ]
To decide which number is the measure of (win - a g-window) (deprecated):
	if win is vertically positioned:
		decide on the height of win;
	decide on the width of win;

Include (-  
[ FW_WindowSize win index;
	! if win is g-present:
	if ( GetEitherOrProperty( win, (+ g-present +) ) )
	{
		glk_window_get_size( win.(+ ref number +), gg_arguments, gg_arguments + WORDSIZE );
		return gg_arguments-->index;
	}
	return 0;
];
-).



Part - Keeping the built-in windows up to date

Chapter - Handling GGRecoverObjects()

[ First ensure that window rocks are assigned ]
A glulx zeroing-reference rule (this is the set g-window rocks rule):
	if the rock of the main window is 0:
		now the rock of the main window is GG_MAINWIN_ROCK;
		now the rock of the status window is GG_STATUSWIN_ROCK;
		let i be 1000;
		repeat with win running through g-windows:
			if the rock of win is 0:
				now the rock of win is i;
				increase i by 10;

A glulx zeroing-reference rule (this is the reset window properties rule):
	repeat with win running through g-windows:
		now the ref number of win is 0;
		now win is g-unpresent;
		now win is not currently being processed;

[ Find all present windows, mark them as present and store their ref numbers. Note this will not run for the built in windows. ]
A glulx resetting-windows rule (this is the find existing windows rule):
	let win be the window with rock current glulx rock;
	if win is not the invalid window:
		now the ref number of win is the current glulx rock-ref;
		now win is g-present;

A first glulx object-updating rule (this is the recalibrate windows rule):
	[ I used to think it wasn't safe to call the calibrate windows phrase here, but I can't really think why now ]
	calibrate windows;
	focus the current focus window;

A first glulx object-updating rule (this is the find the built in windows rule):
	if gg_mainwin is not 0:
		now the ref number of the main window is gg_mainwin;
		now the main window is g-present;
		now gg_mainwin is the ref number of the acting main window;
	if gg_statuswin is not 0:
		now the ref number of the status window is gg_statuswin;
		now the status window is g-present;



Chapter - Updating windows that we control

After constructing a textual g-window (called win) (this is the focus the acting main window rule):
	if win is the acting main window:
		focus the acting main window;

After constructing a textual g-window (called win) (this is the update the I6 window variables rule):
	if win is the acting main window:
		now gg_mainwin is the ref number of win;
	if win is the status window:
		now gg_statuswin is the ref number of win;
		[ statuswin_cursize/statuswin_size? - make a rule for deconstructing too? ]

Before deconstructing a textual g-window (called win) (this is the fix the current windows rule):
	let parent be the parent of win;
	if parent is the invalid window:
		continue the activity;
	if win is the acting main window:
		set parent as the acting main window;
	if win is the current focus window:
		focus parent;
	if win is the current input window:
		set the acting main window as the current input window;

After deconstructing a textual g-window (called win) (this is the clear the I6 window variables rule):
	[ The fix the current windows rule could have changed the acting main window to something other than win, so we don't check for win. ]
	if the acting main window is g-unpresent:
		now gg_mainwin is 0;
	if win is the status window:
		now gg_statuswin is 0;



Chapter - Interjecting for windows we don't control - unindexed

[ To account for the template code which creates and destroys windows we will high-jack the I6 glk functions and take over if possible ]

Include (-
Replace glk_window_open;
Replace glk_window_close;
-) before "Glulx.i6t".

Include (-
[ glk_window_open parent method size type rock result;
	result = ( (+ handling an unscheduled construction +)-->1 )( parent, method, size, type, rock );
	if ( result == 0 )
	{
		return FW_glk_window_open( parent, method, size, type, rock );
	}
	return result;
];

[ glk_window_close ref;
	( (+ handling an unscheduled deconstruction +)-->1 )( ref );
	return 0;
];
-) after "Glulx.i6t".

To decide which number is the result from handling an unscheduled construction from (parent - a number) with method (method - a number) and size (size - a number) and type (type - a number) and rock (rock - a number) (this is handling an unscheduled construction):
	let parent win be the window with ref parent;
	let win be the window with rock rock;
	if parent win is the invalid window or win is the invalid window:
		decide on 0;
	now win is spawned by parent win;
	now the position of win is the position from method;
	now the scale method of win is the scale method from method;
	now the measurement of win is the size;
	now the type of win is the type from type;
	open win;
	decide on the ref number of win;

To handle an unscheduled deconstruction from (ref - a number) (this is handling an unscheduled deconstruction):
	let win be the window with ref ref;
	if win is the invalid window:
		call FW_glk_window_close for ref;
	otherwise:
		close win;

To decide which g-window position is the position from (method - a number):
	(- FW_PositionFromNum( {method} ) -).

To decide which g-window scale methods is the scale method from (method - a number):
	(- FW_ScaleMethodFromNum( {method} ) -).

To decide which g-window type is the type from (type - a number):
	(- FW_TypeFromNum( {type} ) -).

Include (-
[ FW_PositionFromNum method;
	switch ( method & winmethod_DirMask )
	{
		winmethod_Left: return (+ g-placeleft +);
		winmethod_Right: return (+ g-placeright +);
		winmethod_Above: return (+ g-placeabove +);
		winmethod_Below: return (+ g-placebelow +);
	}
];

[ FW_ScaleMethodFromNum method;
	switch ( method & winmethod_DivisionMask )
	{
		winmethod_Fixed: return (+ g-fixed-size +);
		winmethod_Proportional: return (+ g-proportional +);
	}
];

[ FW_TypeFromNum type;
	switch ( type )
	{
		wintype_TextBuffer: return (+ g-text-buffer +);
		wintype_TextGrid: return (+ g-text-grid +);
		wintype_Graphics: return (+ g-graphics +);
	}
];
-).



Part - Window styles

[ We extend Glulx Text Effects to allow you to specify styles for specific windows ]

Chapter - Extending Glulx Text Effects

Section - The Extended Table of User Styles definition (in place of Section - The Table of User Styles definition in Glulx Text Effects by Emily Short)

Table of User Styles
window (a g-window)	style name (a glulx text style)	background color (a text)	color (a text)	first line indentation (a number)	fixed width (a truth state)	font weight (a font weight)	indentation (a number)	italic (a truth state)	justification (a text justification)	relative size (a number)	reversed (a truth state)
--



Section - Sorting the Table of User Styles

[ Sort the table of User Styles taking into account both the style name and the window ]

The Flexible Windows sort the Table of User Styles rule is listed instead of the sort the Table of User Styles rule in the before starting the virtual machine rules.
Before starting the virtual machine (this is the Flexible Windows sort the Table of User Styles rule):
	[ First fix the empty columns we require ]
	repeat through the Table of User Styles:
		[ rows without specified windows will be applied to all buffer windows ]
		if there is no window entry:
			now the window entry is all-buffer-windows;
		if there is no style name entry:
			now the style name entry is all-styles;
	sort the Table of User Styles in style name order;
	sort the Table of User Styles in window order;
	let row1 be 1;
	let row2 be 2;
	[ Overwrite the first row of each style with the specifications of subsequent rows of the style ]
	while row2 <= the number of rows in the Table of User Styles:
		choose row row2 in the Table of User Styles;
		if there is a style name entry:
			if (the window in row row1 of the Table of User Styles) is the window entry and (the style name in row row1 of the Table of User Styles) is the style name entry:
				if there is a background color entry:
					now the background color in row row1 of the Table of User Styles is the background color entry;
				if there is a color entry:
					now the color in row row1 of the Table of User Styles is the color entry;
				if there is a first line indentation entry:
					now the first line indentation in row row1 of the Table of User Styles is the first line indentation entry;
				if there is a fixed width entry:
					now the fixed width in row row1 of the Table of User Styles is the fixed width entry;
				if there is a font weight entry:
					now the font weight in row row1 of the Table of User Styles is the font weight entry;
				if there is a indentation entry:
					now the indentation in row row1 of the Table of User Styles is the indentation entry;
				if there is a italic entry:
					now the italic in row row1 of the Table of User Styles is the italic entry;
				if there is a justification entry:
					now the justification in row row1 of the Table of User Styles is the justification entry;
				if there is a relative size entry:
					now the relative size in row row1 of the Table of User Styles is the relative size entry;
				if there is a reversed entry:
					now the reversed in row row1 of the Table of User Styles is the reversed entry;
				blank out the whole row;
			otherwise:
				now row1 is row2;
		increment row2;
	[ Sort once more to put the blank rows at the bottom ]
	sort the Table of User Styles in window order;



Section - Enhanced phrases for applying styles to specific window types - unindexed

To set the background color of wintype (W - a number) for (style - a glulx text style) to (N - a text):
	(- GTE_SetStylehint( {W}, {style}, stylehint_BackColor, GTE_ConvertColour( {-by-reference:N} ) ); -).

To set the color of wintype (W - a number) for (style - a glulx text style) to (N - a text):
	(- GTE_SetStylehint( {W}, {style}, stylehint_TextColor, GTE_ConvertColour( {-by-reference:N} ) ); -).

To set the first line indentation of wintype (W - a number) for (style - a glulx text style) to (N - a number):
	(- GTE_SetStylehint( {W}, {style}, stylehint_ParaIndentation, {N} ); -).

To set fixed width of wintype (W - a number) for (style - a glulx text style) to (N - truth state):
	(- GTE_SetStylehint( {W}, {style}, stylehint_Proportional, ( {N} + 1 ) % 2 ); -).

To set the font weight of wintype (W - a number) for (style - a glulx text style) to (N - a font weight):
	(- GTE_SetStylehint( {W}, {style}, stylehint_Weight, {N} - 2 ); -).

To set the indentation of wintype (W - a number) for (style - a glulx text style) to (N - a number):
	(- GTE_SetStylehint( {W}, {style}, stylehint_Indentation, {N} ); -).

To set italic of wintype (W - a number) for (style - a glulx text style) to (N - a truth state):
	(- GTE_SetStylehint( {W}, {style}, stylehint_Oblique, {N} ); -).

To set the justification of wintype (W - a number) for (style - a glulx text style) to (N - a text justification):
	(- GTE_SetStylehint( {W}, {style}, stylehint_Justification, {N} - 1 ); -).

To set the relative size of wintype (W - a number) for (style - a glulx text style) to (N - a number):
	(- GTE_SetStylehint( {W}, {style}, stylehint_Size, {N} ); -).

To set reversed of wintype (W - a number) for (style - a glulx text style) to (N - a truth state):
	(- GTE_SetStylehint( {W}, {style}, stylehint_ReverseColor, {N} ); -).

[ And some phrases to clear them again. ]

To clear the background color of wintype (W - a number) for (style - a glulx text style):
	(- FW_ClearStylehint( {W}, {style}, stylehint_BackColor, ); -).

To clear the color of wintype (W - a number) for (style - a glulx text style):
	(- FW_ClearStylehint( {W}, {style}, stylehint_TextColor ); -).

To clear the first line indentation of wintype (W - a number) for (style - a glulx text style):
	(- FW_ClearStylehint( {W}, {style}, stylehint_ParaIndentation ); -).

To clear fixed width of wintype (W - a number) for (style - a glulx text style):
	(- FW_ClearStylehint( {W}, {style}, stylehint_Proportional ); -).

To clear the font weight of wintype (W - a number) for (style - a glulx text style):
	(- FW_ClearStylehint( {W}, {style}, stylehint_Weight ); -).

To clear the indentation of wintype (W - a number) for (style - a glulx text style):
	(- FW_ClearStylehint( {W}, {style}, stylehint_Indentation ); -).

To clear italic of wintype (W - a number) for (style - a glulx text style):
	(- FW_ClearStylehint( {W}, {style}, stylehint_Oblique ); -).

To clear the justification of wintype (W - a number) for (style - a glulx text style):
	(- FW_ClearStylehint( {W}, {style}, stylehint_Justification ); -).

To clear the relative size of wintype (W - a number) for (style - a glulx text style):
	(- FW_ClearStylehint( {W}, {style}, stylehint_Size ); -).

To clear reversed of wintype (W - a number) for (style - a glulx text style):
	(- FW_ClearStylehint( {W}, {style}, stylehint_ReverseColor ); -).

Include (-
[ FW_ClearStylehint wintype style hint i;
	if ( style == (+ all-styles +) )
	{
		for ( i = 0: i < style_NUMSTYLES : i++ )
		{
			glk_stylehint_clear( wintype, i, hint );
		}
	}
	else
	{
		glk_stylehint_clear( wintype, style - 2, hint );
	}
];
-).



Section - Applying the generic styles

[ At this stage only apply the generic (non window specific) styles. ]

The set text styles rule is not listed in any rulebook.
A glulx zeroing-reference rule (this is the set generic text styles rule):
	let W be a number;
	repeat through the Table of User Styles:
		if the window entry is:
			-- All-windows:
				now W is 0;
			-- All-buffer-windows:
				now W is 3;
			-- All-grid-windows:
				now W is 4;
			-- otherwise:
				break;
		if there is a background color entry:
			set the background color of wintype W for the style name entry to the background color entry;
		if there is a color entry:
			set the color of wintype W for the style name entry to the color entry;
		if there is a first line indentation entry:
			set the first line indentation of wintype W for the style name entry to the first line indentation entry;
		if there is a fixed width entry:
			set fixed width of wintype W for the style name entry to the fixed width entry;
		if there is a font weight entry:
			set the font weight of wintype W for the style name entry to the font weight entry;
		if there is a indentation entry:
			set the indentation of wintype W for the style name entry to the indentation entry;
		if there is a italic entry:
			set italic of wintype W for the style name entry to the italic entry;
		if there is a justification entry:
			set the justification of wintype W for the style name entry to the justification entry;
		if there is a relative size entry:
			set the relative size of wintype W for the style name entry to the relative size entry;
		if there is a reversed entry:
			set reversed of wintype W for the style name entry to the reversed entry;

[ Gargoyle sets the cursor color to whatever the last text-buffer color hint was. We will reset it using a variable the story author can change.
This is apparently by design, but seems unuseful and buggy to me. I raised the issue at https://groups.google.com/forum/#!topic/garglk-dev/DdqG0Ppt2lY ]

The Gargoyle cursor color is initially "#000000".
After constructing a textual g-window (this is the Gargoyle cursor color rule):
	set the color of wintype 3 for normal-style to the Gargoyle cursor color;



Section - Applying window specific styles

[ Apply styles before constructing a window and then clear them afterwards. This is tricky because we must reinstate the generic styles. ]

Before constructing a textual g-window (called win) (this is the set the window specific styles rule):
	let W be a number;
	let found the window be a truth state;
	if the type of win is:
		-- g-text-buffer:
			now W is 3;
		-- g-text-grid:
			now W is 4;
		-- g-graphics:
			continue the activity;
	repeat through the Table of User Styles:
		unless the window entry is win:
			if found the window is true:
				continue the activity;
			next;
		now found the window is true;
		if there is a background color entry:
			set the background color of wintype W for the style name entry to the background color entry;
		if there is a color entry:
			set the color of wintype W for the style name entry to the color entry;
		if there is a first line indentation entry:
			set the first line indentation of wintype W for the style name entry to the first line indentation entry;
		if there is a fixed width entry:
			set fixed width of wintype W for the style name entry to the fixed width entry;
		if there is a font weight entry:
			set the font weight of wintype W for the style name entry to the font weight entry;
		if there is a indentation entry:
			set the indentation of wintype W for the style name entry to the indentation entry;
		if there is a italic entry:
			set italic of wintype W for the style name entry to the italic entry;
		if there is a justification entry:
			set the justification of wintype W for the style name entry to the justification entry;
		if there is a relative size entry:
			set the relative size of wintype W for the style name entry to the relative size entry;
		if there is a reversed entry:
			set reversed of wintype W for the style name entry to the reversed entry;

A first after constructing a textual g-window (called win) (this is the clear the window specific styles rule):
	let W be a number;
	let resetting required be a truth state;
	if the type of win is:
		-- g-text-buffer:
			now W is 3;
		-- g-text-grid:
			now W is 4;
		-- g-graphics:
			continue the activity;
	repeat through the Table of User Styles:
		unless the window entry is win:
			if resetting required is true:
				break;
			next;
		now resetting required is true;
		if there is a background color entry:
			clear the background color of wintype W for the style name entry;
		if there is a color entry:
			clear the color of wintype W for the style name entry;
		if there is a first line indentation entry:
			clear the first line indentation of wintype W for the style name entry;
		if there is a fixed width entry:
			clear fixed width of wintype W for the style name entry;
		if there is a font weight entry:
			clear the font weight of wintype W for the style name entry;
		if there is a indentation entry:
			clear the indentation of wintype W for the style name entry;
		if there is a italic entry:
			clear italic of wintype W for the style name entry;
		if there is a justification entry:
			clear the justification of wintype W for the style name entry;
		if there is a relative size entry:
			clear the relative size of wintype W for the style name entry;
		if there is a reversed entry:
			clear reversed of wintype W for the style name entry;
	[ I'm not sure if this will be too much of a performance hit, but it's the simplest solution ]
	if resetting required is true:
		follow the set generic text styles rule;



Chapter - Window background colors

A g-window has a text called background color.

[ This needs to run before the set the window specific styles rule so that it won't overwrite any window specific backgrounds. ]
First before constructing a textual g-window (called win) (this is the set the background color of textual windows rule):
	if the background color of win is not empty:
		set the background color of wintype 0 for all-styles to the background color of win;

[ This needs to be run before the clear the window's styles rule so that it doesn't erase the styles reset by the set generic text styles rule ]
First after constructing a textual g-window (called win) (this is the reset the background color of textual windows rule):
	if the background color of win is not empty:
		clear the background color of wintype 0 for all-styles;

After constructing a graphical g-window (called win) (this is the set the background color of graphics windows rule):
	if the background color of win is not empty:
		set the background color of win to the background color of win;
		clear win;

[ As explained by Ben Cressey (http://groups.google.com/group/rec.arts.int-fiction/msg/b88316e2dcf1bb6b)
Gargoyle sets the colour of its window padding based on the last background colour style hint given to the normal style. So after clearing all the background colours and styles, we set it based on the background color of the main window, or just set white if it isn't set. ]

After constructing a textual g-window (this is the Gargoyle window padding rule):
	let T be the background color of the acting main window;
	if T is empty:
		let T be "#FFFFFF";
	set the background color of wintype 3 for normal-style to T;



Part - Input events

Chapter - Hyperlinks

To say link (N - a number):
	(- if ( glk_gestalt( gestalt_Hyperlinks, 0 ) ) { glk_set_hyperlink( {N} ); } -).

To say end link:
	(- if ( glk_gestalt( gestalt_Hyperlinks, 0 ) ) { glk_set_hyperlink( 0 ); } -).

Processing hyperlinks for something is an activity on g-windows.
The processing hyperlinks activity has a number called the hyperlink ID.

After constructing a textual g-window (called win) (this is the request hyperlink events rule):
	if glk hyperlinks are supported:
		call glk_request_hyperlink_event for win;

A glulx input handling rule for a hyperlink-event (this is the default hyperlink handling rule):
	carry out the processing hyperlinks activity with the glk event window;

Before processing hyperlinks (this is the prepare for processing hyperlinks rule):
	now the hyperlink ID is the glk event val1;

Last for processing hyperlinks (this is the default hyperlink command replacement rule):
	repeat through the Table of Glulx Hyperlink Replacement Commands:
		if the hyperlink ID is link ID entry:
			now the glulx replacement command is replacement entry;
			rule succeeds;
	now the glulx replacement command is "";

Table of Glulx Hyperlink Replacement Commands
link ID (number)	replacement (text)
--

After processing hyperlinks for a g-window (called win) (this is the request hyperlink events again rule):
	call glk_request_hyperlink_event for win;



Flexible Windows ends here.
