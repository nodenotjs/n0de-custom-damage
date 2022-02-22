function ncdamage:internals/apply_changes/attributes/remove_all

#execute store result score #maxhealth ncd.temp run attribute @s minecraft:generic.max_health get 1000
#scoreboard players operation #maxcurdiff ncd.temp = @s ncd.virtualhp
#scoreboard players operation #maxcurdiff ncd.temp -= #maxhealth ncd.temp

#scoreboard players operation #diff ncd.temp = @s ncd_finalchange
#scoreboard players operation #diff ncd.temp += #maxcurdiff ncd.temp

#scoreboard players operation #negativehealth ncd.temp = #maxhealth ncd.temp
#scoreboard players operation #negativehealth ncd.temp += #diff ncd.temp

#execute if score #diff ncd.temp > #maxhealth ncd.temp run scoreboard players set #diff ncd.temp 0

#execute store result score #maxhealth ncd.temp run attribute @s minecraft:generic.max_health get 1000
#scoreboard players operation #diff ncd.temp = @s ncd_sethealth
#scoreboard players operation #diff ncd.temp -= #maxhealth ncd.temp

execute store result score #diff ncd.temp run attribute @s minecraft:generic.max_health get 1000
scoreboard players operation #diff ncd.temp -= @s ncd_sethealth

function ncdamage:internals/apply_changes/attributes/apply

#UPDATE HEALTH
execute unless score @s ncd_finalchange matches 0 run effect give @s instant_health 1 28 true

scoreboard players operation @s ncd.virtualhp = @s ncd_sethealth

scoreboard players set @s ncd.tstlhu 0