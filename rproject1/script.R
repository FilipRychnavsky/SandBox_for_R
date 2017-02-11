#type some demo functions here
f1 <- function(x) {
    x + 1
}

f2 <- function(x) { 
    f1(x + 1)
}

f2(42)