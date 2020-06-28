package demo.authz

default allow = false
default allow_howard_friends_enemies = false

# This is a policy, you have to tell OPA the specific policy
# when querying OPA 
allow { 
	input.method = "GET"
	input.path = [""]
	input.auth.principal.team[_] = "CARTEL"
}

# Allow anybody who treats HOWARD as enemy or friend
allow_howard_friends_enemies {
	allowed_relationships = { "enemies", "friends" }
	
	some i
	input.associates[i][_] = "HOWARD" 
	allowed_relationships[i]
}
