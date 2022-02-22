execute store result score #maxhp ncd.temp run attribute @s generic.max_health get 1000
#this is more accurate than storing the difference in a scoreboard when attributes are applied. already tested
execute if entity @s[tag=ncd.shouldremoveattributes] run function ncdamage:internals/get_fixed_max_health/a