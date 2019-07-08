def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo)
# returns "no"
# since foo returns "yes" in bar(foo) param = "yes" the 
# ternary evaluates as false and returns "no"