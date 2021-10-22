extends Control

export var ending_test = 0
var next_level := "res://src/menu/main_menu.tscn"
onready var textbox = $textbox

func _ready() -> void:
	$Next.visible = false
	textbox.timer.wait_time = 0.05
	if textbox.connect("text_finished", self, "_on_text_finished") != OK:
		push_error("ending signal connect fail")
	if ending_test > 0:
		next_level = "res://src/menu/main_menu.tscn"
		match ending_test:
			1: textbox.initialize(casserole)
			2: textbox.initialize(hallucination)
			3: textbox.initialize(promotion)
			4: textbox.initialize(demotion)
			5: textbox.initialize(hacker)
			6: textbox.initialize(true_ending)
	elif PlayerData.current_level == 0:
		next_level = "res://src/office/lobby.tscn"
		textbox.initialize(intro_text)
	else:
		next_level = "res://src/menu/main_menu.tscn"
		if PlayerData.ending > 0:
			match PlayerData.ending:
				1:
					textbox.initialize(casserole)
				2:
					textbox.initialize(hallucination)
				3:
					hacker_ending()
		elif PlayerData.tags_completed >= 6:
			textbox.initialize(promotion)
		else:
			textbox.initialize(demotion)

func _on_text_finished() -> void:
	$Next.visible = true

func _on_Next_pressed() -> void:
	if get_tree().change_scene(next_level) != OK:
		push_error("fail to change scene")

func hacker_ending() -> void:
	textbox.initialize(hacker)

var intro_text = [
"""Another day at work.
										   
I don't remember how long I've had this job. All the days just end up feeling the same.
										  
Last time anything different happened was when they replaced the electric lights with gas lights. But it's been so long ago I don't even remember how long it's been.
										  
Such a monotonous office job. Go in. Go to my computer. Do the tasks I've been assigned. Go out.
Day in, day out, clock in, clock out.
										  
Sometimes, I just wish something unexpected would happen."""
]

var promotion = [
"""GOOD ENDING

Employee,
										  
Congratulations on a hard day's work. We applaud your dedication to your work despite the disappearance of your coworkers.
										  
In recognition of your good work, the company is proud to award you with a promotion.
										  
The new responsibilities in your promoted role include:
Completing the work assignments of your missing co-workers.
										
We appreciate you taking on these additional responsibilities without any increase in salary.
										  
See you in the office tomorrow.""",
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
										  
See you in the office tomorrow.""",
]

var casserole = [
"""BEST ENDING

Employee,
										  
I know you took my casserole.
										  
Forgot to take off your AR glasses while stealing it, huh? All those audio-visual glitches didn't tip you off that you were still wearing them?
										
Or did you perhaps think all those glitches you were seeing/hearing were all real?
										
Well, they will be real soon enough.
Thieves go to the eighth circle of hell.
										
See you in the office tomorrow.""",
]

var hallucination = [
"""STANDARD ENDING

To All Employees,
										
Our research scientists have retracted their previous announcment of no significant detection of hallucinatory side-effects of consuming company-provided energy drinks.
										
Additionally, recent reports of:
Missing employees
Discovery of severed body parts in company restrooms
Appearing and disappearing gnomes
are entirely due to the hallucinatory side-effects of the energy drinks.
										
The office is completely safe and poses absolutely no danger to employees.
										
See you in the office tomorrow."""]

var hacker = [
"""BAD ENDING

Employee,
										  
We have detected serious unauthorized activity in violation of your employment agreemnent:
Attempting to access company computational resources to which you have not been assigned.
										  
Due to the severity of this violation, you are hereby terminated, effective immediately.
										
Security personnel are already at your location and will now terminate you. 
										
Goodbye.""",
]

var true_ending = [
"""TRUE ENDING

Hi Boss,
										
I quit.
										
So long and thanks for nothing.
"""]
