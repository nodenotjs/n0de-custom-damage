#!!!!!!!HELLO, SNIFFER! if you are reading this, you are probably sniffing into my datapack.
#it is a bit messy at the moment and doesn't have many notes, but I plan to release an update adding notas and organizing some functions better
#if you have any interest in knowing more about how this works, you can talk to me (N0de#0657) on diswcord!
#if you find something wrong with the calculations, you can add a bugreport on planetminecraft or talk to me on discord.

#USER CONFIG
#(scaled x1000) damages and apply all damage logic to the entity
scoreboard objectives add ncd_damage dummy
#(scaled x1000) heals an entity
scoreboard objectives add ncd_heal dummy
#(scaled x1000) defines the life of an entity
scoreboard objectives add ncd_sethealth dummy

#DAMAGE TYPES ARE:
#Any: any value or unset
#Fire: 1
#Explosion: 2
#Projectile: 3
#Fall Damage: 4
#Magic: 5
#Void/Effects (ignores the armor): -1
scoreboard objectives add ncd_damagetype dummy

#ignore the resistance effect
scoreboard objectives add ncd_bypsresef dummy
#ignore the hurttime
scoreboard objectives add ncd_bypshurttime dummy

#(scaled x1000) sets apiercing and epiercing to the same value
scoreboard objectives add ncd_piercing dummy

#(scaled x1000) in %, the amount of armor (only armor) that will be ignored
scoreboard objectives add ncd_apiercing dummy
#(scaled x1000) in %, the amount of armor enchantments that will be ignored
scoreboard objectives add ncd_epiercing dummy

#options
scoreboard objectives add ncd_options dummy
scoreboard players add #donotignoreinvul ncd_options 0
scoreboard players add #donotsimulatesound ncd_options 0

#return values
scoreboard objectives add ncd_finaldamage dummy
scoreboard objectives add ncd_finalchange dummy


#useful system values
scoreboard objectives add ncd.currentdmg dummy
scoreboard players reset * ncd.currentdmg
scoreboard objectives add ncd.currenthp dummy
scoreboard players reset * ncd.currenthp
scoreboard objectives add ncd.oldhsp dummy
scoreboard players reset * ncd.oldhsp
scoreboard objectives add ncd.virtualhp dummy
scoreboard players reset * ncd.virtualhp
scoreboard objectives add ncd.deaths deathCount

scoreboard objectives add ncd.tstlhu dummy
scoreboard players reset * ncd.tstlhu
scoreboard objectives add ncd.temp dummy

scoreboard objectives add ncd.num dummy
scoreboard players set #0 ncd.num 0
scoreboard players set #2 ncd.num 2
scoreboard players set #4 ncd.num 4
scoreboard players set #5 ncd.num 5
scoreboard players set #20 ncd.num 20
scoreboard players set #25 ncd.num 25
scoreboard players set #100 ncd.num 100
scoreboard players set #200 ncd.num 200
scoreboard players set #1000 ncd.num 1000
scoreboard players set #10000 ncd.num 10000
scoreboard players set #2000 ncd.num 2000
scoreboard players set #20000 ncd.num 20000
scoreboard players set #100000 ncd.num 100000
scoreboard players set #200000 ncd.num 200000

scoreboard objectives add ncd.health health