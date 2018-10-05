
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

A: It prints 2. Because the initial value of "a" is 2, and the function "go" hasn't been called and run."a" still equals to 2 when "println" is printing.

B: It prints 0. Similar with question A, x's value is 0 before "println". Even there is a function used "x", the function "go" itself hasn't been used.

C: It prints 3. Because computer runs two steps before "println". It makes a new class "thing" and gives it a value "a=2". Then it runs function "go", which all 1 to "a". So "a" is 3 before it been printed. 
