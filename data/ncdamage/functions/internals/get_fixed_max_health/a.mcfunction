function ncdamage:internals/apply_changes/attributes/remove_all
execute store result score #maxhp2 ncd.temp run attribute @s generic.max_health get 1000
scoreboard players operation #diff ncd.temp = #maxhp2 ncd.temp
scoreboard players operation #diff ncd.temp -= #maxhp ncd.temp
execute store result score #maxhp ncd.temp run attribute @s generic.max_health get 1000
function ncdamage:internals/apply_changes/attributes/apply