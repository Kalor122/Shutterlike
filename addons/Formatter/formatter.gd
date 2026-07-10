extends Node

class_name Formatter

func format(n: int) -> String:
	var s = str(n)
	var result = ""
	while s.length() > 3:
		result = "," + s.substr(s.length() - 3, 3) + result
		s = s.substr(0, s.length() - 3)
	return s + result
