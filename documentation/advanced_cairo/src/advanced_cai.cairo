
// use starknet::storage::Felt252Dict;

// struct UserDatabase<T> {
//     users_updates: u64,
//     balances: Felt252Dict<T>,
// }

// trait UserDatabaseTrait<T> {
//     fn new() -> UserDatabase<T>;
//     fn update_user<+Drop<T>>(ref self: UserDatabase<T>, name: felt252, balance: T);
//     fn get_balance<+Copy<T>>(ref self: UserDatabase<T>, name: felt252) -> T;
// }

// impl UserDatabaseImpl of UserDatabaseTrait {
//     // Creates a database
//     fn new() -> UserDatabase<T> {
//         UserDatabase { users_updates: 0, balances: Default::default() }
//     }

//     // Add a user
//     fn update_user(ref self: UserDatabase, name: felt252, balance: felt252) {
//         self.balances.insert(name, balance);
//         self.users_updates += 1;
//     }

//     // Get the user's balance
//     fn get_balance<+Copy<T>>(ref self: UserDatabase, name: felt252) -> T {
//         self.balances.get(name)
//     }
// }

// Impl UserDatabaseDestruct<T, +Drop<T>, +Felt252DictValue<T>> of Destruct<UserDatabase<T>> {
//     fn destruct(self: UserDatabase<T>) nopanic {
//         self.balances.squash();
//     }
// }




// impl UserDatabaseImpl of UserDatabaseTrait {
//     // Creates a database
//     fn new() -> UserDatabase<T> {
//         UserDatabase { users_updates: 0, balances: Felt252Dict::new() }
//     }

//     fn update_user(ref self: UserDatabase, name: felt252, balance: felt252) {
//         self.balances.insert(name, balance);
//         self.users_updates += 1;
//     }

//     fn get_balance(ref self: UserDatabase, name: felt252) -> felt252 {
//         self.balances.get(name)
//     }
// }

#[derive(Drop)]
struct Cart {
    paid: bool,
    items: u256,
    buyer: ByteArray,
}

fn pass_data(cart: Cart) {
    println!("{} is shopping today and bought {} items", cart.buyer, cart.items);
}

fn pass_pointer(cart: Box<Cart>) {
    let cart = cart.unbox();
    println!("{} is shopping today and bought {} items", cart.buyer, cart.items);
}

use core::circuit::{
    AddInputResultTrait, CircuitElement, CircuitInput, CircuitInputs, CircuitModulus,
    CircuitOutputsTrait, EvalCircuitTrait, circuit_add, circuit_mul, u384,
};

// Circuit: a * (a + b)
// witness: a = 10, b = 20
// expected output: 10 * (10 + 20) = 300
fn eval_circuit() -> (u384, u384) {
    let a = CircuitElement::<CircuitInput<0>> {};
    let b = CircuitElement::<CircuitInput<1>> {};

    let add = circuit_add(a, b);
    let mul = circuit_mul(a, add);

    let output = (mul,);

    let mut inputs = output.new_inputs();
    inputs = inputs.next([10, 0, 0, 0]);
    inputs = inputs.next([20, 0, 0, 0]);

    let instance = inputs.done();

    let bn254_modulus = TryInto::<
        _, CircuitModulus,
    >::try_into([0x6871ca8d3c208c16d87cfd47, 0xb85045b68181585d97816a91, 0x30644e72e131a029, 0x0])
        .unwrap();

    let res = instance.eval(bn254_modulus).unwrap();

    let add_output = res.get_output(add);
    let circuit_output = res.get_output(mul);

    assert!(add_output == u384 { limb0: 30, limb1: 0, limb2: 0, limb3: 0 }, "add_output");
    assert!(circuit_output == u384 { limb0: 300, limb1: 0, limb2: 0, limb3: 0 }, "circuit_output");

    (add_output, circuit_output)
}

use core::num::traits::Pow;

// Call into the Rust oracle to get the square root of an integer.
fn sqrt_call(x: u64) -> oracle::Result<u64> {
    oracle::invoke("stdio:cargo -q run --manifest-path ./src/my_oracle/Cargo.toml", 'sqrt', (x,))
}

// Call into the Rust oracle to convert an integer to little-endian bytes.
fn to_le_bytes(val: u64) -> oracle::Result<Array<u8>> {
    oracle::invoke(
        "stdio:cargo -q run --manifest-path ./src/my_oracle/Cargo.toml", 'to_le_bytes', (val,),
    )
}

fn oracle_calls(x: u64) -> Result<(), oracle::Error> {
    let sqrt = sqrt_call(x)?;
    // CONSTRAINT: sqrt * sqrt == x
    assert!(sqrt * sqrt == x, "Expected sqrt({x}) * sqrt({x}) == x, got {sqrt} * {sqrt} == {x}");
    println!("Computed sqrt({x}) = {sqrt}");

    let bytes = to_le_bytes(x)?;
    // CONSTRAINT: sum(bytes_i * 256^i) == x
    let mut recomposed_val = 0;
    for (i, byte) in bytes.span().into_iter().enumerate() {
        recomposed_val += (*byte).into() * 256_u64.pow(i.into());
    }
    assert!(
        recomposed_val == x,
        "Expected recomposed value {recomposed_val} == {x}, got {recomposed_val}",
    );
    println!("le_bytes decomposition of {x}) = {:?}", bytes.span());

    Ok(())
}

use anyhow::ensure;
use cairo_oracle_server::Oracle;
use std::process::ExitCode;



#[executable]
pub fn main() {


    let new_struct = Cart { paid: true, items: 1, buyer: "Eli" };
    pass_data(new_struct);

    let new_box = BoxTrait::new(Cart { paid: false, items: 2, buyer: "Uri" });
    pass_pointer(new_box);

    // 12.6 - Hashes
    // At its essence hashing is a process of converting input data (often called a message) of any length into a fixed-size value, typically referred to as `hash`
    // This transformation is deterministic, meaning that the same input will always produce the same hash value.

    let name: ByteArray = "Maria";
    println!("Hello, {}.", name);

    // 12.10 - Printing
    let a = 10;
    let a = 20;
    let a = 30;

    println!("Hello world!");
    println!("{} {} {}", a b c); // 10 20 30
    println!("{c} {a} {}", b); // 30 10 20

    // // Formatting
    let s1: ByteArray = "tic";
    let s2: ByteArray = "tac";
    let s3: ByteArray = "toe";
    let s = s1 + "-" + s2 + "-" + s3;
    // using + operator consumes the strings, so they can't be used again!

    let s1: ByteArray = "tic";
    let s2: ByteArray = "tac";
    let s3: ByteArray = "toe";
    let s = format!("{s1}-{s2}-{s3}"); // s1, s2, s3 are not consumed by format!
    // or
    let s = format!("{}-{}-{}", s1, s2, s3);

    println!("{}", s);


    // 12.11 - Arithmetic Circuits
    eval_circuit();

    // 12.12 - Offloading Computations with Oracles
    

    match oracle_calls(x) {
        Ok(()) => true,
        Err(e) => panic!("Oracle call failed: {e:?"),
    }

    Oracle::new()
        .provide("sqrt", |value: u64| {
            let sqrt = (value as f64).sqrt() as u64;
            ensure!(
                sqrt * sqrt == value,
                "Cannot compute integer square root of {value}"
            );
            Ok(sqrt)
        })
        .provide("to_le_bytes", |value: u64| {
            let value_bytes = value.to_le_bytes();
            Ok(value_bytes.to_vec())
        })
        .run()



}