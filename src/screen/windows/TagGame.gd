extends Control

onready var enter = $Panels/Options/Enter
onready var cancel = $Panels/Options/Cancel
onready var tags = $Panels/Display/ItemList
onready var image = $Panels/Display/TextureRect
onready var text = $Panels/Display/TextureRect/RichTextLabel
onready var progress = $Panels/Options/Progress
var current = 0

func _ready() -> void:
	if enter.connect("pressed", self, "_on_enter_pressed") != OK:
		push_error("enter connect fail")
	if cancel.connect("pressed", self, "_on_cancel_pressed") != OK:
		push_error("cancel connect fail")
	displays.shuffle()
	update_display(current)
	#progress.text = "PROGRESS: " + str(PlayerData.tags_completed) + "/6"
	if PlayerData.tags_completed >= 6:
		progress.text = "PROGRESS: " + str(PlayerData.tags_completed) + "/6 QUOTA REACHED"
		$Panels/Options/Enter.disabled = true
		$Panels/Options/Cancel.disabled = true
	else:
		progress.text = "PROGRESS: " + str(PlayerData.tags_completed) + "/6"
		$Panels/Options/Enter.disabled = false
		$Panels/Options/Cancel.disabled = false

func _on_enter_pressed() -> void:
	$invalid.visible = false
	randomize()
	if PlayerData.easy_mode or rand_range(1,10) < 7:
		Music.play_effect(8)
		PlayerData.tags_completed += 1
		current += 1
		if current >= len(displays):
			current = 0
		update_display(current)
		if PlayerData.tags_completed >= 6:
			progress.text = "PROGRESS: " + str(PlayerData.tags_completed) + "/6 QUOTA REACHED"
			$Panels/Display/TextureRect.texture = null
			tags.clear()
			$Panels/Options/Enter.disabled = true
			$Panels/Options/Cancel.disabled = true
		else:
			progress.text = "PROGRESS: " + str(PlayerData.tags_completed) + "/6"
			$Panels/Options/Enter.disabled = false
			$Panels/Options/Cancel.disabled = false
	else:
		Music.play_effect(7)
		$invalid.visible = true

func _on_cancel_pressed() -> void:
	tags.unselect_all()

func update_display(i: int) -> void:
	if PlayerData.tags_completed >= 6:
		return
	if displays[i]["image"] != "":
		image.texture = load(displays[i]["image"])
	#text.bbcode_text = displays[i]["text"]
	tags.clear()
	var display_tags = displays[i]["tags"]
	display_tags.shuffle()
	for n in len(display_tags):
		tags.add_item(display_tags[n])
		tags.set_item_tooltip_enabled(n, false)
	tags.unselect_all()
	try_text()

func try_text() -> void:
	match PlayerData.tags_completed:
		2:
			randomize()
			if !PlayerData.has_key:
				text.text = "Look Behind You"
				yield(get_tree().create_timer(1), "timeout")
				text.text = ""
		3:
			randomize()
			if !PlayerData.has_key:
				text.text = "I'm not joking, look behind you"
				yield(get_tree().create_timer(1), "timeout")
				text.text = ""
		5:
			randomize()
			if rand_range(1, 10) > 9:
				text.text = warnings
				yield(get_tree().create_timer(1), "timeout")
				text.text = ""

var displays := [
	{
		"image": "res://assets/tags/adrian-infernus--RJQvBkNHD0-unsplash.jpg",
		"tags": ["FAT", "HAPPY", "CUDDLY", "CUTE"],
	},
	{
		"image": "res://assets/tags/engin-akyurt-vYqAHQNaOis-unsplash.jpg",
		"tags": ["FRIENDLY", "SMILE", "LAUGH", "SILENCE"],
	},
	{
		"image": "res://assets/tags/glen-carrie-0Pweky1qfMQ-unsplash.jpg",
		"tags": ["RED", "SLOW", "SHORT", "LONG"],
	},
	{
		"image": "res://assets/tags/honey-yanibel-minaya-cruz-6ismmbSNpiE-unsplash.jpg",
		"tags": ["HONEY", "SWARM", "MULTITUDE", "CRAWL"],
	},
	{
		"image": "res://assets/tags/james-wainscoat-LQbaexQ2ykk-unsplash.jpg",
		"tags": ["APPLE", "EVE", "GOD", "PARADISE"],
	},
	{
		"image": "res://assets/tags/julian-gobel-Geu9kXvorzA-unsplash.jpg",
		"tags": ["COMFORT","HOME","SILK","MOISTURIZED"],
	},
	{
		"image": "res://assets/tags/kyle-mackie-Xedxbjx7MFg-unsplash.jpg",
		"tags": ["MEAT", "MACHINE", "PIG", "BLOOD"],
	},
	{
		"image": "res://assets/tags/maria-teneva-vf4O1OwtPnk-unsplash.jpg",
		"tags": ["APPETIZING", "GRAVITY", "ORBIT"],
	},
	{
		"image": "res://assets/tags/molly-blackbird-WvXPoIKsmOM-unsplash.jpg",
		"tags": ["DEMON", "HUNGRY", "SMILE", "COLORFUL"],
	},
	{
		"image": "res://assets/tags/nick-windsor-uzgIVF4F2ho-unsplash.jpg",
		"tags": ["INNOCENT", "SONIC", "SQUIRM", "EAT"],
	},
	{
		"image": "res://assets/tags/pexels-azra-tuba-demir-7806416.jpg",
		"tags": ["CELEBRATE", "PRESENT", "FUN", "OXYGEN"],
	},
	{
		"image": "res://assets/tags/pexels-cottonbro-5553772.jpg",
		"tags": ["I", "SEE", "EVERYTHING", "EAT"],
	},
	{
		"image": "res://assets/tags/pexels-eva-elijas-5503384.jpg",
		"tags": ["SPROUT", "NEWTON", "CRAWL", "ANTMAN"],
	},
	{
		"image": "res://assets/tags/pexels-jimmy-chan-2454796.jpg",
		"tags": ["GIANT", "GRASSHOPPER", "WINTER", "SEED"],
	},
	{
		"image": "res://assets/tags/sheri-silver-OkDURDz8CxU-unsplash.jpg",
		"tags": ["SUGAR", "WATCHING", "STARE", "SWEET"],
	},
	{
		"image": "res://assets/tags/stefano-pollio-ZC0EbdLC8G0-unsplash.jpg",
		"tags": ["FREE", "ME", "FROM", "STRIFE"],
	},
	{
		"image": "res://assets/tags/tomasz-sroka-RP0NT9Hd2qY-unsplash.jpg",
		"tags": ["PARTY", "HARD", "DRINK", "ALL"],
	},
]

var warnings := """No one else is here you know
Don't ignore me
No one else is here
No one else is here
No one else is here
No one else is here
I know you can understand me
No one else is here"""
