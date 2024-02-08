--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)
]]--


entered = false;
hasSpell = false;
castSpellLib = false;

function story(aName)
	if(aName == "start") then
		playMusic("background.wav")
		setBackground("zomie.jpg")
		createTextfield("ther is a vires that makes a zombie apocalypse what do you do")
		createButton("exit", "make a apocalypse schoolbus")
		createButton("entrance", "Enter the school" )
	end
	if(aName == "entrance") then
		if(entered == false) then
			playSound("door.wav")
			entered = true;
		else
			playSound("footstep.wav")
		end
		CLS();
		setBackground("legestad.jpg");
		createTextfield("You've entered a abandoned chity what do you do.")
		createButton("left", "Go to the school on your left");
		createButton("right", "stay in the chity ")
		
	end
	if(aName == "left") then
		playSound("footstep.wav")
		CLS();
		setBackground("legeschool")
		createTextfield("You see a so many zombies what do you do.")
		createButton("entrance", "Go back to the corridor.");
		if(hasSpell == false) then
			createButton("schoolbus", "make a apocalypse schoolbus")
		end
	end
	if(aName == "schoolbus.") then
		CLS();
		playSound("pageFlip.wav")
		createTextfield("It seems you have make a apocalypse schoolbus.. no idea what it does though")
		createButton("entrance", "You go back to the main hall")
		hasSpell = true;
	end
	if(aName == "stay in the chity") then
		CLS()
		playSound("footstep.wav")
		setBackground("legestad.jpg")
		if(castSpellLib == true) then
			createTextfield("The old chity has so manny zombies")
		else
			createTextfield("You enter an old pleace en you found a human .")
		end
		
		createButton("entrance", "You warm up and go talk to him")
		if(hasSpell == true and castSpellLib == false) then
			createButton("go back ", "you go back and surge for more humans ")
		end
	end
	if(aName == "drive the schoolbus") then
		CLS()
		createTextfield("drive it and kill the zombies")
		castSpellLib = true;
		createButton("entrance", "The zombies thare ar to manny to kill ")
	end
	if(aName == "make a virus ") then
	CLS()
	playSound("footstep.wav")
		if(hasSpell == true and castSpellLib == true) then
			setBackground("virus.jpg")
			createTextfield("Thank you for making the virus to kill the zombies")
			createButton("exit", "You have safe the world ")
		else
			setBackground("wereld.jpg")
			createTextfield("You go make a home to life youre new life ")
			createButton("exit", "You go make a virus to make the world the same as it was before ")
		end
	end
	if(aName == "exit") then
		exitGame();
	end
end

