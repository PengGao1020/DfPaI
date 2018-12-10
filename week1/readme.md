
# Week 1

Do the exercises in:
* BouncingBalls
* gradient
* Grid

## What's printed and why?

### A

```processing

int a = 2;

void go() {
  a++;
}

void setup() {
  go();
  println(a);
}

```

### B

```processing
int x = 0;

void go(int x) {
  x++;
}

void setup() {
  go(x);
  println(x);
}
```

### C

*put your answer here*

```processing
class Thing {
  int a;
}

void go(Thing t) {
  t.a++;
}

void setup() {
  Thing thing = new Thing();
  thing.a = 2;
  
  go(thing);

  println(thing.a);
}
```
*put your answer here*

A: It prints 3. The "go" function runs before println and add 1 to the initial value of "a", so it prints 3.

B: It prints 0. The "go" function only uses the value of x, the int x in "go" just like a copy of real x, which in this case has a same name. The real value of x remains 0.

C: It prints 3. In this case, even t and thing have different name, them are actually same thing. It setup a new class Thing and run function "go" to add 1 to "a" in this class. So "a" is 3 before it is printed. 
