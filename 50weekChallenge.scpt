set contactName to "NAME AND LAST NAME OF THE CONTACT HERE"

on theSplit(theString, theDelimiter)
	-- save delimiters to restore old settings
	set oldDelimiters to AppleScript's text item delimiters
	-- set delimiters to delimiter to be used
	set AppleScript's text item delimiters to theDelimiter
	-- create the array
	set theArray to every text item of theString
	-- restore the old setting
	set AppleScript's text item delimiters to oldDelimiters
	-- return the result
	return theArray
end theSplit

-- Challenge text
set challenge to "WEEK 1;Portrait: Self Portrait;Start things off right with a 'selfie'! Explore the self timer setting on your camera.|WEEK 2;Landscape: Traditional Landscape;Shoot a beautiful landscape and share it with the world. Find a nice foreground and don't forget the sky.|WEEK 3;Artistic: Red;Shoot whatever inspires you. Red should be the focus of the image. Don't be afraid to be creative.|WEEK 4;Portrait: Headshot;You shot a selfie, now shoot a 'selfie' of someone else!|WEEK 5;Landscape: Black and White;Look for a scene with great contrast that will make a great black and white.|WEEK 6;Artistic: Candy;Your artistic interpretation this week should be inspired by something sweet. A great chance to play with macro photography.|WEEK 7;Portrait: Faceless;Tell someone's story without showing their face.|WEEK 8;Landscape: Wide Angle/Panorama;This is a great opportunity to explore panorama stitching and create a wide sweeping landscape.|WEEK 9;Artistic: Shadows;The opposite of light is dark, the absence of light is shadow. Interpret this into a masterpiece.|WEEK 10;Portrait: Environmental;Show a subject in their natural habitat. Their place of work or hobby is a great start. Tell their story with the environment|WEEK 11;Landscape: Reflection;Find a way to show your landscape/natural beauty in reflection. The mirror world revealed.|WEEK 12;Artistic: Transportation;Our world is one defined by how we get around. Literal or interpretative, find inspiration in transportation.|WEEK 13;Portrait: High Key;Expose to the right and create a light, airy high key portrait.|WEEK 14;Landscape: Zoomed in;Most landscapes are wide sweeping images. Try an alternative and zoom in instead.|WEEK 15;Artistic: Metal;Cold, hard steel. Shiny Aluminum. Or even rusted and broken down. Find your inspiration in metal this week.|WEEK 16;Portrait: Movement;Most portraits are stationary, so this week explore adding some movement. Dancing, twirling, or even hair flips.|WEEK 17;Landscape: Urbanscape;Most Landscapes are wide open spaces of natural beauty... this week find the beauty of the urbanscape/cityscape.|WEEK 18;Artistic: Texture;The artistic inspiration this week is texture. You should almost be able to feel the image.|WEEK 19;Portrait: Messy;Take an amazing portrait of someone, make a mess while you are doing it.|WEEK 20;Landscape: Nightowl;A tripod is going to be handy this week... time to shoot a night landscape. Look for some light for the scene! Car lights, city lights, or maybe just moonlight.|WEEK 21;Artistic: Fantasy;Is this real life, or is this just fantasy... Your artistic inspiration this week is fantasy.|WEEK 22;Portrait: Hands;Usually the face is the strongest element in the frame; with the hands being second. Make the hands the most important element in your image this week.|WEEK 23;Landscape: Weather;This week should be as unpredictable as the weather! Feature the weather in this week's landscape.|WEEK 24;Artistic: Sparkle!;Shoot what inspires you this week, just make sure it sparkles.|WEEK 25;Portrait: Silhouette;Expose for the background and let your subject fall into shadow. Shape is important this week.|WEEK 26;Landscape: Simplify;Simply the scene to make your primary subject stand out.|WEEK 27;Artistic: Blue;You were inspired by the fiery red earlier, now be inspired by calming blue.|WEEK 28;Portrait: Family;Whether it's the family you are born with or the one you choose, show the world what family is to you.|WEEK 29;Landscape: Waterscape;Ocean, lake, river, pond, or puddle. Make water the primary subject of this landscape.|WEEK 30;Artistic: Patterns;Get inspired by the rhythm that patterns bring to your images.|WEEK 31;Portrait: Street Candid;Candids on the street, show us life in your town through the lens.|WEEK 32;Landscape: Colorful;Shoot a landscape that packs as much color as you can find into the scene.|WEEK 33;Artistic: Collaboration;Doesn't matter what you shoot, just do with another artist. Share vision and ideas. Collaborate.|WEEK 34;Portrait: Child;Candid or posed, capture an image of a child. Try getting down on their level for a unique perspective.|WEEK 35;Landscape: Nature up Close;Get up close and personal with nature in this natural beauty shot. Flowers, bees, bugs and spiders might all make great shots|WEEK 36;Artistic: Food;Take your food photography to the next level. Its not lunch, its art.|WEEK 37;Portrait: Fashion;Avant-garde to commercial to traditional, and everything in between. The focus is the clothes this week.|WEEK 38;Landscape: Get Low;Time to look at the world from a different angle. Shoot a landscape from a low point of view.|WEEK 39;Art: Handmade;Your artistic interpretation should be inspired by another artisan's handmade work. Literal or interpreted.|WEEK 40;Portrait: Sitting in a Chair;Either a formal sitting portrait or a re-interpretation of this classic. Photography your subject sitting in a chair.|WEEK 41;Landscape: Get High;Everything looks different when you are high. Find a high perspective to shoot this landscape.|WEEK 42;Artistic: Minimalist;Isolate your subject using the minimalist approach. Inspire someone with your art.|WEEK 43;Portrait: The Elderly;Tell the story of an elderly person through the power of your camera. Capture the lines of their life.|WEEK 44;Landscape: A Tree;Some of the most famous landscapes in the world feature a tree. Time to see what you can do.|WEEK 45;Artistic: Nostalgic;Use nostalgic as your inspiration this week. Long for the moments we want recapture. The good times.|WEEK 46;Portrait: Backlit;The sun makes a great back light, as well as a flash. Don't forget the fill light. A flash or reflector can be used to fill in the subject.|WEEK 47;Landscape: Abandoned;Capture an image of that which others have forgotten. It may be the last image before its gone from us forever.|WEEK 48;Artistic: Bokeh;A shallow depth of field is often used to isolate the subject. Create an artistic interpretation using shallow depth of field.|WEEK 49;Portrait: Dancing;Whether it's a professional dancer, or just some kids in the street. Try experimenting with slow and fast shutter speed to both blur and freeze the subject.|WEEK 50;Landscape: Symmetrical;Often considered one of the hardest compositions to pull off, Symmetry. Challenge yourself this week by shooting a symmetrical landscape/urbanscape.|WEEK 51;Artistic: Art;It is time to really challenge yourself. Your artistic interpretation should be art, about art. So meta.|WEEK 52;Portrait: Another Self Portrait;For your final challenge, we end where we started. Take one last self-portrait, and be amazed at how far you have come in a year."

set calendarName to "52 Photo Week Challenge"
set theLocation to "Anywhere"
-- Create cal
tell application "Calendar"
	create calendar with name calendarName
end tell


-- Fetch contact to notify
tell application "Contacts"
	set theAttendee to first person whose name contains contactName
	set attendeeName to name of theAttendee
	set attendeeEmail to value of email of theAttendee
	set attendeeEmail to first item of attendeeEmail
end tell

set myArray to my theSplit(challenge, "|")
set iteration to 0
repeat with theItem in myArray
	set detail to my theSplit(theItem, ";")
	set weekNumber to item 1 of detail
	set title to item 2 of detail
	set subject to item 3 of detail
	set theSummary to weekNumber & ": Challenge!"
	set theDescrption to weekNumber & " " & title & " " & subject
	set startDate to (current date) + (iteration * days)
	tell application "Calendar"
		tell (first calendar whose name is calendarName)
			
			make new event at end of events with properties {summary:theSummary, start date:startDate, allday event:true, description:theDescrption, location:theLocation}
		end tell
		reload calendars
	end tell
	set iteration to iteration + 7
end repeat


set iteration to 0
repeat with theItem in myArray
	set detail to my theSplit(theItem, ";")
	set weekNumber to item 1 of detail
	set title to item 2 of detail
	set subject to item 3 of detail
	set theSummary to weekNumber & ": Challenge!"
	set theDescrption to weekNumber & " " & title & " " & subject
	set startDate to (current date) + (iteration * days)
	tell application "Calendar"
		tell calendar calendarName
			set theEvent to (first event where its summary = theSummary)
			
			make new attendee at end of attendees of theEvent with properties {display name:attendeeName, email:attendeeEmail}
			
		end tell
		reload calendars
	end tell
	set iteration to iteration + 7
end repeat


