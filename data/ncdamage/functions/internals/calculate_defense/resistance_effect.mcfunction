data modify storage ncdtemp ResistanceEffect set from entity @s ActiveEffects[{Id:11b}]
execute store result score #resistance.amplifier ncd.temp run data get storage ncdtemp ResistanceEffect.Amplifier
execute if score #resistance.amplifier ncd.temp matches ..-1 run scoreboard players set #resistance.amplifier ncd.temp 5


execute if entity @s[type=player] if score #resistance.amplifier ncd.temp matches 36 run function ncdamage:internals/calculate_defense/resistance_effect/fix_resistance


scoreboard players add #resistance.amplifier ncd.temp 1

scoreboard players operation #resistance.amplifier ncd.temp *= #20 ncd.num
scoreboard players operation #resistance.amplifier ncd.temp < #100 ncd.num

scoreboard players operation #final ncd.temp = #100 ncd.num
scoreboard players operation #final ncd.temp -= #resistance.amplifier ncd.temp

scoreboard players operation @s ncd_damage *= #final ncd.temp 
scoreboard players operation @s ncd_damage /= #100 ncd.num 