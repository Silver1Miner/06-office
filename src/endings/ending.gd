extends Control

var next_level := "res://src/menu/main_menu.tscn"
onready var textbox = $textbox

func _ready() -> void:
	textbox.timer.wait_time = 0.1
	if PlayerData.current_level == 1:
		next_level = "res://src/office/lobby.tscn"
		textbox.initialize(intro_text)
	else:
		next_level = "res://src/menu/main_menu.tscn"
		match PlayerData.ending:
			0:
				textbox.initialize(good_ending)
			1:
				textbox.initialize(bad_ending)
			2:
				textbox.initialize(true_ending)

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

Congratulations on a hard day's work.

In recognition of your good woork, the company is proud to award you with a promotion.

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
Additional Monetary Penalties to be removed from your paycheck.

Any additional unauthorized activity will result in increasingly severe penalties. You have been warned.""",
]

var true_ending = [
"""TRUE ENDING

Congratulations on a hard day's work.

Because of your loyal service, the company is proud to award you with a promotion.

We thank you for your service.""",
]

var job_levels = [
	"Individual Contributor",
	"Individual Contributor I",
	"Individual Contributor II",
	"Individual Contributor III",
	"Individual Contributor IV",
	"Individual Contributor V",
	"Associate to the Manager",
	"Associate to the Manager II",
	"Assistant to the Manager",
	"Assistant to the Manager II",
	"Assistant to the Manager III",
	"Associate Manager",
	"Associate Manager II",
	"Assistant Manager",
	"Assitant Manager II",
]
