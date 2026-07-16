extends Node
## AudioManager — music crossfade + SFX playback API.
## Not responsible for which tracks/SFX play where — that's Dev B (audio/ assignment).
## CONTRACT: method signatures below are frozen for Dev B integration (Phase 0).
## Works correctly with zero audio files loaded — Dev B calls this API from day one.

func play_music(track: AudioStream, fade_duration: float = 1.0) -> void:
	# TODO(DevA - Phase 0/8): crossfade from current music track to `track`
	pass

func stop_music(fade_duration: float = 1.0) -> void:
	# TODO(DevA - Phase 0/8)
	pass

func play_sfx(sfx: AudioStream) -> void:
	# TODO(DevA - Phase 0/8): one-shot playback, pooled AudioStreamPlayer(s)
	pass
