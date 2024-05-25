extends Node
	
var attacks: Dictionary = {
	"Shotgun Blast": {
		"description": "Deals damage to a single zombie.",
		"stats": {
			"damage": 2
		},
		"diceRequired": ["2 Attack"]
	},
	"Molotov Cocktail": {
		"description": "Deals area-of-effect damage to multiple zombies.",
		"stats": {
			"damage": 3
		},
		"diceRequired": ["3 Attack"]
	},
	"Sniper Shot": {
		"description": "Deals high damage to a single zombie.",
		"stats": {
			"damage": 4
		},
		"diceRequired": ["2 Attack", "1 Support"]
	},
	"Grenade Toss": {
		"description": "Deals damage to multiple zombies in a small area.",
		"stats": {
			"damage": 3
		},
		"diceRequired": ["2 Attack", "1 Defense"]
	},
	"Flamethrower": {
		"description": "Deals continuous damage to zombies in a straight line.",
		"stats": {
			"damage": 2
		},
		"diceRequired": ["3 Attack"]
	}
}

var units: Dictionary = {
	"Survivor Scout": {
		"description": "Scouts the area and alerts survivors of approaching threats.",
		"diceRequired": ["Attack", "Support"],
		"stats": {
			"health": 1,
			"attackDamage": 1,
			"cooldown": 1
		},
		"specialAbility": "Alert - Reveals incoming zombies in the next wave.",
		"upgradeBonuses": {
			"2": {
				"health": 2,
				"attackDamage": 1
			},
			"3": {
				"health": 3,
				"attackDamage": 2,
				"cooldown": -1
			}
		},
		"upgradeCosts": {
			"2": {
				"scrapMetal": 10,
				"medicalSupplies": 5
			},
			"3": {
				"scrapMetal": 20,
				"medicalSupplies": 10,
				"electronicComponents": 5
			}
		}
	},
}

var zombies: Dictionary = {
	"Normal Zombie": {
		"type": "Normal",
		"description": "The standard undead threat. Slow-moving but relentless in pursuit.",
		"stats": {
			"health": 3,
			"attackDamage": 1,
			"movementSpeed": "Slow"
		}
	},
	"Fast Zombie": {
		"type": "Fast",
		"description": "An agile and swift undead, capable of outrunning survivors.",
		"stats": {
			"health": 2,
			"attackDamage": 1,
			"movementSpeed": "Fast"
		}
	},
	"Tank Zombie": {
		"type": "Tank",
		"description": "A hulking behemoth of undead strength and resilience.",
		"stats": {
			"health": 8,
			"attackDamage": 3,
			"movementSpeed": "Slow"
		}
	}
}

var defense: Dictionary = {
	"Wooden Barricade": {
		"description": "Blocks incoming damage from zombies.",
		"stats": {
			"defense": 3
		},
		"diceRequired": ["1 Defense"]
	},
	"Steel Door": {
		"description": "Provides additional protection against zombie attacks.",
		"stats": {
			"defense": 4
		},
		"diceRequired": ["2 Defense"]
	},
	"Reinforced Fence": {
		"description": "Increases the durability of the safe house perimeter.",
		"stats": {
			"defense": 3
		},
		"diceRequired": ["1 Defense", "1 Support"]
	},
	"Spike Trap": {
		"description": "Damages zombies that move through a specific area.",
		"stats": {
			"damage": 2
		},
		"diceRequired": ["1 Defense"]
	},
	"Electric Fence": {
		"description": "Electrifies the perimeter, damaging zombies on contact.",
		"stats": {
			"damage": 3
		},
		"diceRequired": ["2 Defense", "1 Support"]
	}
}

var support: Dictionary = {
	"First Aid Kit": {
		"description": "Heals a specified amount of health.",
		"stats": {
			"healing": 3
		},
		"diceRequired": ["1 Support"]
	},
	"Ammo Cache": {
		"description": "Restocks ammunition for ranged attacks.",
		"diceRequired": ["1 Support", "1 Resource"]
	},
	"Resource Scavenge": {
		"description": "Gains additional resources for upgrades.",
		"diceRequired": ["1 Resource"]
	},
	"Adrenaline Boost": {
		"description": "Temporarily increases attack or defense.",
		"diceRequired": ["1 Support", "1 Attack"]
	},
	"Survivor's Respite": {
		"description": "Provides temporary shelter, regenerating health.",
		"stats": {
			"healing": 2
		},
		"diceRequired": ["2 Support"]
	}
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
