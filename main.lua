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
local yellowGirl = display.newImageRect("Images/yellowGirl.png",150,150)
local yellowGirlWidth = yellowGirl.width 
local yellowGirlHeight = yellowGirl.height

-- displays the Blue Girl
local blueGirl = display.newImageRect("Images/blueGirl.png", 150,180)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height

--my boolean variables to keep track of which object I touched first
local alreadyTouchedYellowGirl = false
local alreadyTouchedBlueGirl = false

--set the initial x and y position of myImage
yellowGirl.x = 400
yellowGirl.y = 500

blueGirl.x = 250
blueGirl.y = 400

-- Function: BLueGirlListener
-- Input: touch listener
-- Output: none
-- Description: when blue girl is touched, move her
local function BlueGirlListener(touch)

if(touch.phase == "Began") then
    if (alreadyTouchedYellowGirl == false ) then 
      alreadyTouchedBlueGirl = true
     end 
 end

 if ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
 	 blueGirl.x = touch.x
 	 blueGirl.y = touch.y
 end

  if (touch.phase == "ended") then 
     alreadyTouchedBlueGirl = false
     alreadyTouchedYellowGirl = false
  end 
end

--add the respective listeners to each object
blueGirl:addEventListener("touch", BlueGirlListener)

