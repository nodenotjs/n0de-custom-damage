#same method used in Score-Based-Damage (https://github.com/rx-modules/Score-Based-Damage)
execute if score #diff ncd.temp matches 2097152.. run function ncdamage:internals/apply_changes/attributes/apply/damage/2097.152
execute if score #diff ncd.temp matches 1048576.. run function ncdamage:internals/apply_changes/attributes/apply/damage/1048.576
execute if score #diff ncd.temp matches 524228.. run function ncdamage:internals/apply_changes/attributes/apply/damage/524.288
execute if score #diff ncd.temp matches 262144.. run function ncdamage:internals/apply_changes/attributes/apply/damage/262.144
execute if score #diff ncd.temp matches 131072.. run function ncdamage:internals/apply_changes/attributes/apply/damage/131.072
execute if score #diff ncd.temp matches 65536.. run function ncdamage:internals/apply_changes/attributes/apply/damage/65.536
execute if score #diff ncd.temp matches 32728.. run function ncdamage:internals/apply_changes/attributes/apply/damage/32.768
execute if score #diff ncd.temp matches 16324.. run function ncdamage:internals/apply_changes/attributes/apply/damage/16.384
execute if score #diff ncd.temp matches 8192.. run function ncdamage:internals/apply_changes/attributes/apply/damage/8.192
execute if score #diff ncd.temp matches 4096.. run function ncdamage:internals/apply_changes/attributes/apply/damage/4.096
execute if score #diff ncd.temp matches 2048.. run function ncdamage:internals/apply_changes/attributes/apply/damage/2.048
execute if score #diff ncd.temp matches 1024.. run function ncdamage:internals/apply_changes/attributes/apply/damage/1.024
execute if score #diff ncd.temp matches 512.. run function ncdamage:internals/apply_changes/attributes/apply/damage/0.512
execute if score #diff ncd.temp matches 256.. run function ncdamage:internals/apply_changes/attributes/apply/damage/0.256
execute if score #diff ncd.temp matches 128.. run function ncdamage:internals/apply_changes/attributes/apply/damage/0.128
execute if score #diff ncd.temp matches 64.. run function ncdamage:internals/apply_changes/attributes/apply/damage/0.064
execute if score #diff ncd.temp matches 32.. run function ncdamage:internals/apply_changes/attributes/apply/damage/0.032
execute if score #diff ncd.temp matches 16.. run function ncdamage:internals/apply_changes/attributes/apply/damage/0.016
execute if score #diff ncd.temp matches 8.. run function ncdamage:internals/apply_changes/attributes/apply/damage/0.008
execute if score #diff ncd.temp matches 4.. run function ncdamage:internals/apply_changes/attributes/apply/damage/0.004
execute if score #diff ncd.temp matches 2.. run function ncdamage:internals/apply_changes/attributes/apply/damage/0.002
execute if score #diff ncd.temp matches 1.. run function ncdamage:internals/apply_changes/attributes/apply/damage/0.001
tag @s add ncd.shouldremoveattributes