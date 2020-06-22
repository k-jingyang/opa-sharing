package http.authz

default allow = false
default allow_howard_friends_enemies = false

allow { 
	input.method = "GET"
	input.path = [""]
	input.auth.principal.team[_] = "CARTEL"
}

# Allow anybody who treat HOWARD as enemy or friend
allow_howard_friends_enemies {
	allowed_relationships = { "enemies", "friends" }
	
	some i
	input.associates[i][_] = "HOWARD" 
	allowed_relationships[i]
}
