extends Node2D

enum ZombieType { NORMAL, FAST, TANK }

var zombie_stats = {
	ZombieType.NORMAL: { "health": 3, "attackDamage": 1, "movementSpeed": "Slow" },
	ZombieType.FAST: { "health": 2, "attackDamage": 1, "movementSpeed": "Fast" },
	ZombieType.TANK: { "health": 8, "attackDamage": 2, "movementSpeed": "Slow" }
}
