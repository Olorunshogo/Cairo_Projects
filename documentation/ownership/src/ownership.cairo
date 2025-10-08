

// use core::dict::Felt252Dict;

fn foo(mut arr: Array<u128>) {
    // arr.pop_front();
}

#[derive(Copy, Drop)] // This is basically enabling the garbage collection on the struct and permitting it to be copied and dropped/moved.
struct Point {
    x: u128,
    y: u128,
}

// #[derive(Destruct)]
// struct A {
//     dict: Felt252Dict<u128>,
// }
#[derive(Drop)]
struct A {}

#[derive(Copy, Drop)]
struct Rectangle {
    height: u64,
    width: u64,
}

#[executable]
fn main() {
    println!("4.0 UNDERSTANDING OWNERSHIP");

    // // 4.1  Ownership Using a Linear Type System
    println!("4.1 - Ownership Using a Linear Type System");
    // Cairo uses a linear type system. 
    // In such a type system, any value (a basic type, a struct, an enum) must be used and must only be used once. 
    // 'Used' here means that the value is either destroyed or moved.

    // Destruction can happen in several ways:
        // a variable goes out of scope.
        // a struct is destructured.
        // explicit destruction using destruct().

    // Moving a value simply means passing the value to another function. 
    // When that happens, the variable referring to that value in the original scope is destroyed and can no longer be used, and a new variable is created to hold the same value.

    // `scope`` is not valid here, it's not yet declared.
    let scope: felt252 = 24;
    println!("The value of scope is: {}", scope);
    // do stuff with `scope`
    // This scope is now over, and `scope` is no longer valid.

    // Ownership
    // A value can be safely transferred to by many different variables (even if they're mutable variables), as the value itself is always immutable.
    // Variables however can be mutable, so the compiler must ensure that constant variables aren't accidentally modified by the programmer.
    // This makes it possible to talk about ownership of a variable: the owner is the code that can read (and write if mutable) the variable.

    // This means that variable (not values) follow similar rules to Rust values:
    // Each variable in Cairo has an owner.
    // There can only be one owner at a time.
    // When the owner goes out of scope, the variable is destroyed.

    let mut arr: Array<u128> = array![];
    arr.append(1);
    arr.append(2);
    foo(arr);

    let p1 = Point { x: 5, y: 10 };
    ownerFoo(p1);
    ownerFoo(p1);

    // A {
    //     dict: Default::default()
    // };

    // Copy Array Data with clone
    let arr1: Array<u128> = array![];
    let _arr2 = arr1.clone();

    let _a1 = gives_ownership();
    let a2 = A {};
    let _a2 = takes_and_gives_back(a2);

    let arr4: Array<u128> = array![];
    let (_arr5, _len) = calcualte_length(arr4);


    // // 4.2 References and Snapshots
    println!("4.2 References and Snapshots");

    // Cairo's ownership system prevents us from using a variable after we've moved it, protecting us from potentially writing twice to the same memory cell.
    // However, it's not very convenient. We can retain ownership of the variable in the calling function using snapshots.

    // In Cairo, a snapshot is an immutable view of a value at a certain point in the execution of a program.
    let mut rec = Rectangle { height: 3, width: 10 };
    let first_snapshot = @rec; // Take a snapshot of `rec` at this point in time
    rec.height = 5; // Mutate `rec` by changing its height
    let first_area = calculate_area(first_snapshot); // Calculate the area of the snapshot
    let second_area = calculate_area(@rec);

    println!("The area of the rectangle when the snapshot was taken is: {}", first_area);
    println!("The current area of the rectangle is: {}", second_area);

    let area = calculate_area(@rec);
    println!("The area of the rectangle is: {}", area);

    // But what happens if we try to modify something we're passing as a snapshot?
    let mut rec = Rectangle { height: 4, width: 10 };
    flip(ref rec);
    println!("Height: {}, Width: {}", rec.height, rec.width);
    
 

}

fn ownerFoo(p: Point) {
    println!("The value of p is: .");
}

fn gives_ownership() -> A {
    let some_a = A {};
    some_a
}

fn takes_and_gives_back(some_a: A) -> A {
    some_a
}

fn calcualte_length(arr: Array<u128>) -> (Array<u128>, usize) {
    let length = arr.len(); // len() returns the length of an array
    (arr, length)
}

fn calculate_area(rec: @Rectangle) -> u64 {
    *rec.height * *rec.width
}

fn flip(ref rec: Rectangle) {
    let temp = rec.height;
    rec.height = rec.width;
    rec.width = temp;
}