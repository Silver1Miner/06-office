extends Control

var next_level := "res://src/menu/main_menu.tscn"
onready var textbox = $textbox
var casserole_image = preload("res://assets/endings/angry.jpg")
var hallucination_image = preload("res://assets/endings/cans.jpg")
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
		textbox.initialize(intro_text)
	else:
		next_level = "res://src/menu/main_menu.tscn"
		if PlayerData.ending == 3:
			$image.texture = tunnel_image
			textbox.initialize(true_ending)
		elif PlayerData.ending == 2:
			$image.texture = casserole_image
			textbox.initialize(true_ending)
		elif PlayerData.ending == 1:
			$image.texture = hacker_image
			textbox.initialize(hacker)
		elif PlayerData.has_casserole:
			$image.texture = casserole_image
			textbox.initialize(casserole)
		elif PlayerData.tags_completed >= 6:
			$image.texture = ladder_image
			textbox.initialize(promotion)
		else:
			$image.texture = ladder_image
			textbox.initialize(demotion)

func _on_text_finished() -> void:
	$Next.visible = true

func _on_Next_pressed() -> void:
	if get_tree().change_scene(next_level) != OK:
		push_error("fail to change scene")

var intro_text = [
"""Another day at work.
										   
I don't remember how long I've had this job. All the days just end up feeling the same.
										  
Last time anything different happened was when they replaced the electric lights with gas lights. But it's been so long ago I don't even remember how long it's been.
										  
Such a monotonous office job. Go in. Go to my computer. Do the tasks I've been assigned. Go out.
										  
Day in, day out. Clock in, clock out.
										
Sometimes, I just wish something unexpected would happen."""
]

var promotion = [
"""STANDARD ENDING

To All Employees,
										
Our research scientists have retracted their previous announcment of no significant detection of hallucinatory side-effects of consuming company-provided energy drinks.
										
Additionally, recent outrageous reports of:
Missing employees
Discovery of severed body parts in company restrooms
Malevolent AI takeover of the office
are entirely due to the hallucinatory side-effects of the energy drinks.
										
The office is completely safe and poses absolutely no danger to employees.
										
See you in the office tomorrow.

Sincerely,
Your Chief Operations Officer""",
]

var demotion = [
"""POOR ENDING

Employee,
										  
We have detected unauthorized activity in violation of your employment agreemnent.
										  
Consequently, you will be subject to the following disciplinary actions:
Demotion of rank
Reduction of salary
Additional Monetary Penalties to be deducted from your paycheck
Revocation of Office Safety Privileges
										  
Any additional unauthorized activity will result in increasingly severe penalties. You have been warned.
										  
See you in the office tomorrow.
										 
Sincerely,
Your Manager
""",
]

var casserole = [
"""BEST ENDING

I'm so glad I stole this casserole.
										  
After eating it, everything just feels like it finally makes sense.
										  
All that weird stuff I've been seeing and hearing is probably just my mandatory Augmented Reality goggles having a few glitches.
										
There's no escaped malevolent AI out to get me. All the AI our office works on is really primitive. My entire job is to tag images to train the really primitive AI.
										
I'm actually looking forward to going into the office tomorrow.'""",
]

var hallucination = [
"""STANDARD ENDING

To All Employees,
										
Our research scientists have retracted their previous announcment of no significant detection of hallucinatory side-effects of consuming company-provided energy drinks.
										
Additionally, recent outrageous reports of:
Missing employees
Discovery of severed body parts in company restrooms
Malevolent AI takeover of the office
are entirely due to the hallucinatory side-effects of the energy drinks.
										
The office is completely safe and poses absolutely no danger to employees.
										
See you in the office tomorrow.

Sincerely,
Your Chief Operations Officer"""]

var hacker = [
"""BAD ENDING

Employee,
										  
We have detected serious unauthorized activity in violation of your employment agreemnent:
Attempting to access company computational resources to which you have not been assigned.
										  
Due to the severity of this violation, you are hereby terminated, effective immediately.
										
The security personnel assigned to walk behind you to monitor you will now terminate you. 
										
Goodbye.""",
]

var true_ending = [
"""TRUE ENDING

Droping down, there is only a long tunnel leads off into the darkness.
										
I have no idea where it goes, but wherever it is, it has to be better than where I am now.
										
As I step inside the tunnel, the trap door above shuts.
										
Well, here I go.
"""]
