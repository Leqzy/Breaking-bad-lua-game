--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)
]]--

Jesse = false;
Alone = false;
Mafia = false;
noMafia = false;
gameCompleted = false;
gameFailed = false;

function story(aName)
	if(aName == "start") then
		CLS();
		playSound("startGame.wav")
		setBackground("start.JPG")
		createTextfield("Breaking bad 2.0 \nYou need to free your son who's got kidnapped by the mafia\nand you need to make meth for them \nor else your son gets killed.")
		createButton("exit", "Exit")
		createButton("breakingbad", "Start")
	end

	if(aName == "breakingbad") then
		CLS();
		setBackground("Walter1.JPG");
		createTextfield("Your journey will begin now\nmake the right choices and free your son!")
		createButton("mafia", "Work with the mafia");
		createButton("nomafia", "Try another way to free your son")
    end

    if(aName == "mafia") then 
		if(Mafia == false) then
			Mafia = true;
		end
		CLS();
		createTextfield("Good choice\nbut are you making the meth alone?")
		createButton("alone", "Do it alone.") 
		createButton("jesse", "Ask your old friend Jesse Purpleman to help you.") 
	end

    if(aName == "nomafia") then
		if (noMafia == false) then
			noMafia = true;
		end
		CLS();
		createTextfield("Not working with the mafia is a risky choice\nDo you want some help\n or are you doing it alone?")
        createButton("alone", "Do it alone.") 
		createButton("jesse", "Ask your old friend Jesse Purpleman to help you.")
	end
	
	
	if(aName == "jesse") then
		if(Jesse == false) then
			Jesse = true;
		end
		if(Mafia == true) then
		    CLS();
		    createTextfield("Jesse already had a big meth lab in the basement\n and was down to help you.\nYour son is free")
		    createButton("nextCompleted", "Continue")
		end
		if(Mafia == true) then
			CLS();
			createTextfield("")
	end

	if(aName == "alone") then
		if(Alone == false) then
		    Alone = true;
		end
		if(Mafia == true) then
		    CLS();
		    createTextfield("You wanted to make meth alone? \nWhere and how are you gonna \ndo that in a short amount of time\nyour son got killed!")
	        createButton("nextFailed", "Continue")
		end
		if(noMafia == true) then
			CLS();
			createButton("mafia", "I changed my mind, i'll work with them...") 
			createButton("guns", "Get some weapons and go to the mafia house!")
			createButton("sneakIn", "Sneak in the house and try to free you son!")
		end
	end


	if(aName == "guns") then
		if(Alone == true) then
		    CLS();
		    createTextfield("You bought some weapons and tried to kill them all,\nbut there were to many. You did not survive.")
		    createButton("nextFailed", "Continue")
		end
	    if(Jesse == true) then
			playSound("machineGun.wav")
			CLS();
			createTextfield("Jesse has got some big weapons in the basement,\nyou and Jesse killed them all.\nYour son is free!")
			createButton("nextCompleted", "Continue")
		end
    end

	if(aName == "sneakIn") then
		if(Alone == true) then
		    CLS();
		    createTextfield("Your inside and find your son\nyou escape succesfully")
		    createButton("nextCompleted", "Continue")
	    end
		if(Jesse == true) then
			playSound("dropVase.wav")
		    CLS();
			createTextfield("Your inside but Jesse dropped a vase and you both got cought")
			createButton("nextFailed", "Continue")
	    end
	end


	if(gameCompleted == true) then
		noMafia = false;
        gameCompleted = false;
        gameFailed = false;
		CLS();
		playSound("gameCompleted.wav")
	    createTextfield("You completed the game \nwould you like to retry and try other ways to win?")
		createButton("start", "Retry")
		createButton("exit", "Exit")
	end

	if(gameFailed) then
		noMafia = false;
		gameCompleted = false;
		gameFailed = false;
		CLS();
		playSound("gameFailed.wav")
		createTextfield("You failed the game\nwould you like to try again?")
		createButton("start", "Retry")
		createButton("exit", "Exit")
	end
	
    if(aName == "nextCompleted") then
	    if(gameCompleted == false) then
			gameCompleted = true;
		end
	end

    if(aName == "nextFailed") then
		if(gameFailed == false) then
			gameFailed = true;
		end
	end

	if(aName == "exit") then
		exitGame();
	end
end


--nog een paar dingen die niet werken