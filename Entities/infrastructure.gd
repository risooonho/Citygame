extends Node
class Road:
	var _done
	func init(xy):
		var x = xy[0]
		var y = xy[1]
		if !Global.Level._content[x][y].has("Road") and\
		!Global.Level._content[x][y].has("Trees") and\
		!Global.Level._content[x][y].has("River"):
			Global.Level._content[x][y].append("Road")
			update_road(x,y)
			var _s = [false,false,false,false]
			if x > 0:
				if Global.Level._content[x-1][y].has("Road"):
					_s[0] = true
			if y > 0:
				if Global.Level._content[x][y-1].has("Road"):
					_s[1] = true
			if x+1 < Global.Level._content.size():
				if Global.Level._content[x+1][y].has("Road"):
					_s[2] = true
			if x < Global.Level._content.size() and y+1 < Global.Level._content[x].size():
				if Global.Level._content[x][y+1].has("Road"):
					_s[3] = true
			if _s[0]:
				update_road(x-1,y)
			if _s[1]:
				update_road(x,y-1)
			if _s[2]:
				update_road(x+1,y)
			if _s[3]:
				update_road(x,y+1)
			_done = true

	func _ready():
		if _done:
			return(true)
		else:
			return(false)
	
	func update_road(x,y):
		var _s = [false,false,false,false]
		if x > 0:
			if Global.Level._content[x-1][y].has("Road"):
				_s[0] = true
		if y > 0:
			if Global.Level._content[x][y-1].has("Road"):
				_s[1] = true
		if x+1 < Global.Level._content.size():
			if Global.Level._content[x+1][y].has("Road"):
				_s[2] = true
		if x < Global.Level._content.size() and y+1 < Global.Level._content[x].size():
			if Global.Level._content[x][y+1].has("Road"):
				_s[3] = true
		LevelState.add_cell([[x,y,"Roads",6]])
		if _s[0] or _s[2]:
			LevelState.add_cell([[x,y,"Roads",0]])
		if _s[1] or _s[3]:
			LevelState.add_cell([[x,y,"Roads",1]])

		if (_s[0] and _s[1]):
			LevelState.add_cell([[x,y,"Roads",7]])
		if (_s[2] and _s[1]):
			LevelState.add_cell([[x,y,"Roads",12]])
		if (_s[0] and _s[3]):
			LevelState.add_cell([[x,y,"Roads",11]])
		if (_s[2] and _s[3]):
			LevelState.add_cell([[x,y,"Roads",9]])
	
		if _s[0] and _s[1] and _s[3] :
			LevelState.add_cell([[x,y,"Roads",2]])
		if _s[2] and _s[1] and _s[3]:
			LevelState.add_cell([[x,y,"Roads",3]])
		if _s[2] and _s[0] and _s[3]:
			LevelState.add_cell([[x,y,"Roads",4]])
		if _s[1] and _s[0] and _s[2]:
			LevelState.add_cell([[x,y,"Roads",5]])
		if _s[0] and _s[1] and _s[2] and _s[3]:
			LevelState.add_cell([[x,y,"Roads",6]])