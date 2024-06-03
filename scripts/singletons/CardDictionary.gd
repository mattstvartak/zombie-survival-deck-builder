extends Node
	
var buff: Dictionary = {
	"Survival Training": {
		"name": "Survival Training",
		"description": "Enhances the unit's overall survivability.",
		"buff": {
			"health": 2,
			"defense": 1
		},
		"diceRequired": {
			"supportDice": 1
		},
		"upgrades": {
			"Tier 2": {
				"buff": {
					"health": 4,
					"defense": 2
				},
				"costs": {
					"scrapMetal": 10
				}
			},
			"Tier 3": {
				"buff": {
					"health": 6,
					"defense": 3
				},
				"costs": {
					"scrapMetal": 15,
					"medicalSupplies": 5
				}
			}
		}
	},
	"Police Training": {
		"name": "Police Training",
		"description": "Enhances the unit's combat skills with a focus on attack and defense.",
		"buff": {
			"attackDamage": 2,
			"defense": 1
		},
		"diceRequired": {
			"attackDice": 1,
			"defenseDice": 1
		},
		"upgrades": {
			"Tier 2": {
				"buff": {
					"attackDamage": 3,
					"defense": 2
				},
				"costs": {
					"scrapMetal": 10
				}
			},
			"Tier 3": {
				"buff": {
					"attackDamage": 4,
					"defense": 3
				},
				"costs": {
					"scrapMetal": 15,
					"steel": 5
				}
			}
		}
	},
	"Cardio Training": {
		"name": "Cardio Training",
		"description": "Enhances the unit's movement speed and stamina.",
		"buff": {
			"movementSpeed": 2,
			"health": 1
		},
		"diceRequired": {
			"supportDice": 1
		},
		"upgrades": {
			"Tier 2": {
				"buff": {
					"movementSpeed": 3,
					"health": 2
				},
				"costs": {
					"scrapMetal": 5
				}
			},
			"Tier 3": {
				"buff": {
					"movementSpeed": 4,
					"health": 3
				},
				"costs": {
					"scrapMetal": 10,
					"electronicComponents": 5
				}
			}
		}
	},
	"Weapons Training": {
		"name": "Weapons Training",
		"description": "Enhances the unit's proficiency with various weapons.",
		"buff": {
			"attackDamage": 3
		},
		"diceRequired": {
			"attackDice": 2
		},
		"upgrades": {
			"Tier 2": {
				"buff": {
					"attackDamage": 4
				},
				"costs": {
					"scrapMetal": 10
				}
			},
			"Tier 3": {
				"buff": {
					"attackDamage": 5
				},
				"costs": {
					"scrapMetal": 15,
					"ammunition": 5
				}
			}
		}
	},
	"Martial Arts Training": {
		"name": "Martial Arts Training",
		"description": "Improves the unit's hand-to-hand combat skills, enhancing both attack and defense.",
		"buff": {
			"attackDamage": 2,
			"defense": 2
		},
		"diceRequired": {
			"attackDice": 1,
			"defenseDice": 1
		},
		"upgrades": {
			"Tier 2": {
				"buff": {
					"attackDamage": 3,
					"defense": 3
				},
				"costs": {
					"scrapMetal": 15
				}
			},
			"Tier 3": {
				"buff": {
					"attackDamage": 4,
					"defense": 4
				},
				"costs": {
					"scrapMetal": 20,
					"steel": 5
				}
			}
		}
	},
	"First Aid Training": {
		"name": "First Aid Training",
		"description": "Improves the unit's ability to heal themselves and others.",
		"buff": {
			"health": 3
		},
		"diceRequired": {
			"supportDice": 1
		},
		"upgrades": {
			"Tier 2": {
				"buff": {
					"health": 5
				},
				"costs": {
					"scrapMetal": 10
				}
			},
			"Tier 3": {
				"buff": {
					"health": 7
				},
				"costs": {
					"scrapMetal": 15,
					"medicalSupplies": 5
				}
			}
		}
	}
}

var unit: Dictionary = {
	"Survivor Scout": {
		"name": "Survivor Scout",
		"description": "Scouts the area and alerts survivors of approaching threats. Equipped with a handgun.",
		"stats": {
			"health": 1,
			"attackDamage": 1,
			"defense": 0,
			"cooldown": 1,
			"movementSpeed": 3,
			"attackRange": 5
		},
		"specialAbility": "Alert - Reveals incoming zombie waves in advance (Cooldown: 1 turn).",
		"diceRequired": {
			"attackDice": 1,
			"defenseDice": 0,
			"supportDice": 1
		},
		"upgrades": {
			"Tier 2 (Veteran Survivor Scout)": {
				"bonuses": {
					"health": 2,
					"attackDamage": 1
				},
				"costs": {
					"scrapMetal": 10,
					"medicalSupplies": 5
				}
			},
			"Tier 3 (Elite Survivor Scout)": {
				"bonuses": {
					"health": 3,
					"attackDamage": 2,
					"cooldown": -1
				},
				"costs": {
					"scrapMetal": 20,
					"medicalSupplies": 10,
					"electronicComponents": 5
				}
			}
		}
	},
	"Sniper Survivor": {
		"name": "Sniper Survivor",
		"description": "A skilled marksman providing long-range support against zombies. Equipped with a sniper rifle.",
		"stats": {
			"health": 3,
			"attackDamage": 2,
			"defense": 1,
			"cooldown": 2,
			"movementSpeed": 1,
			"attackRange": 10
		},
		"specialAbility": "Precision Shot - Deals double damage to a single target once per turn (Cooldown: 2 turns).",
		"diceRequired": {
			"attackDice": 2,
			"defenseDice": 0,
			"supportDice": 1
		},
		"upgrades": {
			"Tier 2 (Veteran Sniper Survivor)": {
				"bonuses": {
					"health": 4,
					"attackDamage": 3
				},
				"costs": {
					"scrapMetal": 10,
					"ammunition": 5
				}
			},
			"Tier 3 (Elite Sniper Survivor)": {
				"bonuses": {
					"health": 5,
					"attackDamage": 4,
					"cooldown": -1
				},
				"costs": {
					"scrapMetal": 20,
					"ammunition": 10,
					"electronicComponents": 5
				}
			}
		}
	},
	"Medic Survivor": {
		"name": "Medic Survivor",
		"description": "Provides healing support to other units. Equipped with a melee weapon.",
		"stats": {
			"health": 2,
			"attackDamage": 1,
			"defense": 0,
			"cooldown": 2,
			"movementSpeed": 2,
			"attackRange": 1
		},
		"specialAbility": "Medical Aid - Heals 2 health to adjacent survivors once per turn (Cooldown: 2 turns).",
		"diceRequired": {
			"attackDice": 0,
			"defenseDice": 0,
			"supportDice": 2
		},
		"upgrades": {
			"Tier 2 (Veteran Medic Survivor)": {
				"bonuses": {
					"health": 3,
					"cooldown": -1
				},
				"costs": {
					"scrapMetal": 10,
					"medicalSupplies": 5
				}
			},
			"Tier 3 (Elite Medic Survivor)": {
				"bonuses": {
					"health": 4,
					"cooldown": -2
				},
				"costs": {
					"scrapMetal": 20,
					"medicalSupplies": 10,
					"electronicComponents": 5
				}
			}
		}
	},
	"Engineer": {
		"name": "Engineer",
		"description": "Repairs and fortifies defenses. Equipped with a shotgun.",
		"stats": {
			"health": 2,
			"attackDamage": 3,
			"defense": 0,
			"cooldown": 2,
			"movementSpeed": 2,
			"attackRange": 5
		},
		"specialAbility": "Structural Reinforcement - Repairs and strengthens nearby defenses (Cooldown: 2 turns).",
		"diceRequired": {
			"attackDice": 1,
			"defenseDice": 1,
			"supportDice": 1
		},
		"upgrades": {
			"Tier 2 (Veteran Engineer)": {
				"bonuses": {
					"health": 3,
					"cooldown": -1
				},
				"costs": {
					"scrapMetal": 10,
					"tools": 5
				}
			},
			"Tier 3 (Elite Engineer)": {
				"bonuses": {
					"health": 4,
					"cooldown": -2
				},
				"costs": {
					"scrapMetal": 20,
					"tools": 10,
					"electronicComponents": 5
				}
			}
		}
	},
	"Field Medic": {
		"name": "Field Medic",
		"description": "Provides advanced healing support to other units. Equipped with a melee weapon.",
		"stats": {
			"health": 3,
			"attackDamage": 1,
			"defense": 0,
			"cooldown": 2,
			"movementSpeed": 2,
			"attackRange": 1
		},
		"specialAbility": "Advanced Medical Aid - Heals 3 health to adjacent survivors once per turn (Cooldown: 2 turns).",
		"diceRequired": {
			"attackDice": 0,
			"defenseDice": 0,
			"supportDice": 2
		},
		"upgrades": {
			"Tier 2 (Veteran Field Medic)": {
				"bonuses": {
					"health": 4,
					"cooldown": -1
				},
				"costs": {
					"scrapMetal": 10,
					"medicalSupplies": 5
				}
			},
			"Tier 3 (Elite Field Medic)": {
				"bonuses": {
					"health": 5,
					"cooldown": -2
				},
				"costs": {
					"scrapMetal": 20,
					"medicalSupplies": 10,
					"electronicComponents": 5
				}
			}
		}
	}
}

var zombie: Dictionary = {
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
		"name": "Wooden Barricade",
		"description": "Blocks incoming damage from zombies.",
		"defense": 3,
		"diceRequired": {
			"defenseDice": 1
		},
		"upgrades": {
			"Tier 2": {
				"defense": 5,
				"costs": {
					"wood": 5
				}
			},
			"Tier 3": {
				"defense": 7,
				"costs": {
					"wood": 10
				}
			}
		}
	},
	"Steel Door": {
		"name": "Steel Door",
		"description": "Provides additional protection against zombie attacks.",
		"defense": 4,
		"diceRequired": {
			"defenseDice": 2
		},
		"upgrades": {
			"Tier 2": {
				"defense": 6,
				"costs": {
					"steel": 5
				}
			},
			"Tier 3": {
				"defense": 8,
				"costs": {
					"steel": 10
				}
			}
		}
	},
	"Reinforced Fence": {
		"name": "Reinforced Fence",
		"description": "Increases the durability of the safe house perimeter.",
		"defense": 3,
		"diceRequired": {
			"defenseDice": 1,
			"supportDice": 1
		},
		"upgrades": {
			"Tier 2": {
				"defense": 5,
				"costs": {
					"wood": 5,
					"steel": 5
				}
			},
			"Tier 3": {
				"defense": 7,
				"costs": {
					"wood": 10,
					"steel": 10
				}
			}
		}
	},
	"Spike Trap": {
		"name": "Spike Trap",
		"description": "Damages zombies that move through a specific area.",
		"damage": 2,
		"diceRequired": {
			"defenseDice": 1
		},
		"upgrades": {
			"Tier 2": {
				"damage": 3,
				"costs": {
					"scrapMetal": 5
				}
			},
			"Tier 3": {
				"damage": 4,
				"costs": {
					"scrapMetal": 10
				}
			}
		}
	},
	"Electric Fence": {
		"name": "Electric Fence",
		"description": "Electrifies the perimeter, damaging zombies on contact.",
		"damage": 3,
		"diceRequired": {
			"defenseDice": 2,
			"supportDice": 1
		},
		"upgrades": {
			"Tier 2": {
				"damage": 4,
				"costs": {
					"scrapMetal": 10,
					"electronics": 5
				}
			},
			"Tier 3": {
				"damage": 5,
				"costs": {
					"scrapMetal": 15,
					"electronics": 10
				}
			}
		}
	}
}

var support: Dictionary = {
	"First Aid Kit": {
		"name": "First Aid Kit",
		"description": "Heals a unit by 5 health points.",
		"effect": {
			"healing": 5
		},
		"duration": 1,
		"diceRequired": {
			"supportDice": 1
		},
	},
	"Adrenaline Shot": {
		"name": "Adrenaline Shot",
		"description": "Increases a unit's attack and movement speed by 1 for 2 turns.",
		"effect": {
			"attackDamage": 1,
			"movementSpeed": 1
		},
		"duration": 2,
		"diceRequired": {
			"supportDice": 1
		},
	},
	"Molotov Cocktail": {
		"name": "Molotov Cocktail",
		"description": "Deals 3 damage to all zombies in a targeted area and burns them for 1 additional damage per turn for 2 turns.",
		"effect": {
			"areaDamage": 3,
			"burnDamage": 1
		},
		"duration": 2,
		"diceRequired": {
			"attackDice": 1,
			"supportDice": 1
		},
	},
	"Barricade Repair": {
		"name": "Barricade Repair",
		"description": "Repairs a barricade, restoring 5 defense points.",
		"effect": {
			"defense": 5
		},
		"duration": 1,
		"diceRequired": {
			"supportDice": 1
		},
	},
	"Scout Drone": {
		"name": "Scout Drone",
		"description": "Reveals the next wave of zombies and provides a 1 defense boost to all units for 1 turn.",
		"effect": {
			"revealWave": true,
			"defense": 1
		},
		"duration": 1,
		"diceRequired": {
			"supportDice": 1
		},
	},
	"Explosive Trap": {
		"name": "Explosive Trap",
		"description": "Deals 5 damage to the first group of zombies that triggers it.",
		"effect": {
			"damage": 5
		},
		"duration": 3,
		"diceRequired": {
			"attackDice": 1,
			"defenseDice": 1
		},
	},
	"Rallying Cry": {
		"name": "Rallying Cry",
		"description": "Boosts the attack of all units by 1 for 1 turn.",
		"effect": {
			"attackDamage": 1
		},
		"duration": 1,
		"diceRequired": {
			"supportDice": 1
		},
	},
	"Smoke Bomb": {
		"name": "Smoke Bomb",
		"description": "Reduces the accuracy of zombies by 50% for 2 turns.",
		"effect": {
			"accuracyReduction": 50
		},
		"duration": 2,
		"diceRequired": {
			"defenseDice": 1
		},
	}
}

var default_deck = [
	# Units
	{"name": "Survivor Scout", "type": "unit"},
	{"name": "Survivor Scout", "type": "unit"},
	{"name": "Survivor Scout", "type": "unit"},
	{"name": "Sniper Survivor", "type": "unit"},
	{"name": "Sniper Survivor", "type": "unit"},
	{"name": "Sniper Survivor", "type": "unit"},
	{"name": "Sniper Survivor", "type": "unit"},
	{"name": "Medic Survivor", "type": "unit"},
	{"name": "Medic Survivor", "type": "unit"},
	{"name": "Medic Survivor", "type": "unit"},
	{"name": "Engineer", "type": "unit"},
	{"name": "Engineer", "type": "unit"},
	{"name": "Field Medic", "type": "unit"},
	{"name": "Field Medic", "type": "unit"},
	{"name": "Field Medic", "type": "unit"},
	
	# Buffs
	{"name": "Survival Training", "type": "buff"},
	{"name": "Survival Training", "type": "buff"},
	{"name": "Police Training", "type": "buff"},
	{"name": "Police Training", "type": "buff"},
	{"name": "Cardio Training", "type": "buff"},
	{"name": "Cardio Training", "type": "buff"},
	{"name": "Weapons Training", "type": "buff"},
	{"name": "Weapons Training", "type": "buff"},
	{"name": "First Aid Training", "type": "buff"},
	{"name": "First Aid Training", "type": "buff"},
	
	# Support
	{"name": "First Aid Kit", "type": "support"},
	{"name": "First Aid Kit", "type": "support"},
	{"name": "Adrenaline Shot", "type": "support"},
	{"name": "Adrenaline Shot", "type": "support"},
	{"name": "Molotov Cocktail", "type": "support"},
	{"name": "Molotov Cocktail", "type": "support"},
	{"name": "Barricade Repair", "type": "support"},
	{"name": "Barricade Repair", "type": "support"},
	{"name": "Explosive Trap", "type": "support"},
	{"name": "Explosive Trap", "type": "support"},
	
	# Defense
	{"name": "Wooden Barricade", "type": "defense"},
	{"name": "Wooden Barricade", "type": "defense"},
	{"name": "Steel Door", "type": "defense"},
	{"name": "Steel Door", "type": "defense"},
	{"name": "Reinforced Fence", "type": "defense"},
	{"name": "Electric Fence", "type": "defense"}
]
