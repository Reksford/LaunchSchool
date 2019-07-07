=begin
"!" in ruby is a Boolean negate making !true == false and !false == true
and is also commonly used in method names when the method mutates the
caller.
"?" just by itself is the start of a ternary operator "? :" but is useful
when used while naming methods that evalute to true or false.

!= means "does not equal"  Useful for checking that two things do not
equal each other.

putting ! infront of something, like a string, that evaluates to truthy
returns false

putting ! after a method name is a naming convention warning that the
method mutates the caller.

putting ? before something typically throws a syntax error

putting ? after something, like a method name, helps the readability of
the code making the method sound like a question awaiting a yes or no
answer

putting !! before something flips the the boolean twice so !!"Hi" == true
and !!nil == false
=end
