#reset temp eps
scoreboard players set #armor.eps ncd.temp 0

#store the armor on temp storage
data modify storage ncdtemp Armors set from entity @s[type=!player] ArmorItems
execute if entity @s[type=player] run function ncdamage:internals/calculate_defense/armor/enchantments/get_eps/store_playerarmor

#get eps (x1000)

function ncdamage:internals/calculate_defense/armor/enchantments/get_eps/protection
execute if score @s ncd_damagetype matches 1 run function ncdamage:internals/calculate_defense/armor/enchantments/get_eps/fire_protection
execute if score @s ncd_damagetype matches 2 run function ncdamage:internals/calculate_defense/armor/enchantments/get_eps/blast_protection
execute if score @s ncd_damagetype matches 3 run function ncdamage:internals/calculate_defense/armor/enchantments/get_eps/projectile_protection
execute if score @s ncd_damagetype matches 4 run function ncdamage:internals/calculate_defense/armor/enchantments/get_eps/falling_protection

##############
scoreboard players operation #armor.eps ncd.temp < #20000 ncd.num