extends Node

var easy_mode = false

var screen_switch_speed := 2
var screen_wait_time := 0.2

var work_desks_dir = preload("res://src/office/work_desks.tscn")
var lobby_dir = preload("res://src/office/lobby.tscn")
var hallway_dir = preload("res://src/office/hallway.tscn")
var office_dir = preload("res://src/office/office.tscn")

var current_level = 0
var current_emails = 3
var ending = 0
var first_play = ""

var current_job_level = 0
