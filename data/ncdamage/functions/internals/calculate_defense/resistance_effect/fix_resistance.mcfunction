execute store result score #resistance.amplifier ncd.temp run data get storage ncdtemp ResistanceEffect.HiddenEffect.Amplifier
execute store result score #resistance.duration ncd.temp run data get storage ncdtemp ResistanceEffect.HiddenEffect.Duration
execute if score #resistance.duration ncd.temp matches ..-1 run scoreboard players set #resistance.amplifier ncd.temp 0