execute store result score @s ncd.currenthp run data get entity @s Health 1000

scoreboard players operation #negativediff ncd.temp = @s ncd.oldhp
scoreboard players operation #negativediff ncd.temp -= @s ncd.currenthp

scoreboard players operation @s ncd.currentdmg > #negativediff ncd.temp

scoreboard players operation @s ncd.oldhp = @s ncd.currenthp
scoreboard players reset #negativediff ncd.temp