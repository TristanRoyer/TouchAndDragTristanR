-- Title: TouchAndDrag
-- Name: Tristan Royer
-- Course: ICS2O/3C
-- This program displays images that can be dragged
-- around on the screen.

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Create local variables
local backgroundImage = display.newImageRect("Images/background.png", 2048,1536)

--displays the Yellow Girl
local yellowGirl
local blueGirl
local YellowGirl = display.newImageRect("Images/yellowGirl.png",140,150)
local YellowGirlWidth = YellowGirl.Width 
local YellowGirlHeight = YellowGirl.Height

local yellowGirl = display.newImageRect("Images/yellowGirl.png",140,150)
local yellowGirlWidth = yellowGirl.width
local yellowGirlHeight = yellowGirl.height

-- displays the Blue Girl
local blueGirl = display.newImageRect("Images/blueGirl.png", 150,180)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height

local brownGirl = display.newImageRect("Images/girl5.png",170, 200)
local brownGirlWidth = brownGirl.width
local brownGirlHeight = brownGirl.height

--my boolean variables to keep track of which object I touched first
local alreadyTouchedyellowGirl = false
local alreadyTouchedblueGirl = false
local alreadyTouchedbrownGirl = false

-- adds sounds
local FreeMusic = audio.loadSound("Sounds/bensound-memories.mp3")
local FreeMusicChannel
FreeMusicChannel = audio.play(FreeMusic)

--set the initial x and y position of myImage
yellowGirl.x = 400
yellowGirl.y = 500

blueGirl.x = 250
blueGirl.y = 400

-- Function: BLueGirlListener
-- Input: touch listener
-- Output: none
-- Description: when blue girl is touched, move her
local function blueGirlListener(touch)
if(touch.phase == "began") then
     if ( (alreadyTouchedyellowGirl == false ) and (alreadyTouchedbrownGirl == false) ) then 
       alreadyTouchedblueGirl = true
     end 
   end

 if ( (touch.phase == "moved") and (alreadyTouchedblueGirl == true) ) then
 	 blueGirl.x = touch.x
 	 blueGirl.y = touch.y
 end

  if (touch.phase == "ended") then 
     alreadyTouchedblueGirl = false
     alreadyTouchedyellowGirl = false
     alreadyTouchedbrownGirl = false
  end 
end


-- Function: YellowGirlListener
-- Input: touch listener
-- output: none
-- Description: when blue girl is touched, move her
local function yellowGirlListener(touch)

if (touch.phase == "began")	then
	if ( (alreadyTouchedblueGirl == false ) and (alreadyTouchedbrownGirl == false) ) then
	 alreadyTouchedyellowGirl = true 
	 end
    end

   if( (touch.phase == "moved") and (alreadyTouchedyellowGirl == true) ) then 
	yellowGirl.x = touch.x
	yellowGirl.y = touch.y
   end

  if (touch.phase == "ended") then
    alreadyTouchedblueGirl = false
    alreadyTouchedyellowGirl = false
    alreadyTouchedbrownGirl = false
  end
end

-- Function: YellowGirlListener
-- Input: touch listener
-- output: none
-- Description: when blue girl is touched, move her
local function brownGirlListener(touch)
if (touch.phase == "began")	then
	if ( (alreadyTouchedblueGirl == false ) and (alreadyTouchedyellowGirl == false) ) then
	 alreadyTouchedbrownGirl = true 
	 end
    end

   if( (touch.phase == "moved") and (alreadyTouchedbrownGirl == true) ) then 
	brownGirl.x = touch.x
	brownGirl.y = touch.y
   end

  if (touch.phase == "ended") then
    alreadyTouchedblueGirl = false
    alreadyTouchedyellowGirl = false
    alreadtTouchedbrownGirl = false
  end
end

 



--add the respective listeners to each object
blueGirl:addEventListener("touch", blueGirlListener)
yellowGirl:addEventListener("touch", yellowGirlListener)
brownGirl:addEventListener("touch", brownGirlListener)

