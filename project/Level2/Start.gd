extends "res://Base/State.gd"

func _ready():
    pass

func enter_state(from_state = null, message = null):
    level._set_message("[color=#445544][b]Primary Objective[/b]: Create a group of viruses to deploy the SQL Genome[/color]\n\nTo begin with, select all rats:\n\n[color=#1C9B1C]SELECT[/color] * FROM LabRats\n\nEach query will display results as data below.")

func finish_statement(sql, table, clause, row_count, max_rows):
    if clause == "select":
        if row_count == level.max_passports:
            pass
            #level._set_state("AddFiltering")
    elif clause in ["update", "delete", "insert"]:
        pass
        #level._set_state("Proficient")

func process_row(row, table, headings, clause):
    if clause == "select":
        pass
    if clause == "insert":
        pass
        #level._set_state("Failure", "We don't need any more criminals to deal with.")
    if clause == "update":
        pass
        #level._set_state("Failure", "What are you trying to do? Hide criminals?")
    if clause == "delete":
        pass