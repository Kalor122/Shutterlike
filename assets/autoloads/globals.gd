extends Node

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
var inf = BigNumber.new()

func chance(percentage: int):
	if randi_range(1, 100) <= percentage:
		return true
	else:
		return false

func _ready() -> void:
	g.mantissa = 10
	g.exponent = 100
	
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
	
	for i in range(999):
		inf.multiply_equals(gnop)

func format(value: BigNumber):
	if value.is_greater_than_or_equal_to(gnop):
		return "Googolnoventuplex"
	
	if value.is_greater_than_or_equal_to(gocp):
		return "Googoloctoplex"
	
	if value.is_greater_than_or_equal_to(gspp):
		return "Googolseptuplex"
	
	if value.is_greater_than_or_equal_to(gsxp):
		return "Googolsextuplex"
	
	if value.is_greater_than_or_equal_to(gqip):
		return "Googolquintuplex"
	
	if value.is_greater_than_or_equal_to(gqp):
		return "Googolquadruplex"
	
	if value.is_greater_than_or_equal_to(gtp):
		return "Googoltriplex"
	
	if value.is_greater_than_or_equal_to(gdp):
		return "Googolduplex"
	
	if value.is_greater_than_or_equal_to(gp):
		return "Googolplex"
	
	if value.is_greater_than_or_equal_to(g):
		return "Googol"
	
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
		elif value.to_float() > 999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999_999.0:
			return value.to_scientific()
