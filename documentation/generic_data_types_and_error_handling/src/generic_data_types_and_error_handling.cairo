
// fn largest(ref number_list: Array<u8>) {
//     let mut largest = number_list.pop_front().unwrap();

//     for number in number_list.span() {
//         if *number > largest {
//             largest = *number;
//         }
//     }
// }

// // Specify generic type T between the angulars
// fn largest_list<T, impl TDrop: Drop<T>>(l1: Array<T>, l2: Array<T>) -> Array<T> {
//     if l1.len() > l2.len() {
//         l1
//     } else {
//         l2
//     }
// }

// // The new `largest_list` function in its definition the requirement that whatever generic type is placed there, it must be droppable. This is what we call **TRAIT BOUNDS**.
// // The `main` function remains unchanged, the compiler is smart enough to deduce which concrete type is being used and if it implements the `Drop` trait.


// // Given a list of T get the smallest one
// // The PartialOrd trait implements comparison operations for T
// fn smallest_element<T, impl TPartialOrd: PartialOrd<T>, impl TCopy: Copy<T>, impl TDrop: Drop<T>>(list: @Array<T>,) -> T {
//     // THis represents the smallest element through the iteration
//     // Notice that we use the desnap (*) operator
//     let mut smallest = *list[0];

//     // The index we will use to move through the list
//     let mut index = 1;

//     // Iterate through the whole list storing the smallest
//     while index < list.len() {
//         if *list[index] < smallest {
//             smallest = *list[index]
//         }
//         index = index + 1;
//     } 

//     smallest
// }

// // fn smallest_element2<T, +PartialOrd<T>, +Copy<T>, +Drop<T>>(list: @Array<T>) -> T {

// // }

// // Structs
// #[derive(Drop)] 
// struct Wallet<T> {
//     balance: T,
// }
// // struct Wallet<T, U> {
// //     balance: T,
// //     address: U,
// // }

// // Enums
// enum Option<T> {
//     Some: T,
//     None,
// }

// enum Result<T, E> {
//     Ok: T,
//     Err: E,
// }

// // Generic Methods
// #[generate_trait]
// impl WalletImpl<T, +Copy<T>> of WalletTrait<T> {
//     fn balance(self: @Wallet<T>) -> T {
//         return *self.balance;
//     }
// }

// #[generate_trait]
// impl WalletReceiveImpl of WalletReceiveTrait {
//     fn receive(ref self: Wallet<u128>, value: u128) {
//         self.balance += value;
//     }
// }

// trait WalletMixTrait<T1, U1> {
//     fn mixup<T2, +Drop<T2>, U2, +Drop<U2>>(
//         self: Wallet<T1, U1>, other: Wallet<T2, U2>,
//     ) -> Wallet<T1, U2>;
// }

// pub trait Summary<T> {
//     fn summarize(self: @T) -> ByteArray;
// }

// #[derive(Drop)]
// pub struct NewsArticle {
//     pub headline: ByteArray,
//     pub location: ByteArray,
//     pub author: ByteArray,
//     pub content: ByteArray,
// }

// impl NewsArticleSummary of Summary<NewsArticle> {
//     fn summarize(self: @NewsArticle) -> ByteArray {
//         format!("{} by {} ({})", self.headline, self.author, self.location)
//     }
// }

// #[derive(Drop)]
// pub struct Tweet {
//     pub username: ByteArray,
//     pub content: ByteArray,
//     pub reply: bool,
//     pub retweet: bool,
// }

// impl TweetSummary of Summary<Tweet> {
//     fn summarize(self: @Tweet) -> ByteArray {
//         format!("{}: {}", self.username, self.content)
//     }
// }

// // use aggregator::{NewsArticle, Summary, Tweet};
// pub trait ShapeGeometry<T> {
//     fn boundary(slef: T) -> u64;
//     fn area(self: T) -> u64;
// }

// // mod rectangle {
//     // Importing ShapeGeometry is required to implement this trait for Rectangle
//     use super::ShapeGeometry;

//     #[derive(Copy, Drop)]
//     pub struct Rectangle {
//         pub height: u64,
//         pub width: u64,
//     }

//     // Implementation RectangleGeometry passes in <Rectangle>
//     // to implement the trait for that type
//     impl RectangleGeometry of ShapeGeometry<Rectangle> {
//         fn boundary(self: Rectangle) -> u64 {
//             2 * (self.height + self.width)
//         }
//         fn area(self: Rectangle) -> u64 {
//             self.height * self.width
//         }
//     }
// // }

// mod circle {
//     // Importing ShapeGeometry is required to implement this trait for Circle
//     use super::ShapeGeometry;

//     #[derive(Copy, Drop)]
//     pub struct Circle {
//         pub radius: u64,
//     }

//     // Implementation CircleGeometry passes in <Circle>
//     // to implement the imported trait for that type
//     impl CircleGeometry of ShapeGeometry<Circle> {
//         fn boundary(self: Circle) -> u64 {
//             (2 * 314 * self.radius) / 100
//         }
//         fn area(self: Circle) -> u64 {
//             (314 * self.radius * self.radius) / 100
//         }
//     }
// }

// // use circle::Circle;
// // use rectangle::Rectangle;



// 9.0 - Error Handling
//use core::panic_with_felt252;
// fn function_never_panic() -> felt252 nopanic {
//     42
// }
fn function_never_panic() {
    assert!(1 == 1, "what");
}

#[panic_with('value is 0', wrap_not_zero)]
fn wrap_if_not_zero(value: u128) -> Option<u128> {
    if value == 0 {
        None
    } else {
        Some(value)
    }
}

enum Result<T, E> {
    Ok: T,
    Err: E,
}

fn parse_u8(input: felt252) -> Result<u8, felt252> {
    let input_256: u256 = input.into();
    if input_256 < 256 {
        Result::Ok(input.try_into().unwrap());
        println!("{} is within rsnge of felt252.", input);
    } else {
        Result::Err('Invalid Integer');
        println!("{} is out of range of felt252.", input);

    }
}

fn mutate_byte(input: felt252) -> Result<u8, felt252> {
    let input_to_u8 = match parse_u8(input) {
        Result::Ok(num) => num,
        Result::Err(err) => { return Result::Err(err); },
    };
    let res = input_to_u8 - 1;
    Result::Ok(res)
    // let input_to_u8: u8 = parse_u8(input)?;
    // let res = input_to_u8 - 1;
    // Ok(res)
}


#[executable]
fn main() {

    // Chapter 8.0 - GENERIC DATA TYPES
    println!("8.0 - GENERIC DATA TYPES");

    // // 8.1 - Generic Data Types
    // println!("8.1 - Generic Data Types");

    // let mut number_list_1: Array<u8> = array![34, 50, 25, 100, 65];

    // let mut largest_1 = number_list_1.pop_front().unwrap();

    // for number_1 in number_list_1 {
    //     if number_1 > largest_1 {
    //         largest_1 = number_1;
    //     }
    // }
    // println!("The largest number 1 is {}", largest_1);

    // let mut number_list_2: Array<u8> = array![102, 34, 255, 89, 54, 2, 43, 8];
    // let mut largest_2 = number_list_2.pop_front().unwrap();

    // for number in number_list_2 {
    //     if number > largest_2 {
    //         largest_2 = number
    //     }
    // }

    // println!("The largest number 2 is {}", largest_2);

    
    // let mut number_list = array![34, 50, 25, 100, 65];

    // let result = largest(ref number_list);
    // // println!("The largest number is: {}", result);

    // // let mut number_list = array![102, 34, 255, 89, 54, 2, 43, 8];

    // // let result = largest(ref number_list);
    // // println!("The largest number is: {}", result);

    // let mut l1 = array![1, 2, 3];
    // let mut l2 = array![4, 5, 6, 7];
    // let l3 = largest_list(l1, l2);

    // let list: Array<u8> = array![5, 6, 7, 8];

    // let s = smallest_element(@list);
    // assert!(s == 3);

    // // let w = Wallet { balance: 3, address: 4 };
    // let mut w = Wallet { balance: 50 };
    // assert!(w.balance() == 50);

    // w.receive(100);
    // assert!(w.balance() == 150);


    // // 8.2 - Traits in Cairo
    // // A trait defines a set of methods that can be implemented by a type. These methods can be called on instances of the type when this trit is implemented.
    // // A trait combined with a generic type defines functionality a particular type has and can share with other types.
    // // We can use traits to define shared behaviour in an abstract way. We can use trait bounds to specify that a generic type can be any type that has a certain behaviour.

    // // Note: Traits are similar to a feature often called `Interfaces` in other languages, although with some differences.

    // let news = NewsArticle {
    //     headline: "Cairo has become the most popular language for developers",
    //     location: "Worldwide",
    //     author: "Cairo Digger",
    //     content: "Cairo is a new programming language for zero-knowledge proofs",
    // };
    // println!("New article available! {}", news.summarize());

    // let tweet = Tweet {
    //     username: "EliBenSasson",
    //     content: "Crypto is full of short-term maximizing projects. \n @Starknet and @StarkWareLtd are about long-term vision maximization.",
    //     reply: false,
    //     retweet: false,
    // }; // Tweet instantiation    
    // println!("New tweet! {}", tweet.summarize());

    // // let rect = Rectangle { height: 5, width: 7 };
    // // println!("Rectangle area: {}", ShapeGeometry::area(rect));
    // println!("Rectangle boundary: {}", ShapeGeometry::boundary(rect));

    // // let circ = Circle { radius: 5 };
    // // println!("Circle area: {}", ShapeGeometry::area(circ));
    // // println!("Circle boundary: {}", ShapeGeometry::boundary(circ));




    // 9.0 Error Handling
    println!("9.0 - ERROR HANDLING");
    let mut _error_data = array![2];
    // if true {
    //     panic(error_data);
    // }

    // panic_with_felt252(2);

    // Panic! macro
    if true {
        // The panic macro can be really helpful as there's no need to create an array and passing it as an argument like the `panic` function unlike the panic function.
        // It takes a string as a parameter
        // panic!("The error for panic! macro is not limited to 31 characters anymore");
        // panic!("2");
    }
    println!("This line isn't reached!");

    

    println!("This is the second line reached.");

    // nopanic Notation
    // nopanic notation can be used to indicate that a function will never panic.
    wrap_if_not_zero(0); // THis returns None
    wrap_not_zero(0); // This panics with 'value is 0'   

    let some_num = parse_u8(258);

    

}

// #[cfg(test)]
// mod tests {
//     use super::*;

//     #[test]
//     fn test_felt252_to_u8() {
//         let number: felt252 = 5;
//         // should not panic
//         let res = parse_u8(number).unwrap();
//     }

//     #[test]
//     #[should_panic] {
//         fn test_felt252_to_u8_panic() {
//             let number: felt252 = 256;
//             // should panic
//             let res = parse_u8(number).unwrap();
//         }
//     }
// }



