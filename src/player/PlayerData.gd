extends Node

var screen_switch_speed := 2
var screen_wait_time := 0.2

var work_desks_dir = preload("res://src/office/work_desks.tscn")
var lobby_dir = preload("res://src/office/lobby.tscn")
var hallway_dir = preload("res://src/office/hallway.tscn")
var office_dir = preload("res://src/office/office.tscn")

var current_level = 0
var ending = 0

var current_job_level = 0
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
