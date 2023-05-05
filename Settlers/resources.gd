class_name Resources extends Node

var resources_dict: Dictionary = {"wood": 0, "wool": 1, "hey": 2, "clay": 3, "stone": 4}

func word2num(res: String) -> int:
	return resources_dict[res]

func num2word(num: int) -> String:
	return resources_dict.find_key(num)
