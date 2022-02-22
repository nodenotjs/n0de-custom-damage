execute if entity @s[type=player] run function ncdamage:internals/apply_changes/attributes/remove_all
execute store result score @s ncd_sethealth run attribute @s generic.max_health get 1000
function ncdamage:apply_changes