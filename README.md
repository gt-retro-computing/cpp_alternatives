# Analysing Zig and Odin

## Why should I leave C++ behind
Coming from Java and C++ into Zig and Odin, it's fair to say that on the surface these languages don't have a very high learning curve if you have access to their documentation and are willing to rely on limited community support through github issues. 

Both languages try and fix the main issue with C++: so many features have been introduced each with their own edge cases and overheads that this combined with the fact that C++ has to be reverse compatible with C has lead to a language that can write seemingly beautiful code at times but if you havent read 10000s of pages of documentation and have not had 100s of hours testing and exploring the compiled output of your code, you will probably not have effective code. 

This is in no way saying that Odin and Zig do not require practice and knowledge to write good code. However both development teams have tried very hard to do 2 things:

1) have a simpler build tool rather than the C++ minimum 3 step build (preprocess, compile, link)
This is actually a lot more helpful as not only are the compile time constructs (replacing the need for C++'s preprocessor) much stronger and less "String based" thanin C/C++ (I would liken them more to Rust's macros than C's preprocessor directives), but also the fact that I don't get random linker errors for no reason. 

Case in point: I was in a flight while writing some test cases, and the reason the C++ tests don't print out the test names is because I could not figure out a linker issues with the "std" namespace. I had included the files I needed (iostream and string) for std::string and std::cout and the compiler had compiled the code, but the linker could not find a reference to std::string.c_str() which was weird. 

This is exactly why I enjoyed the build tools in zig and odin better - their error output is more comprehensible rather than some extreme optimization tool's outputs (with 10 different process calls from code I didnt write). For example, I had an output in zig that said "[4]i32 needs to be coerced with a & operator to be passed as a []i32 slice parameter". Armed with no wifi on my flight and just a very scanty documentation pdf of zig, I found out and confirmed the issue and the fix in 2 minutes:
I was declaring arrays as constants "[4]i32" (which indicates an array of length 4 and type i32) but I needed to pass them in as references to method into which I was passing this value as a parameter. This could be done with the reference operator "&". Everything I needed was right there. 

2) Less Side-effects, More safety:
Zig straight up panics when unsigned integers overflow/ underflow. Odin and Zig both pass in parameters as constants by default. These were 2 features that just stuck out towards how much both developers wanted more safety and less side-effects. 

Something that I saw on both documentations is that, in order to make a parameter non-constant, you will have to redeclare it as a local variable at no overhead. This is not something C++ offers, since the option of passing the parameter in as a constant is a programmer optional feature, however the fact that "redeclaring the variable has no overhead" is something that if you assumed in C++ you could be wrong. 

Even something as basic as how horrible types are in C++ (C++ storing booleans as ints behind the scene etc.) is fixed in zig and odin (infact its actually painful to convert from something like u32 to i32, something which I appreciate since I wouldnt think twice about the consequences of doing such a thing in C++)

Case in point: Operator overloading
Operator overloading completely destroys how readable code is. While I love how you can make your code a lot more "symbolic" rather than verbose (like using + instead of a .add() call on a custom type etc.), if someone is not aware of an operator being overloaded (such as assignment or move operations), they will not realize easily why their code is not working as intended. 

This is where "C++ features can have drastic side effects" takes place. Let us assume that someone overloads an "=" operator in C++ to deep copy a custom type instead of a default shallow copy. 

Some code like
```c++
void do_something(custom_type *a) {
    custom_type *b = a;
}
```

could add an insane amount of overhead through the deepcopy. Both zig and odin get rid of this by firstly not allowing operator overloading, and the guaranteeing that something like
```odin
do_something :: proc (a : custom_type) {
    b := a
}
```
has no overhead!


## So time to delete gcc?

Nope! These languages are by no means complete replacements! I do not think I will ever replace C++ 100%, atleast not with zig or odin. Both have small communities compared to C++ and although they do have bindings to C/C++ code, they do not have as extensive of a library as C++ would. They are relatively new as well. 

While both languages do seem to be going the right way, and I do prefer developing with zig and odin a lot, if I was asked to do a project I would still pick C++.

I love how zig has unit tests integrated into the language and build cycle and how odin gives me the same vibe as python, however I don't think I would migrate to either until I see big projects like a web browser or a game engine written as purely in these languages as possible. 

## But is C++ any good compared to them?
Yes! C++ still is a highly customizable (although sometimes bad as shown with operator overloading) development tool, and something that has even gone as far as reached embedded devices (A video related to another project in this VIP actually showed me how beautifully you can write minimal overhead code for embedded devices **IF** you know C++ inside out  "https://www.youtube.com/watch?v=zBkNBP00wJE").

Not to mention, I had to make drastic changes such as completely scrap generics in Odin since it isnt as intuitive as C++/ zig/ Java (I thought I was getting a generic typed array but I was instead getting an array of generic types which didnt make sense to me as I thought the type would somehow be abstracted/ erased after compiling). 

Infact, looking at benchmarks on "https://programming-language-benchmarks.vercel.app/", we can see that C++ still outperforms both odin and zig. This probably is becuase while zig and odin both are as low level as C++, they focus more on the safety aspect and cannot compete with the years of optimizations both C and C++ compilers have gained (infact, I am afraid that I believe its not possible to make any other compiler more optimized that C/C++).

## Conclusion
If I had to start with low level programming and got to Zig and Odin before C++, I would probably be better off. I would still have to learn C++ in the end due to it's prevalence, however, there are a lot of language constructs in C++ that I take for granted that I probably should not. Zig and Odin keep me safe fromo such mistakes (such as the underflow panic or parameters being immutable or no operator overloading), however when switching to C++ I would have probably questions these things as I got started, and therefore learned more about how things work under the hood. 

However, coming into zig and odin from C++ is not easy/ easier as a converse to the previous statement - it essentially means relearning all of the constructs I had learned in C++.

But a good indicator of how to measure how easy it can replace a language - all the code, while written beforehand till it compiled, as tested on a flight with no wifi and only access to very basic documentation. I was still able to get all tests done (barring linked lists since memory management came into the picture and some of my pointer logic turned out to be incorrect) without the internet, something which I don't think I would have been able to do with C++ simply becuase of how undecipherable compiler/ linker errors get or maybe becuase I might not even get a compiler error at all - just a segfault or some other logical issue that is not the easiest to debug. It seems like Zig and Odin catch/ try and account their best for all of these. 

I would 100% recommend someone try out Zig or Odin before they do C++ if they get daunted by low level programming (something which 9th grade me would appreciate because pointer arithmetic didnt make sense to him so C++ was unconquerable, and Java was a good safety).
