#execute if score #hurttime ncd.temp matches ..1 if score @s ncd_sethealth matches ..1000 at @s run summon area_effect_cloud ~ ~ ~ {Duration:6,Age:4,RadiusOnUse:-1f,Effects:[{Id:20,Duration:1,Amplifier:5b,ShowParticles:0b},{Id:11,Duration:2,Amplifier:36b,ShowParticles:0b}]}
#execute if score #hurttime ncd.temp matches ..1 if score @s ncd_sethealth matches 1001.. at @s run summon area_effect_cloud ~ ~ ~ {Duration:6,Age:4,RadiusOnUse:-1f,Effects:[{Id:20,Duration:1,Amplifier:5b,ShowParticles:0b},{Id:10,Duration:1,Amplifier:5b,ShowParticles:0b}]}
execute if score #hurttime ncd.temp matches ..1 at @s run summon area_effect_cloud ~ ~ ~ {Duration:6,Age:4,RadiusOnUse:-1f,Effects:[{Id:20,Duration:1,Amplifier:5b,ShowParticles:0b},{Id:11,Duration:2,Amplifier:36b,ShowParticles:0b}]}

execute unless score #donotsimulatesound ncd_options matches 1.. unless score #hurttime ncd.temp matches 0 as @s anchored eyes run function ncdamage:internals/apply_changes/simulate_damage/player/sound
