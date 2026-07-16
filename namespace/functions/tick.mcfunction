# 1. Teletransportamos la barra a la posición del zombie
execute as @e[tag=barra_vida] at @s run tp @s @e[tag=mi_zombie,limit=1,sort=nearest]

# 2. Aquí vendría la lógica compleja (usando scoreboards)
# Para simplificar: el score nos dirá cuántas rayitas mostrar
scoreboard players operation @e[tag=mi_zombie] vida = @s Health