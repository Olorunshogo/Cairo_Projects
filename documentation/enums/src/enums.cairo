

#[derive(Drop)]
enum Direction {
    North: u128,
    East: u128,
    South: u128,
    West: u128, // 4 Variants
}


#[derive(Drop)]
enum Message {
    Quit,
    Echo: felt252,
    Move: (u128, u128),
}

trait Processing {
    fn process(self: Message);
}

impl ProcessingImpl of Processing {
    fn process(self: Message) {
        match self {
            Message::Quit => { println!("Quiting") },
            Message::Echo(value) => { println!("Echoing {}", value) },
            Message::Move((x, y)) => { println!("Moving from {} to {}", x, y) },
        }
    }
}

enum Option<T> {
    Some: T,
    None,
}


// fn find_value_recursive(mut arr: Span<felt252>, value: felt252, index: usize) -> Option<usize> {
//     match arr.pop_front() {
//         Some(index_value) => { if (*index_value == value) {
//             return Some(index);
//         } },
//         None => { return None; },
//     }

//     find_value_recursive(arr, value, index + 1)
// }

// fn find_value_iterative(mut arr: Span<felt252>, value: felt252) -> Option<usize> {
//     for (idx, array_value) in arr.into_iter().enumerate() {
//         if (*array_value == value) {
//             return Some(idx);
//         }
//     }
//     None
// }

#[derive(Drop, Debug)]
enum UsState {
    Alabama,
    Alaska,
}

#[derive(Drop)]
enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter: UsState,
}

fn value_in_cents(coin: Coin) -> felt252 {
    match coin {
        Coin::Penny => {
            println!("Lucky penny!");
            1
        },
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter(state) => {
            println!("State quarter from {:?}!", state);
            25
        },
    }
}

#[derive(Drop)]
enum DayType {
    Week,
    Weekend,
    Holiday,
}

fn vending_machine_accept(coin: (DayType, Coin)) -> bool {
    match coin {
        // Coin::Dime | Coin::Quarter => true,
        // _ => false,
        (DayType::Week, _) => true,
        (_, Coin::Dime) | (_, Coin::Quarter) => true,
        (_, _) => false,
    }
}

fn vending_week_machine(c: (DayType, Coin)) -> bool {
    match c {
        (DayType::Week, Coin::Quarter) => true,
        _ => false,
    }
}

fn roll(value: u8) {
    match value {
        0 | 1 | 2 => println!("You won!"),
        3 => println!("You can roll again!"),
        _ => println!("You lost..."),
    }
}








#[executable]
fn main() {
    // I came in wuth compassion.
    // Why walk in if we can't believe God to do something glory?
    // I have not come here to simply pay a visit, I came here to rip the claws of Satan off this baby.
    // you give God an inch, he'll go a mile. One little nudge.
    
    // 6.0 ENUMS and PATTERN MAKING
    println!("6.0 - ENUMS and PATTERN MAKING");

    // 6.1 - Enums
    // Enums: enumerations - are a way to define a custom data type that consiss of a fixed set of named values, called variants.
    // Enums are useful for representing a collection of related values where each value is distinct and has a specific meaning.

    // 6.2 - The Match Control Flow Construct
    println!("6.2 - The Match Control Flow Construct");
    // let direction = Direction::North(10);
    // println!("The direction is: {}", direction);

    let msg: Message = Message::Quit;
    msg.process(); // Prints "quitting"

    // Cairo has an extremely powerful control flow construct called `match` that allows you to compare a value against a series of patterns and then execute code based on which pattern matches.
    value_in_cents(Coin::Quarter(UsState::Alaska));

    // 6.3 - Concise Control Flow with if let and while let
    println!("Concise Control Flow with if let and while let");
    let config_max = Some(5);
    // match config_max {
    //     Some(max) => println!("The maximum is configured to be: {}", max),
    //     _ => (),
    // }

    // if let
    if let Some(config_max) = config_max {
        println!("The maximum is configured to be: {}", config_max);
    }

    // while let
    let mut arr = array![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    let mut sum = 0;
    while let Some(value) = arr.pop_front() {
        sum += value;
    }
    println!("{}", sum);

    // Let Chains
    // Cairo supports let chains to combine multiple conditions involving `if let` or `while let` without nesting.
    // This lets you pattern-match and apply additional boolean conditions ina single expression:

    // Using a let chain to combine pattern matching and additional conditions
    // if let Some(x) = get_x() && x > 0 let Some(y) = get_y() && y > 0 {
    //     let sum: u32 = x + y;
    //     println!("Sum is: {}", sum);
    //     return;
    // }
    



    




}