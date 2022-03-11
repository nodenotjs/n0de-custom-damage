#planned: increase accuracy

execute if score @s ncd_damagetype matches 5 run scoreboard players set @s ncd_apiercing 100000

execute if score @s ncd_piercing matches -2147483648.. run function ncdamage:internals/apply_changes/set_aepiercing_from_piercing
execute if score @s ncd_apiercing matches -2147483648.. run function ncdamage:internals/apply_changes/get_apercentage
execute if score @s ncd_epiercing matches -2147483648.. run function ncdamage:internals/apply_changes/get_epercentage

execute store result score #armor ncd.temp run attribute @s generic.armor get 1000
execute store result score #tou ncd.temp run attribute @s generic.armor_toughness get 1000
scoreboard players operation #armor2 ncd.temp = #armor ncd.temp
scoreboard players operation #dmg1 ncd.temp = @s ncd_damage


#tou = 2(x1000) + (tou / 4)
scoreboard players operation #tou ncd.temp /= #4 ncd.num
scoreboard players add #tou ncd.temp 2000

#MAXarg2 = armor - dmg1/tou
scoreboard players operation #dmg1 ncd.temp *= #1000 ncd.num
scoreboard players operation #dmg1 ncd.temp /= #tou ncd.temp
scoreboard players operation #armor ncd.temp -= #dmg1 ncd.temp

#MAXarg1 = armor2 / 5
scoreboard players operation #armor2 ncd.temp /= #5 ncd.num

#max(MAXarg1, MAXarg2)
scoreboard players operation #armor2 ncd.temp > #armor ncd.temp

#min(MAXarg1, 20(x1000))
scoreboard players operation #armor2 ncd.temp < #20000 ncd.num

#armor2 (final result) / 25
scoreboard players operation #armor2 ncd.temp /= #25 ncd.num

execute if score @s ncd_apiercing matches -2147483648.. run function ncdamage:internals/calculate_defense/armor/apply_apiercing

#resisted (1-final result) (resisted percentage)
scoreboard players set #resisted ncd.temp 1000
scoreboard players operation #resisted ncd.temp -= #armor2 ncd.temp


#damage * FINAL
scoreboard players operation @s ncd_damage *= #resisted ncd.temp
scoreboard players operation @s ncd_damage /= #1000 ncd.num


#apply EPF (Enchantment Protection Factor)
execute unless score @s ncd_epiercing matches 0.. run function ncdamage:internals/calculate_defense/armor/enchantments/get_eps

scoreboard players set #resisted ncd.temp 1000
scoreboard players operation #armor.eps ncd.temp /= #25 ncd.num

execute if score @s ncd_epiercing matches -2147483648.. run function ncdamage:internals/calculate_defense/armor/apply_epiercing

scoreboard players operation #resisted ncd.temp -= #armor.eps ncd.temp


scoreboard players operation @s ncd_damage *= #resisted ncd.temp
scoreboard players operation @s ncd_damage /= #1000 ncd.num
