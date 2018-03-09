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

-- displays the Blue Girl
local blueGirl = display.newImageRect("Images/blueGirl.png", 150,180)
local blueGirlWidth = blueGirl.Width
local blueGirlHeight = blueGirl.Height


--my boolean variables to keep track of which object I touched first
local alreadyTouchedyellowGirl = false
local alreadyTouchedblueGirl = false

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
     if (alreadyTouchedyellowGirl == false ) then 
       alreadyTouchedblueGirl = true
     end 
   end

 if ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
 	 blueGirl.x = touch.x
 	 blueGirl.y = touch.y
 end

  if (touch.phase == "ended") then 
     alreadyTouchedblueGirl = false
     alreadyTouchedyellowGirl = false
  end 
end


-- Function: YellowGirlListener
-- Input: touch listener
-- output: none
-- Description: when blue girl is touched, move her
local function yellowGirlListener(touch)
if (touch.phase == "began")	then
	if (alreadytouchedblueGirl == false ) then
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
  end
end

-- Completion listener function
local function narrationFinished( event )
    print( "Narration Finished on channel", event.channel )
    if ( event.completed ) then
        print( "Narration completed playback naturally" )
    else
        print( "Narration was stopped before completion" )
    end
end
 
-- Load two audio streams and one sound
local laserSound = audio.loadSound( "Correct Answer Sound Effect.mp3" )
 
-- Play the laser on any available channel
local laserChannel = audio.play( laserSound )



--add the respective listeners to each object
blueGirl:addEventListener("touch", BlueGirlListener)
yellowGirl:addEventListener("touch", yellowGirlListener)

