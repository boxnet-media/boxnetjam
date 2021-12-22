extends Node

#=========#
# Signals #
#=========#

# Level System
signal game_started  # Emitted when a new game is started
signal level_changed(new_level_id)  # Emitted when the level is changed
signal level_reset  # Emitted when the level is reset
signal completed_all_levels  # Emitted when the player beat the game

#===========#
# Variables #
#===========#

# Level System
export(Array, PackedScene) var level_scenes: Array
var current_level: int

#==============#
# Level System #
#==============#


# start_game: Cleans variables and loads first level
func start_game() -> void:
	# Clean variables
	self.current_level = -1

	# Load level
	self.next_level()

	# Emit signal
	emit_signal("game_started")


# is_on_last_level: Returns true if the current level refers to
# final level in the `level_scenes` array
func is_on_last_level() -> bool:
	return current_level >= len(level_scenes) + 1


# next_level: Moves the player onto the next level, if it exists
func next_level() -> void:
	if self.is_on_last_level():
		emit_signal("completed_all_levels")
		return

	self.load_level(self.current_level + 1)


# reset_level: Reloads the current level
func reset_level() -> void:
	self.load_level(self.current_level)
	emit_signal("level_reset")


# load_level: Loads a level by its index
func load_level(level_id: int) -> void:
	self.current_level = level_id
	get_tree().change_scene(self.level_scenes[self.current_level])
	print("Loaded level: %s" % self.current_level)
	emit_signal("level_changed", self.current_level)
