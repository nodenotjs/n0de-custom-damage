#DETECT THE END OF HURTTIME. this is because if the entity receives damage immediately, the current damage of the system is not reseted
#OPTIMIZE!
#For some reason, run a single function at all entities is slower than multiples @e (in this case)
execute as @e[type=!#ncdamage:ignore,tag=ncd.hurttimewillend] run function ncdamage:internals/track_life/reset_damage
execute as @a[scores={ncd.deaths=1..},nbt=!{Health:0f}] run function ncdamage:internals/track_life/reset_damage_after_respawn
execute as @e[type=!#ncdamage:ignore,nbt={HurtTime:2s}] unless score @s ncd.tstlhu matches 8.. run tag @s add ncd.hurttimewillend
tag @a[scores={ncd.tstlhu=8}] add ncd.hurttimewillend

execute as @a[tag=ncd.shouldremoveattributes,scores={ncd.tstlhu=1..}] run function ncdamage:internals/remove_attributes
scoreboard players add @a ncd.tstlhu 1

execute as @e[type=!#ncdamage:ignore] run function ncdamage:internals/track_life/track_hp