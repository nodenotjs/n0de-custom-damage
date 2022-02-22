data modify storage ncdtemp Armors set value [{},{},{},{}]
data modify storage ncdtemp Inventory set from entity @s Inventory

data modify storage ncdtemp Armors[0] set from storage ncdtemp Inventory[{Slot:100b}]
data modify storage ncdtemp Armors[1] set from storage ncdtemp Inventory[{Slot:101b}]
data modify storage ncdtemp Armors[2] set from storage ncdtemp Inventory[{Slot:102b}]
data modify storage ncdtemp Armors[3] set from storage ncdtemp Inventory[{Slot:103b}]
data remove storage ncdtemp Inventory