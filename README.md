
# N0de Custom Damage

A datapack tool to cause customized damage to entities and mobs. It can take into account armor and different types of enchantments, ignore hurttime and several other options. 
## ⭐ Features


- Custom Damage based on armor, enchantments and resistance effect.
- Custom Heal and Set Health
- Decimal Places (on the things listed above)
- Options to cause damage
- Return Values

## ⁉️ Implementing in your Datapack
Install the datapack in your world and you are done. Other datapacks will already be able to execute the commands from this datapack!
**Do not merge/merge the datapack inside your own!** This may cause conflict with other datapacks that use it.

However, there are some cautions and changes that you must take when developing your datapack using this.

The datapack takes 1 tick to actually change the HP of the player, and in that time the maximum HP of the player is also changed. There are functions in this datapack that will return the correct value

#### /function ncdamage:get_fixed_health
Returns the HP of the entity in `#maxhp ncd.temp` taking into consideration the actual HP that should be.
Example:
```mcfunction
function ncdamage:get_fixed_health
execute if score #hp ncd.temp matches 20000 run say 20hp
```

#### /function ncdamage:get_fixed_max_health
Returns the max HP of the entity in `#maxhp ncd.temp` taking into consideration the actual HP that should be.
Example:
```mcfunction
function ncdamage:get_fixed_max_health
execute if score #maxhp ncd.temp matches 20000 run say 20hp
```

## ℹ️ How to Use

Please Note:
- All the scoreboard values in this datapack are in x1000 scale. i.e. 2500 equals 2.5
- The HP takes 1 tick to be updated and in this time the maximum life of the entities is modified. The section above shows how to deal with this.
- All the examples here would be of a function executing `as <entity>`

### 🩸 Custom Damage:

Allows you to deal damage to any player/entity damage calculating the armor, enchantments, and resistance effect. Unfortunately, it does not take absorption into account.

**Deal 2.23hp damage:**
```mcfunction
scoreboard players set @s ncd_damage 2230
function ncdamage:apply_changes
```
This was a quick example of how to do damage. You also have some **options**, such as ignoring hurttime and damage type. See the section below.


#### Scoreboard Damage Options:
```txt
### Options:
- ncd_bypshurttime: If it is 1 or greater, deals damage even if the player/entity is in hurttime.
- ncd_bypsresef: If it is 1 or greater, deals damage without calculating the resistance effect.
- ncd_damagetype: Sets the damage type (listed bellow). It is used to calculate enchantments or ignore armor.
- ncd_piercing: Set value of ncd_apiercing and ncd_epiercing to ncd_piercing.
- ncd_apiercing: Defines in % the armor piercing (only armor) (how much it will be ignored). Min Value: 0 Max Value: 100000. It is possible to put values beyond that, but unexpected behavior may occur!
- ncd_epiercing: Defines in % the enchantments piercing (enchantments only) (how much it will be ignored).  Min Value: 0 Max Value: 100000. It is possible to put values beyond that, but unexpected behavior may occur!

### Damage Types:
- General/Any: any value or unset
- Fire: 1
- Explosion: 2
- Projectile: 3
- Fall Damage: 4
- Magic: 5 (penetrates armor, but not enchantments)
- Void/Effects: -1 (bypass the armor)
```


Example using all options:
```mcfunction
# Deals 12.5 projectile damage ignoring the hurttime, protection enchantments and resistance effect and piercing 50% of the armor
scoreboard players set @s ncd_damage 12500
scoreboard players set @s ncd_damagetype 3
scoreboard players set @s ncd_bypshurttime 1
scoreboard players set @s ncd_epiercing 100000
scoreboard players set @s ncd_apiercing 50000
scoreboard players set @s ncd_bypsresef 1
function ncdamage:apply_changes
```
### 💚 Custom Heal
Heal any player/entity with as much as you want.

**Heal 5hp:**
```mcfunction
scoreboard players set @s ncd_heal 5000
function ncdamage:apply_changes
```
### 💛 Set Health
Set the health of any mob/player. It ignores any defense and hurttime.

**Set Health to 10.505hp:**
```mcfunction
scoreboard players set @s ncd_sethealth 10505
function ncdamage:apply_changes
```
### ↩️ Return Values
When you execute `function ncdamage:apply_changes`, it sets 2 scoreboards on the entity.
```txt
ncd_finaldamage: Returns the final damage caused by the system.
ncd_finalchange: Returns the difference from the previous health and the current health.
```
### Tips & More Usage Examples
Notes:
- All scores (such damage and options) are reset after apply_changes.
- The datapack does not wear out the armor.
- In vanilla, healthboost or life attributes that define the player's health for more than 1024hp bugs the datapack. Health boost level 250 is the maximum that can be set.


Deal 18.75hp ignoring any defense.

```mcfunction
scoreboard players set @s ncd_damage 18750
scoreboard players set @s ncd_damagetype -1
scoreboard players set @s ncd_bypsresef 1
function ncdamage:apply_changes
```
Now, piercing 50% armor and enchantments:
```mcfunction
scoreboard players set @s ncd_damage 18750
scoreboard players set @s ncd_piercing 50000
function ncdamage:apply_changes
```

You can also mix damage, healing and sethp in the same application and several times per tick.
```mcfunction
scoreboard players set @s ncd_sethealth 20000
scoreboard players set @s ncd_damage 9000
scoreboard players set @s ncd_heal 1000
function ncdamage:apply_changes

scoreboard players set @s ncd_heal 2000
function ncdamage:apply_changes
```

And of course, you can set or do any operation with any of these scores by other scores.

Causing % damage:
```mcfunction
# Causing damage equal to 20% of the entity's maximum Helath
# Note: the "numbers" scores are not datapack scores. You must create them and set the fakeplayer to the desired value

function ncdamage:get_fixed_max_health
scoreboard players operation @s ncd_damage = #maxhp ncd.temp
scoreboard players operation @s ncd_damage *= 20 number
scoreboard players operation @s ncd_damage /= 100 number
function ncdamage:apply_changes
```

## 🗑️ Uninstalling
If you no longer want the datapack, you can uninstall it.

Run the `/function ncdamage:internals/uninstall` command to remove all scoreboards created by the datapack, then remove the datapack from your world or disable it using `/datapack disable <datapack>`.

Before you do this, make sure that no datapack is dependent on this one. Otherwise they will break!

## Technical Notes
### All Commands:
| Command | Description | Inputs | Outputs |
| --- | --- | --- | --- |
| `function ncdamage:apply_changes` | Applies changes to the entity's health based on inputs. takes 1 tick to complete | `<entity @s context>`, `@sn cd_bypshurttime`, `@s ncd_bypsresef`, `@s ncd_damagetype`, `@s ncd_piercing`, `@s ncd_apiercing`, `@s ncd_epiercing` | `@s ncd_finaldamage`, `@s ncd_finalchange` |
| `function ncdamage:get_fixed_health` | Returns the fixed HP of the entity. Serves to compensate the 1 tick delay of `apply_changes`. | `<entity @s context>` | `#hp ncd.temp` |
| `function ncdamage:get_fixed_max_health` | Returns the fixed max HP of the entity. Serves to compensate the 1 tick delay of `apply_changes`. | `<entity @s context>` | `#maxhp ncd.temp` |
| `function ncdamage:internals/uninstall` | Removes all scoreboards created by datapack | - | Chat Message |

### Other Notes:
- Important Note: The resistance effect level 36 (specifically) is ignored. This is because the system uses it to not kill the player with simulated damage.
- A player takes 1 tick to have his current health updated. In that tick, maybe any normal damage or healing (other than from the datapack) can end up being ignored, but it is irrelevant most of the time.
- The datapack tries to respect the hurttime by not doing more damage than it should, but the game does not count the datapack damage into consideration, making it possible to do more damage through normal means.
- When the player is below 1hp, it is not possible to do damage with attributes. So the player doesn't receive any real damage, but the current health is stored and tracked in the score `ncd.virtualhp`. If the player takes, the datapack will calculate this and if the health is 0, the datapack kills the entity with `/kill`
- The datapack tracks the life of all entities in order to correctly apply hurttime and fractional damage. This may have a small impact on performance.
