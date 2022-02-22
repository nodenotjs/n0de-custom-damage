#DETECT THE END OF HURTTIME. this is because if the entity receives damage immediately, the current damage of the system is not reseted
#OPTIMIZE!
execute as @s[tag=ncd.hurttimewillend] run function ncdamage:internals/track_life/reset_damage
execute as @s[scores={ncd.deaths=1..}] run function ncdamage:internals/track_life/reset_damage_after_dead
tag @s[nbt={HurtTime:2s}] add ncd.hurttimewillend
tag @s[scores={ncd.tstlhu=8}] add ncd.hurttimewillend

execute as @s[tag=ncd.shouldremoveattributes,scores={ncd.tstlhu=1..}] run function ncdamage:internals/remove_attributes
scoreboard players add @s ncd.tstlhu 1

function ncdamage:internals/track_life/track_hp
