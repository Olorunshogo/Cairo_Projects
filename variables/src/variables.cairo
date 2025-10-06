
// Constants
// Constants are values that are bound to a name and are not allowed to change, but there are a few differences between constants and variables.
// Constants are always immutable.
// Cairo's naming convention for constants is to use all uppercase with underscores between words.
// Constants are only declared in the global scope
struct AnyStruct {
    a: u256,
    b: u32,
}

enum AnyEnum {
    A: felt252,
    B: (usize, u256)
}

const ONE_HOUR_IN_SECONDS: u32 = 3600;
const ONE_HOUR_IN_SECONDS_2: u32 = 60 * 60;
const STRUCT_INSTANCE: AnyStruct = AnyStruct { a: 0, b: 1 };
const ENUM_INSTANCE: AnyEnum = AnyEnum::A('any enum');
const BOOL_FIXED_SIZE_ARRAY: [bool; 2] = [true, false];




#[executable]
fn main() {

    // Immutable variables
    let mut x = 5;
    // The value is immutable, the the variable isn't.
    // The variable isn't redeclared so its type cannot change.
    println!("The value of x is: {}", x);

    x = 6;
    println!("The value of x is: {}", x);

    // Shadowing
    let x = x + 1;
    {
        let x = x * 2;
        println!("Inner scope x value is: {}", x);
    }
    println!("Outer scope x value is: {}", x);

    let mut y: u64 = 2;
    println!("The value of y is {} of type u64", y);

    let y: felt252 = x.into(); // Converts x to a felt, type annotation is required.
    println!("The value of y is {} of type felt252", y);

    let y = 5_u8;
    println!("THe value of y is: {}", y);
    
    // Data Types
    let y1: felt252 = 3;
    println!("y1 felt252: {}", y1);
    let y2: u32 = x.try_into().unwrap();
    println!("y2 type u32: {}", y2);

    // Scalar Types
    // A scalar type has a single value and Cairo has three primary scalar types: felts, integers, and booleans.

    let sum = 5_u128 + 10_u128;
    println!("Sum: {}", sum);
    let difference = 95_u128 - 4_u128;
    println!("Difference: {}", difference);
    let product = 4_u128 * 30_u128;
    println!("Product: {}", product);
    let quotient = 56_u128 / 32_u128;
    println!("Quotient: {}", quotient);
    let quotient = 64_u128 / 32_u128;
    println!("Quotient: {}", quotient);
    let remainder = 43_u128 % 5_u128;
    println!("Remainder: {}", remainder);
    let tru = true;
    println!("True: {}", tru);
    let fals: bool = false;
    println!("False: {}", fals);

    let my_first_char = 'C';
    println!("My first character is: : {}", my_first_char);
    let my_first_char_in_hex = 0x43;
    println!("My first character in hex: {}", my_first_char_in_hex);
    let my_first_string = 'Hello World!';
    println!("my first string: {}", my_first_string);



    // Compound Types
    // A tuple is a general way of grouping together a number of values with a variety of types into one compound type.
    // Tuples have a fixed length: once declared, they cannot grow or shrink in size.

    let tup = (500, 6, true);
    let (x1, y1, z1) = tup; // Destructuring: breaking single tuple into 3 parts.
    if y1 == 6 {
        println!("The value of x1 is: {} 6!", x1);
        println!("The value of y1 is: {} 6!", y1);
        println!("The value of z1 is: {} 6!", z1);
    }

    let (_x, _y): (felt252, felt252) = (2, 3);
    let _arr1: [u64; 5] = [1, 2, 3, 4, 5];
    let _months = [
        'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
        'September', 'October', 'November', 'December',
    ];
    //println!("The value of months is: {}", months);

    // let _my_array1: [u32; 5] = [1, 2, 3, 4, 5];
    let my_array1 = [1, 2, 3, 4, 5];
    let my_span = my_array1.span();

    // If we plan to repeatesly access the array, then it makes sense to call `.span()` only once and keep it available throughout the process.
    println!("my_span[2]: {}", my_span[2]);

    // Type Conversion
    // Cairo addresses conversion between types by using the `try_into` and `into` methods provided by the `TryInto` and `Into` traits from the core library.

    let my_u8: u8 = 10;
    let my_u16: u16 = my_u8.into();
    let my_u32: u32 = my_u16.into();
    let my_u64: u64 = my_u32.into();
    let _my_128: u128 = my_u64.into();

    let my_felt252 = 10;

    // As a felt252 is smaller than a u256
    let my_u256: u256 = my_felt252.into();
    let my_other_felt252: felt252 = my_u8.into();
    let my_third_felt252: felt252 = my_u16.into();





}

