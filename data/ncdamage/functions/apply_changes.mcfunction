#!!!!!!!HELLO, SNIFFER! if you are reading this, you are probably analyzing into my datapack.
#it is a bit messy at the moment and doesn't have many notes, but I plan to release an update adding notes and organizing some functions better
#if you have any interest in knowing more about how this works, you can talk to me (N0de#0001) on discord!
#if you find something wrong with the calculations, you can add a bugreport on planetminecraft or talk to me on discord.

#RESET AND SET SOME SCORES
execute store result score #currenthealth ncd.temp run data get entity @s Health 1000
execute if entity @s[type=player,scores={ncd.tstlhu=1..}] if score #currenthealth ncd.temp matches 1001.. run scoreboard players reset @s ncd.virtualhp
execute unless score @s ncd.virtualhp matches -2147483648.. run scoreboard players operation @s ncd.virtualhp = #currenthealth ncd.temp
######################

#ignore damage if the players is in creative or spectator or is Invulnerable
execute if entity @s[type=player,gamemode=!survival,gamemode=!adventure] run scoreboard players set @s ncd_damage 0
execute unless score #donotignoreinvul ncd_options matches 1.. if data entity @s {Invulnerable:1b} run scoreboard players set @s ncd_damage 0
######################

#check if hurted
execute store result score #hurttime ncd.temp run data get entity @s HurtTime
execute store success score #ishurted ncd.temp unless score #hurttime ncd.temp matches 0
execute if score @s ncd.currentdmg matches 1.. run scoreboard players set #ishurted ncd.temp 1
execute if score #ishurted ncd.temp matches 0 run scoreboard players set @s ncd.currentdmg 0
######################

#check should hurt
scoreboard players set #shouldhurt ncd.temp 0
execute if score @s ncd_damage matches 1.. if score @s ncd_bypshurttime matches 0 if score #ishurted ncd.temp matches 0 run scoreboard players add #shouldhurt ncd.temp 1
execute if score @s ncd_damage matches 1.. if score @s ncd_bypshurttime matches 1 run scoreboard players add #shouldhurt ncd.temp 1
######################

#virtual health thing
execute unless score @s ncd_sethealth matches -2147483648.. run scoreboard players operation @s ncd_sethealth = @s ncd.virtualhp
######################

#CALCULATE RESISTANCE
execute if score @s ncd_damage matches 1.. unless score @s ncd_damagetype matches -1 run function ncdamage:internals/calculate_defense/armor
execute unless score @s ncd_bypsresef matches 1.. if data entity @s ActiveEffects[{Id:11b}] run function ncdamage:internals/calculate_defense/resistance_effect

#APPLY HURTTIME RULES
execute if score #ishurted ncd.temp matches 1 unless score @s ncd_bypshurttime matches 1.. run function ncdamage:internals/apply_changes/apply_hurttime_rules
######################


#APPLY DAMAGE AND HEAL TO sethealth
scoreboard players operation @s ncd_sethealth -= @s ncd_damage
scoreboard players operation @s ncd_sethealth += @s ncd_heal
scoreboard players operation @s ncd_sethealth > #0 ncd.num

scoreboard players operation @s ncd_finalchange = @s ncd_sethealth
scoreboard players operation @s ncd_finalchange -= @s ncd.virtualhp
scoreboard players operation @s ncd.currentdmg += @s ncd_damage
######################

#SIMULATE DAMAGE
execute if score @s ncd_finalchange matches ..-1 run scoreboard players set #shouldhurt ncd.temp 1
execute if score #shouldhurt ncd.temp matches 1.. run function ncdamage:internals/apply_changes/simulate_damage
#######################

#SET HEALTH
execute if score @s ncd_sethealth matches ..0 run kill @s
execute if entity @s[type=!player] unless score @s ncd_finalchange matches 0 run function ncdamage:internals/apply_changes/mob
execute if entity @s[type=player] unless score @s ncd_finalchange matches 0 run function ncdamage:internals/apply_changes/player
#######################

#return values
#(ncd already set)
scoreboard players operation @s ncd_finaldamage = @s ncd_damage

#reset values
scoreboard players reset @s[type=!player] ncd.virtualhp
scoreboard players reset @s ncd_damagetype
scoreboard players reset @s ncd_bypshurttime
scoreboard players reset @s ncd_sethealth
scoreboard players reset @s ncd_damage
scoreboard players reset @s ncd_heal
scoreboard players reset @s ncd_piercing
scoreboard players reset @s ncd_apiercing
scoreboard players reset @s ncd_epiercing
