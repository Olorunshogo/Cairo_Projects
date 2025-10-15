


pub fn main() -> felt252 {
    
    println!("Basic Cairo Code");
    return 42;

    // 11.0 - Functional Language Features: Iterators and Closures

    // 11.1 - Closures
    // They are anonymous functions you can save in a variable or pass as arguments to other functions.
    let double = |value| value * 2;
    println!("Double of 2 is {}", double(2_u8));
    println!("Double of 4 is {}", double(4_u8));

    // This won't work because `value` type has been inferred as `u8`.
    //println!("Double of 6 is {}", double(6_u16));

    let sum = |x: u32, y: u32, z: u16| {
        x + y + z.into()
    };
    println!("Result: {}", sum(1, 2, 3));





}