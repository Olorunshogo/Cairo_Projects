// Constants
// Constants are values that are bound to a name and are not allowed to change, but there are a few
// differences between constants and variables.
// Constants are always immutable.
// Cairo's naming convention for constants is to use all uppercase with underscores between words.
// Constants are only declared in the global scope
struct AnyStruct {
    a: u256,
    b: u32,
}

enum AnyEnum {
    A: felt252,
    B: (usize, u256),
}

const ONE_HOUR_IN_SECONDS: u32 = 3600;
const ONE_HOUR_IN_SECONDS_2: u32 = 60 * 60;
const STRUCT_INSTANCE: AnyStruct = AnyStruct { a: 0, b: 1 };
const ENUM_INSTANCE: AnyEnum = AnyEnum::A('any enum');
const BOOL_FIXED_SIZE_ARRAY: [bool; 2] = [true, false];


#[executable]
fn main() {
    // COMMON PROGRAMMING CONCEPTS

    // // // 2.1 Immutable variables
    // let mut x = 5;
    // // The value is immutable, the the variable isn't.
    // // The variable isn't redeclared so its type cannot change.
    // println!("The value of x is: {}", x);

    // x = 6;
    // println!("The value of x is: {}", x);

    // // // // Shadowing
    // let x = x + 1;
    // {
    //     let x = x * 2;
    //     println!("Inner scope x value is: {}", x);
    // }
    // println!("Outer scope x value is: {}", x);

    // let mut y: u64 = 2;
    // println!("The value of y is {} of type u64", y);

    // let y: felt252 = x.into(); // Converts x to a felt, type annotation is required.
    // println!("The value of y is {} of type felt252", y);

    // let y = 5_u8;
    // println!("THe value of y is: {}", y);

    // // // 2.2 Data Types
    // let y1: felt252 = 3;
    // println!("y1 felt252: {}", y1);
    // let y2: u32 = x.try_into().unwrap();
    // println!("y2 type u32: {}", y2);

    // // // Scalar Types
    // A scalar type has a single value and Cairo has three primary scalar types: felts, integers,
    // and booleans.

    // let sum = 5_u128 + 10_u128;
    // println!("Sum: {}", sum);
    // let difference = 95_u128 - 4_u128;
    // println!("Difference: {}", difference);
    // let product = 4_u128 * 30_u128;
    // println!("Product: {}", product);
    // let quotient = 56_u128 / 32_u128;
    // println!("Quotient: {}", quotient);
    // let quotient = 64_u128 / 32_u128;
    // println!("Quotient: {}", quotient);
    // let remainder = 43_u128 % 5_u128;
    // println!("Remainder: {}", remainder);
    // let tru = true;
    // println!("True: {}", tru);
    // let fals: bool = false;
    // println!("False: {}", fals);

    // let my_first_char = 'C';
    // println!("My first character is: : {}", my_first_char);
    // let my_first_char_in_hex = 0x43;
    // println!("My first character in hex: {}", my_first_char_in_hex);
    // let my_first_string = 'Hello World!';
    // println!("my first string: {}", my_first_string);

    // // // Compound Types
    // A tuple is a general way of grouping together a number of values with a variety of types into
    // one compound type.
    // Tuples have a fixed length: once declared, they cannot grow or shrink in size.

    // let tup = (500, 6, true);
    // let (x1, y1, z1) = tup; // Destructuring: breaking single tuple into 3 parts.
    // if y1 == 6 {
    //     println!("The value of x1 is: {} 6!", x1);
    //     println!("The value of y1 is: {} 6!", y1);
    //     println!("The value of z1 is: {} 6!", z1);
    // }

    // let (_x, _y): (felt252, felt252) = (2, 3);
    // let _arr1: [u64; 5] = [1, 2, 3, 4, 5];
    // let _months = [
    //     'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
    //     'September', 'October', 'November', 'December',
    // ];
    // // println!("The value of months is: {}", months);

    // // let _my_array1: [u32; 5] = [1, 2, 3, 4, 5];
    // let my_array1 = [1, 2, 3, 4, 5];
    // let my_span = my_array1.span();

    // // If we plan to repeatesly access the array, then it makes sense to call `.span()` only once
    // and keep it available throughout the process.
    // println!("my_span[2]: {}", my_span[2]);

    // // // Type Conversion
    // Cairo addresses conversion between types by using the `try_into` and `into` methods provided
    // by the `TryInto` and `Into` traits from the core library.

    // let my_u8: u8 = 10;
    // let my_u16: u16 = my_u8.into();
    // let my_u32: u32 = my_u16.into();
    // let my_u64: u64 = my_u32.into();
    // let _my_128: u128 = my_u64.into();

    // let my_felt252 = 10;

    // // As a felt252 is smaller than a u256
    // let my_u256: u256 = my_felt252.into();
    // let my_other_felt252: felt252 = my_u8.into();
    // let my_third_felt252: felt252 = my_u16.into();

    // // 2.3 FUNCTIONS

    // The lines execute in the order they appear in the main function
    // println!("Topic - FUNCTIONS: Print Hello, World!");
    // //another_function();

    // // // // Parameters/Arguments
    // another_function(5);
    // // In function signatures, you must declare the type of each parameter.
    // // The compiler almost never need you to use them elsewhere in the code to know what type you
    // mean and it also helps to give meaningful error messages if it knows what types the function
    // expects.
    // print_labeled_measurement(5, "h");

    // // // Named Parameters
    // let first_arg = 3;
    // let second_arg = 4;
    // foo(x: first_arg, y: second_arg) {
    //     return z = x * y;
    //     println!("The value of z is: {}", z);
    // }

    // // // Statements and Expressions
    // Statements are instructions that perform some action and do not return a value.
    // Expressions evaluate to a resultant value. Let's look at some examples.

    // let _y =  6; // Statement
    // let y = {
    //     let x = 3;
    //     x + 1
    // };
    // println!("The value of y is: {}", y);

    // // // // Function with return variables
    // let x = five();
    // println!("The value of x is: {}", x);

    // let x = plus_one(5);
    // println!("The value of x is: {}", x);

    // // 2.4 Comments

    // So we're doing something complicated here, long enough that we need multiple lines of comment
    // to do it!
    // Hopefully, this comment will explain what's going on.

    // Item-level Documentation
    // It refers to specific items such as function, implementations, traits etc.
    // They are prefixed with three slashes (`///`).
    // The comments provide a detailed description of the item, example of usage, and any conditions
    // that might cause a panic.
    // In case of cunctions, the comments may also include separate sections for parameter and
    // return value descriptions.

    /// Returns the sum of `arg1` and `arg2`
    /// `arg1` cannot be zero.
    ///
    /// # Panics
    ///
    /// This function will panic if `arg1` is `0`.
    ///
    /// # examples
    ///
    /// ```
    /// let a: felt252 = 2;
    /// let b: felt25 = 3;
    /// let c: felt252 = add (a, b);
    /// assert!(c == a + b, "Should equal a + b");
    /// ```

    // fn add(arg1: felt252, arg2: felt252) -> felt252 {
    //     assert!(arg1 != 0, "Cannot be zero");
    //     arg1 + arg2
    // }

    // // // Module Documentation

    //! # my_module and implementation
    //!
    //! This is an example description of my_module and some of its features.
    //!
    //! # Examples
    //!
    //! ```
    //! mod my_other_module {
    //!   use path::to::my_module;
    //!
    //!   fn foo() {
    //!     my_module.bar();
    //!   }
    //! }
    //! ```
    // mod my_module { // rest of implementation...
    // }

    // // 2.5 Control Flow
    // The ability to run some code depending on whether a condition is true and to run some code
    // repeatedly while a condition is true are basic building blocks in most programming languages.
    // The most common constructs that let you control the flow of execution of Cairo code are if
    // expressions and loops

    // // // if Expressions
    let if_number1 = 5;

    if if_number1 == 5 {
        println!("Condition was true and if_number = {}", if_number1);
    } else {
        println!("Condition was false and if_number = {}", if_number1);
    }

    let if_number2 = 3;

    if if_number2 == 12 {
        println!("Number is: {}", if_number2);
    } else if if_number2 == 3 {
        println!("Number is: {}", if_number2);
    } else if if_number2 - 2 == 1 {
        println!("Number minus 2 is: {}", if_number2);
    } else {
        println!("Number not found but, this is it: {}", if_number2);
    }

    let mut i: usize = 0;
    loop {
        if i > 10 {
            break;
        }
        if i == 5 {
            i += 1;
            continue;
        }
        println!("i = {}. Print it again.", i);
        i += 1;
    }

    let mut counter = 0;

    let result = loop {
        if counter == 10 {
            break counter * 2;
        }
        counter += 1;
    };
    println!("The result is {}", result);

    let mut while_number = 3;
    while while_number != 0 {
        println!("{while_number}. ");
        while_number -= 1;

        println!("LIFTOFF!!!");
    }

    let while_a = [10,20,30,40,50].span();
    let mut index = 0;

    while index < 5 {
        println!("The value is: {}", while_a[index]);
        index += 1;
    }

    // This is a safer and error free approach
    for element in while_a {
        println!("The value is: {element}");
    }

    for number in 1..4_u8 {
        println!("{number}");
    }
    println!("Go");
}
// fn another_function(x: felt252) {
//     println!("Topic: FUNCTIONS - Another function.");
//     println!("The value of x is: {}", x);
// }

// fn print_labeled_measurement(value: u128, unit_label: ByteArray) {
//     println!("The measurement is: {value}{unit_label}");
// }

// fn five() -> u32 {
//     5
// }

// fn plus_one(x: u32) -> u32 {
//     x + 1
// }


