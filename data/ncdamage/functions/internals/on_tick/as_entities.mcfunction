#DETECT THE END OF HURTTIME. this is because if the entity receives damage immediately, the current damage of the system is not reseted
#OPTIMIZE!
execute as @s[tag=ncd.hurttimewillend] run function ncdamage:internals/track_life/reset_damage
tag @s[nbt={HurtTime:2s}] add ncd.hurttimewillend

execute as @s run function ncdamage:internals/track_life/track_hp
