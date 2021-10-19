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
			1: textbox.initialize(augmented_reality)
			2: textbox.initialize(hallucination)
			3: textbox.initialize(good_ending)
			4: textbox.initialize(bad_ending)
			5: textbox.initialize(curse)
			6: textbox.initialize(true_ending)
	elif PlayerData.current_level == 0:
		next_level = "res://src/office/lobby.tscn"
		textbox.initialize(intro_text)
	else:
		next_level = "res://src/menu/main_menu.tscn"
		if PlayerData.ending > 0:
			match PlayerData.ending:
				1:
					textbox.initialize(augmented_reality)
				2:
					textbox.initialize(hallucination)
		elif PlayerData.tags_completed >= 6:
			textbox.initialize(good_ending)
		else:
			textbox.initialize(bad_ending)

func _on_text_finished() -> void:
	$Next.visible = true

func _on_Next_pressed() -> void:
	if get_tree().change_scene(next_level) != OK:
		push_error("fail to change scene")

var intro_text = [
"""Well, it's time for another day at work.
										   
I don't remember how long I've had this job.
										  
All the days just end up feeling the same.
""",
]

var intro_text_new = [
"""Well, it's time for another day at work.
										   
I don't remember how long I've had this job. It's a simple one I guess. Pays the bills.
										  
But all the days just end up feeling the same. Day in, day out, clock in, clock out.
										  
Sometimes, I just wish something unexpected would happen.""",
]

var good_ending = [
"""GOOD ENDING

Employee,
										  
Congratulations on a hard day's work.
										  
In recognition of your good work, the company is proud to award you with a promotion.
										  
We appreciate you taking on more responsibilities without any increase in salary.
										  
We thank you for your service.""",
]

var bad_ending = [
"""BAD ENDING

Employee,
										  
We have detected unauthorized activity in violation of your employment agreemnent.
										  
Consequently, you will be subject to the following disciplinary actions:
Demotion of rank
Reduction of salary
Additional Monetary Penalties to be deducted from your paycheck.
										  
Any additional unauthorized activity will result in increasingly severe penalties. You have been warned.""",
]

var augmented_reality = [
"""AR ENDING

To All Employees,
										  
Under law, we are required to inform you that we may attempt to inform you of possible malfunctions with your Augmented Reality (AR) equipment.
										  
We thank you for your service.""",
]

var hallucination = [
"""HALLUCINATION ENDING

To All Employees,
										
Regulations require us to report that our research scientists have retracted their previous announcment of no significant detection of hallucinatory side-effects of consuming company-provided energy drinks.
										
Additionally, we would like to remind all employees that unauthorized communication with press and media is against your employment agreement. Refer all inquiries to the official Public Relations department.
										
We thank you for your service."""]

var curse = [
"""
"""]

var true_ending = [
"""TRUE ENDING

Hi Boss,
										
I quit.
										
So long and thanks for nothing.
"""]
