extends Node

var current_tag := 0
var current_level := 0
var current_emails := 3
var first_play := ""
var tags_completed := 0
var current_job_level := 0
var ending := -1

# Inventory
var has_gaslight = false
var has_key = false
var has_finger = false
var has_drink = false
var has_casserole = false
var has_feather = false


var easy_mode = false
var has_not_seen = true
var has_not_heard = true
var screen_switch_speed := 2
var screen_wait_time := 0.2

var main_menu = preload("res://src/menu/main_menu.tscn")
var work_desks_dir = preload("res://src/office/work_desks.tscn")
var elevator_dir = preload("res://src/office/elevator.tscn")
var lobby_dir = preload("res://src/office/lobby.tscn")
var hallway_dir = preload("res://src/office/hallway.tscn")
var office_dir = preload("res://src/office/office.tscn")
var bulletin_dir = preload("res://src/office/bulletin.tscn")
var bathroom_dir = preload("res://src/office/bathroom.tscn")
var kitchen_dir = preload("res://src/office/kitchen.tscn")
var drawer_dir = preload("res://src/office/drawer.tscn")
var right_desks_dir = preload("res://src/office/right_desks.tscn")
var altar_dir = preload("res://src/office/altar.tscn")
var screen = preload("res://src/screen/screen.tscn")

func reset_items() -> void:
	has_gaslight = false
	has_key = false
	has_finger = false
	has_drink = false
	has_casserole = false
	has_feather = false
