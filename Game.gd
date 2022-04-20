extends Node

var guess
var min_guessed = 0
var max_guessed = 10001
var ended = false

onready var message = $MarginContainer/VBoxContainer/Message

func _ready():
	_update_message()

func _try_guess(type): 
	if type == "up": 
		min_guessed = guess
	else:
		max_guessed = guess
	_update_message()

func _update_message():
	guess = (min_guessed + max_guessed) /2 
	message.text = "O Número que você pensou é: " + str(guess) + "?"

func _end_game():
	ended = true
	message.text = "Chupa, Sempre soube que o seu número era: " + str(guess) + "!"
	$MarginContainer/VBoxContainer/Correct.text = "Reiniciar"
	$MarginContainer/VBoxContainer/Greater.disabled = true
	$MarginContainer/VBoxContainer/Lesser.disabled = true
	
func _on_Greater_pressed():
	_try_guess("up")


func _on_Lesser_pressed():
	_try_guess("down")


func _on_Correct_pressed():
	if not ended:
		_end_game()
	else:
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
