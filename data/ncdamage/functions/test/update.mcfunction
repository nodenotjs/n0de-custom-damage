execute store result score #test ncd.temp run data get entity @s Health 1000
tellraw @a {"score":{"name":"#test","objective":"ncd.temp"}}
attribute @s generic.max_health base set 5

summon minecraft:area_effect_cloud ~ ~ ~ {Radius:0f,Duration:6,Age:4,Effects:[{Id:20b,Amplifier:5b,Duration:1,ShowParticles:0b},{Id:10b,Amplifier:5b,Duration:1,ShowParticles:0b}]}

execute store result score #test ncd.temp run data get entity @s Health 1000
tellraw @a {"score":{"name":"#test","objective":"ncd.temp"}}
attribute @s generic.max_health base set 20