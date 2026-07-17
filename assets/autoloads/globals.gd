extends Node

const SAVE_ENCRYPTION_KEY = "youlostthegame"

var bought_weapons: Array = [
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	]

var bought_items: Array = []

var wi_container_hovered: int

func swap_weapons(slot: int, target_slot: int):
	var s1 = bought_weapons[slot]
	var s2 = bought_weapons[target_slot]
	
	bought_weapons[slot] = s2
	bought_weapons[target_slot] = s1

func no_weapons():
	var no = false
	for i in bought_weapons:
		if i == null:
			no = true
		else:
			no = false
			break
	return no

func give_weapon(data: WeaponData):
	for i in range(bought_weapons.size()):
		if bought_weapons[i] == null:
			bought_weapons[i] = data
			break
		else:
			continue

enum Rarities {COMMON = 100, RARE = 50, EPIC = 15, GODLIKE = 1}

var round: int = 1
var zone: int = 1

var rupies: BigNumber = BigNumber.new()
var global_weapon_price_mult: float = 1.0
var global_item_price_mult: float = 1.0

var current_weapon_pool = []

var formatter = Formatter.new()

var max_int: int = 9_223_372_036_854_775_807
var g = BigNumber.new()
var gp = BigNumber.new()
var gdp = BigNumber.new()
var gtp = BigNumber.new()
var gqp = BigNumber.new()
var gqip = BigNumber.new()
var gsxp = BigNumber.new()
var gspp = BigNumber.new()
var gocp = BigNumber.new()
var gnop = BigNumber.new()
var gdep = BigNumber.new()
var gudep = BigNumber.new()
var gddep = BigNumber.new()
var gtdep = BigNumber.new()
var gqdep = BigNumber.new()
var gqidep = BigNumber.new()
var gsxdep = BigNumber.new()

func chance(percentage: int):
	if randi_range(1, 100) <= percentage:
		return true
	else:
		return false

func get_percentage(value: float, per: float):
	return value * (per / 100)

## Loads a JSON file into a dictionary and returns it. If the file doesn't exsist, it returns null.
func load_json(file_path: String):
	var path = file_path
	var data = {}
	
	if not FileAccess.file_exists(path):
		print("ERROR: File doesn't exsist.")
		return null
	
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.new()
		var error = json.parse(json_string)
		
		if error == OK:
			var loaded_data = json.get_data()
			if typeof(loaded_data) == TYPE_DICTIONARY:
				for key in data.keys():
					if not loaded_data.has(key):
						loaded_data[key] = data[key]
				data = loaded_data
			else:
				print("ERROR: File doesn't contain a valid dictionary.")
		else:
			print("ERROR: Couldn't parse JSON file.")
		
		return data

## Saves a dictionary into a JSON file.
func save_json(data: Dictionary, file_path: String):
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	if file:
		var json_string = JSON.stringify(data, "  ")
		file.store_string(json_string)
		file.close()
		print("Saved in " + file_path)
	else:
		print("ERROR: Couldn't save data.")

## Saves a dictionary into an encrypted JSON file.
func save_encrypted_json(data: Dictionary, file_path: String, password: String) -> bool:
	var file := FileAccess.open_encrypted_with_pass(file_path, FileAccess.WRITE, password)
	
	if file == null:
		print("ERROR: Couldn't create encrypted file.")
		return false
	
	file.store_string(JSON.stringify(data))
	file.close()
	
	return true

## Loads an encrypted JSON file into a dictionary and returns it. If the file doesn't exsist, it returns null.
func load_encrypted_json(file_path: String, password: String) -> Dictionary:
	var data := {}
	
	if not FileAccess.file_exists(file_path):
		print("ERROR: File doesn't exist.")
		return {}
	
	var file := FileAccess.open_encrypted_with_pass(file_path, FileAccess.READ, password)
	
	if file == null:
		print("ERROR: Couldn't open encrypted file.")
		return {}
	
	var json_string := file.get_as_text()
	file.close()
	
	var json := JSON.new()
	var error := json.parse(json_string)
	
	if error != OK:
		print("ERROR: Couldn't parse JSON file.")
		return {}
	
	var loaded_data = json.get_data()
	
	if typeof(loaded_data) != TYPE_DICTIONARY:
		print("ERROR: File doesn't contain a valid dictionary.")
		return {}
	
	return loaded_data

## Deletes a file inside given directory.
func delete_file(directory: String, file_name: String):
	var dir = DirAccess.open(directory)
	
	var path = directory + "/" + file_name
	
	if FileAccess.file_exists(path):
		dir.remove(file_name)

func _ready() -> void:
	g.mantissa = 10
	g.exponent = 100
	
	rupies.plus_equals(9999)
	
	for i in range(10):
		gp.multiply_equals(g)
	
	for i in range(10):
		gdp.multiply_equals(gp)
	
	for i in range(10):
		gtp.multiply_equals(gdp)
	
	for i in range(10):
		gqp.multiply_equals(gtp)
	
	for i in range(10):
		gqip.multiply_equals(gqp)
	
	for i in range(10):
		gsxp.multiply_equals(gqip)
	
	for i in range(10):
		gspp.multiply_equals(gsxp)
	
	for i in range(10):
		gocp.multiply_equals(gspp)
	
	for i in range(10):
		gnop.multiply_equals(gocp)
	
	for i in range(10):
		gdep.multiply_equals(gnop)
	
	for i in range(10):
		gudep.multiply_equals(gdep)
	
	for i in range(10):
		gddep.multiply_equals(gudep)
	
	for i in range(10):
		gtdep.multiply_equals(gddep)
	
	for i in range(10):
		gqdep.multiply_equals(gtdep)
	
	for i in range(10):
		gqidep.multiply_equals(gqdep)
	
	for i in range(10):
		gsxdep.multiply_equals(gqidep)

func format(value: BigNumber):
	if value.to_float() < 1_000_000_000_000.0:
		return str(formatter.format(int(value.to_float())))
	else:
		if value.to_float() >= 1_000_000_000_000.0 and value.to_float() < 999_999_999_999_999.0:
			return value.to_prefix() + "T"
		elif value.to_float() >= 1_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999.0:
			return value.to_prefix() + "Qa"
		elif value.to_float() >= 1_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999.0:
			return value.to_prefix() + "Qi"
		elif value.to_float() >= 1_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "Sx"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "Sp"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "Oc"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "No"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "De"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "UnDe"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "DoDe"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "TrDe"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "QaDe"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "QiDe"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "SxDe"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "SpDe"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "OcDe"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "NoDe"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "Vi"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "UnVi"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "DoVi"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "TrVi"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "QaVi"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "QiVi"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "SxVi"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "SpVi"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "OcVi"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "NoVi"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "Ti"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "UnTi"
		elif value.to_float() >= 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000.0 and value.to_float() < 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_prefix() + "DoTi"
	
	if value.is_greater_than_or_equal_to(g) and value.is_less_than(gp):
		return "Googol"
	elif value.is_greater_than_or_equal_to(gp) and value.is_less_than(gdp):
		return "Googolplex"
	elif value.is_greater_than_or_equal_to(gdp) and value.is_less_than(gtp):
		return "Googolduplex"
	elif value.is_greater_than_or_equal_to(gtp) and value.is_less_than(gqp):
		return "Googoltriplex"
	elif value.is_greater_than_or_equal_to(gqp) and value.is_less_than(gqip):
		return "Googolquadruplex"
	elif value.is_greater_than_or_equal_to(gqip) and value.is_less_than(gsxp):
		return "Googolquinquetuplex"
	elif value.is_greater_than_or_equal_to(gsxp) and value.is_less_than(gspp):
		return "Googolsexatuplex"
	elif value.is_greater_than_or_equal_to(gspp) and value.is_less_than(gocp):
		return "Googolseptemtuplex"
	elif value.is_greater_than_or_equal_to(gocp) and value.is_less_than(gnop):
		return "Googoloctoplex"
	elif value.is_greater_than_or_equal_to(gnop) and value.is_less_than(gdep):
		return "Googolnovemtuplex"
	elif value.is_greater_than_or_equal_to(gdep) and value.is_less_than(gudep):
		return "Googoldecemtuplex"
	elif value.is_greater_than_or_equal_to(gudep) and value.is_less_than(gddep):
		return "Googolundectuplex"
	elif value.is_greater_than_or_equal_to(gddep) and value.is_less_than(gtdep):
		return "Googolduodectuplex"
	elif value.is_greater_than_or_equal_to(gtdep) and value.is_less_than(gqdep):
		return "Googoltredectuplex"
	elif value.is_greater_than_or_equal_to(gqdep) and value.is_less_than(gqidep):
		return "Googolquattuordectuplex"
	elif value.is_greater_than_or_equal_to(gqidep) and value.is_less_than(gsxdep):
		return "Googolquinquadectuplex"
	elif value.is_greater_than_or_equal_to(gsxdep):
		return "Googolsexdectuplex"
