extends Control

var next_level := "res://src/menu/main_menu.tscn"
onready var textbox = $textbox
var casserole_image = preload("res://assets/endings/angry.jpg")
var energy_drinks = preload("res://assets/endings/cans.jpg")
var ladder_image = preload("res://assets/endings/ladder.jpg")
var hacker_image = preload("res://assets/endings/security.jpg")
var tunnel_image = preload("res://assets/endings/tunnel.jpg")
var ai_image = preload("res://assets/endings/arrested.jpg")

func _ready() -> void:
	$Next.visible = false
	textbox.timer.wait_time = 0.05
	if textbox.connect("text_finished", self, "_on_text_finished") != OK:
		push_error("ending signal connect fail")
	if PlayerData.current_level == 0:
		next_level = "res://src/office/lobby.tscn"
		randomize()
		if rand_range(1,6) < 4:
			textbox.initialize(intro_text)
		else:
			textbox.initialize(intro_text_2)
	else:
		next_level = "res://src/menu/main_menu.tscn"
		if PlayerData.ending == 3:
			$image.texture = tunnel_image
			textbox.initialize(true_ending)
		elif PlayerData.ending == 2:
			$image.texture = casserole_image
			textbox.initialize(best)
		elif PlayerData.ending == 1:
			$image.texture = hacker_image
			textbox.initialize(bad)
		elif PlayerData.has_casserole:
			$image.texture = casserole_image
			textbox.initialize(good)
		elif PlayerData.tags_completed >= 6:
			$image.texture = energy_drinks
			textbox.initialize(standard)
		else:
			$image.texture = ladder_image
			textbox.initialize(poor)

func _on_text_finished() -> void:
	$Next.visible = true

func _on_Next_pressed() -> void:
	if get_tree().change_scene(next_level) != OK:
		push_error("fail to change scene")

var intro_text = [
"""Another day at work.
										   
I don't remember how long I've had this job. All the days just end up feeling the same.
										  
Last time anything different happened was when they replaced the electric lights with gas lights. I don't remember exactly when.
										  
The same thing every day. Go in. Go to my computer. Do the tasks I've been assigned. Leave.
										
Sometimes, I just wish something unexpected would happen."""
]

var intro_text_2 = [
"""Another day at work.
										   
I don't remember how long I've had this job. All the days just end up feeling the same.
										  
Last time anything different happened was when they replaced the electric lights with gas lights.
										  
They needed to reroute the electricity to something else, they said.
										
The same thing every day. Go in. Go to my computer. Do the tasks I've been assigned. Leave."""
]

var standard = [
"""STANDARD ENDING

To All Employees,
										
Our research scientists have retracted their previous statement of no significant detection of hallucinatory side-effects of consuming the company-provided energy drinks.
										
The recent reports of:
Missing employees
Discovery of severed body parts in company restrooms
AI takeover of all computer systems
Disturbing graffiti in the restrooms and office walls
are entirely due to the hallucinatory side-effects of the energy drinks.
										
The office is completely safe and poses absolutely no danger to employees.
										
Your Service is appreciated.
										
See you in the office tomorrow,
Your Chief Operations Officer""",
]

var poor = [
"""POOR ENDING

Employee,
										  
We have detected unauthorized activity in violation of your employment agreemnent, including but not limited to:
Failing to complete daily work quota
Attempting to deceive automated surveillance systems
Self-sabotaging productivity by refusing to drink company-provided energy drinks
										  
Consequently, you will be subject to the following disciplinary actions:
Demotion of rank
Reduction of salary
Additional Monetary Penalties to be deducted from your paycheck
Revocation of Office Safety Privileges
										  
Any additional unauthorized activity will result in increasingly severe penalties. You have been warned.
										  
See you in the office tomorrow,
Your Manager
""",
]

var good = [
"""GOOD ENDING

I'm so glad I stole this casserole.
										  
After eating it, everything just feels like it finally makes sense.
										  
All that weird stuff I've been seeing and hearing is probably just my mandatory Augmented Reality goggles having a few glitches. Or some indigestion from the energy drinks.
										
There's a rational explanation for everything. There's nothing out to get me.
										
I'm actually looking forward to going into the office tomorrow.
										
My service is appreciated.""",
]

var bad = [
"""BAD ENDING

Employee,
										
As you know, all employees have been assigned a security officer to shadow them to watch for infractions.
										
We have detected serious unauthorized activity in violation of your employment agreemnent:
Attempting to access company computational resources to which you have not been assigned.
										  
Due to the severity of this violation, you are hereby terminated, effective immediately.
										
The security personnel behind you will now terminate you. 
										
Goodbye.""",
]

var best = [
"""BEST ENDING

Instructions for performing the Sacrifice:
										
1. Arrange the four sacrificial items in a diamond upon the altar:
										
2. Take the knife and prick a finger. Squeeze four drops of blood, one on each item.
										
3. Take the knife and make an incision on the left side of the abdomen, just under the ribcage, wide enough to reach into the chest cavity.
										
4. Remove the heart and place it in the center of the diamond.
										
5. With your final breaths, recite the Prayer of Apò Mēkhanês Theós.
										
Your service is appreciated."""
]

var true_ending = [
"""TRUE ENDING

As I drop down the trap door, all I see is a long tunnel leading off into the darkness.
										
I have no idea where it goes, but wherever it is, it has to be better than where I am now.
										
I look up for... something? I don't remember what.
"""]
