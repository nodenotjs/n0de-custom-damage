scoreboard players operation #diff ncd.temp = @s ncd_damage
scoreboard players operation #diff ncd.temp -= @s ncd.currentdmg

scoreboard players operation #diff ncd.temp > #0 ncd.num
scoreboard players operation @s ncd_damage = #diff ncd.temp
scoreboard players operation @s ncd.currentdmg += @s ncd_damage