playsound minecraft:entity.player.hurt player @s ^ ^ ^.5 1 1
tag @s add ncd.this
playsound minecraft:entity.player.hurt player @a[tag=!ncd.this] ^ ^ ^ 1 1
tag @s remove ncd.this