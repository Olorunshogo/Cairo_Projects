
// TESTS
mod my_tests;
mod tests_contract;

// The Anatomy of a Test Function
pub fn add(left: usize, right: usize) -> usize {
    left + right
}

#[derive(Drop)]
struct Rectangle {
    width: u64,
    height: u64,
}

#[generate_trait]
// trait RectangleTrait {
//     fn can_hold(self: @Rectangle, other: @Rectangle) -> bool;
// }

impl RectangleImpl of RectangleTrait {
    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool {
        *self.width < *other.width && *self.height > *other.height
    }
}

pub fn add_two(a: u32) -> u32 {
    a + 2
}

#[derive(Drop, Debug, PartialEq)]
struct MyStruct {
    var1: u8,
    var2: u8,
}

#[derive(Drop, Copy, Debug, PartialEq)]
struct Dice {
    number: u8,
}


impl DicePartialOrd of PartialOrd<Dice> {
    fn lt(lhs: Dice, rhs: Dice) -> bool {
        lhs.number < rhs.number
    }

    fn le(lhs: Dice, rhs: Dice) -> bool {
        lhs.number <= rhs.number
    }

    fn gt(lhs: Dice, rhs: Dice) -> bool {
        lhs.number > rhs.number
    }

    fn ge(lhs: Dice, rhs: Dice) -> bool {
        lhs.number >= rhs.number
    }
}

#[derive(Drop)]
struct Guess {
    value: u64,
}

// pub trait GuessTrait {
//     fn new(value: u64) -> Guess;
// }
#[generate_trait]
impl GuessImpl of GuessTrait {
    fn new(value: u64) -> Guess {
        if value < 1 || value > 100 {
            panic!("Guess must be >= 1 and <= 100");
        }
        Guess { value }
    }
}

#[generate_trait]
impl GuessImpl_2 of GuessTrait_2 {
    fn new(value: u64) -> Guess {
        if value < 1 {
            panic!("Guess must be >= 1");
        } else if value > 100 {
            panic!("Guess must be <= 100");
        }

        Guess { value }
    }
}

fn sum_n(n: usize) -> usize {
    let mut i = 0;
    let mut sum = 0;
    while i <= n {
        sum += i;
        i += 1;
    }
    sum
}

// //  Testing Private Functions
pub fn add_2(a: u32, b: u32) -> u32 {
    internal_adder(a, 2)
}

fn internal_adder(a: u32, b: u32) -> u32 {
    a + b
}

use tests_cairo::it_adds_two;


// Configuration (test)
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    #[ignore]
    fn exploration() {
        let result = 3 * 3;
        assert_eq!(result, 9); // This will pass
    }

    #[test]
    #[ignore]
    fn another_exploration() {
        let result = 3 * 3;
        assert_eq!(result, 49); // This will fail
    }

    // Checking Results with the `assert!` Macro
    #[test]
    #[ignore]
    fn larger_can_hold_smaller() {
        let larger = Rectangle { height: 7, width: 8 };
        let smaller = Rectangle { height: 1, width: 5 };

        assert!(larger.can_hold(@smaller), "Rectangle cannot hold");
    }

    #[test]
    #[ignore]
    fn smaller_cannot_hold_larger() {
        let larger = Rectangle { height: 7, width: 8 };
        let smaller = Rectangle { height: 1, width: 5 };

        assert!(!smaller.can_hold(@larger), "Rectangle cannot hold"); 
    }

    #[test]
    #[ignore]
    fn smaller_cannot_hold_larger_2() {
        let larger = Rectangle { height: 7, width: 8 };
        let smaller = Rectangle { height: 1, width: 5 };

        assert!(smaller.can_hold(@larger), "Rectangle cannot hold"); // This will fail
    }

    // Testing Equality and Comparisons with the `assert_xx!` Macros
    #[test]
    #[ignore]
    pub fn it_adds_two() {
        assert_eq!(4, add_two(2));
    }

    #[test]
    #[ignore]
    fn wrong_check() {
        assert_ne!(0, add_two(2));
    }

    #[cfg(test)]
    #[test]
    #[ignore]
    fn test_struct_equality_1() {
        let first = MyStruct { var1: 1, var2: 2 };
        let second = MyStruct { var1: 1, var2: 2 };
        let third = MyStruct { var1: 1, var2: 3 };

        assert_eq!(first, second);
        assert_eq!(first, second, "{:?},{:?} should be equal", first, second);
        assert_ne!(first, third);
        assert_ne!(first, third, "{:?},{:?} should not be equal", first, third);
    }

    #[cfg(test)]
    #[test]
    #[ignore]
    fn test_struct_equality_2() {
        let first_throw = Dice { number: 5 };
        let second_throw = Dice { number: 2 };
        let third_throw = Dice { number: 6 };
        let fourth_throw = Dice { number: 5 };

        assert_gt!(first_throw, second_throw);
        assert_ge!(first_throw, fourth_throw);
        assert_lt!(second_throw, third_throw);
        assert_le!(
            first_throw, fourth_throw, "{:?},{:?} should be lower or equal", first_throw, fourth_throw,
        );
    }

    // // Adding Custom Failure Messages
    // #[cfg(test)]
    // #[test]
    // fn it_adds_two_2() {
    //     assert_eq!(4, it_adds_two(2), "Expected {}, got add_two(2)={}", 4, add_two(2));
    // }

    #[test]
    #[ignore]
    #[should_panic(expected: "Guess must be <= 100")]
    fn greater_than_100() {
        GuessTrait::new(200);
    }

    #[test]
    #[ignore]
    fn add_two_and_two() {
        let result = 2 + 2;
        assert_eq!(result, 4);
    }

    #[test]
    #[ignore]
    fn add_three_and_two() {
        let result = 3 + 2;
        assert!(result == 5, "Result is not 5");
    }

    #[test]
    #[ignore]
    #[available_gas(2000000)]
    fn test_sum_n() {
        let result = sum_n(10);
        assert!(result == 55, "Result is not 55");
    }

    #[test]
    #[ignore]
    fn add() {
        assert_eq!(4, internal_adder(2, 2));
    }

    #[test]
    fn add_3() {
        assert_eq!(4, super::it_adds_two(2, 2));
    }

}



