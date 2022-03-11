execute as @s[type=#ncdamage:undead] if score #ishurted ncd.temp matches ..0 run data modify entity @s ActiveEffects append value {Id:6,Amplifier:127b,Duration:1,ShowParticles:0b}
execute as @s[type=!#ncdamage:undead] if score #ishurted ncd.temp matches ..0 run data modify entity @s ActiveEffects append value {Id:7,Amplifier:127b,Duration:1,ShowParticles:0b}

execute unless score #donotsimulatesound ncd_options matches 2.. if score #ishurted ncd.temp matches 1 as @s anchored eyes run playsound minecraft:entity.player.hurt hostile @a ^ ^ ^ .45 1.2

execute if score #ishurted ncd.temp matches 0 run data modify entity @s HurtTime set value 10