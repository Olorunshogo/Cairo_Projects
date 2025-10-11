

// use core::dict::Felt252Dict;
use core::dict::{Felt252Dict, Felt252DictEntryTrait};
use core ::nullable::{NullableTrait};


fn append_value(ref dict: Felt252Dict<Nullable<Array<u8>>>, index: felt252, value: u8) {
    let (entry, arr) = dict.entry(index);
    let mut unboxed_val = arr.deref_or(array![]);
    unboxed_val.append(value);
    dict = entry.finalize(NullableTrait::new(unboxed_val));
}

fn get_array_entry(ref dict: Felt252Dict<Nullable<Array<u8>>>, index: felt252) -> Span<u8> {
    let (entry, _arr) = dict.entry(index);
    let mut arr = _arr.deref_or(array![]);
    let span = arr.span();
    dict = entry.finalize(NullableTrait::new(arr));
    span
}

#[executable]
fn main() {
    // 3.0 ARRAYS
    println!("3.0 - COMMON COLLETIONS");

    // An array is a collection of elements of the same type. 
    // You can create and use array methods by using `ArrayTrait` trait from the core library.

    // Arrays have limited modifications: once a memory slot is written to, it cannot be overwritten, but only read from it.
    // You can only append items to the end of an array and remove items from the front.

    // // 4.1 Creating an Array
    let mut array_1 = ArrayTrait::<u128>::new();
    
    // Updating an Array
    array_1.append(0);
    array_1.append(12);
    array_1.append(2);
    array_1.append(3);
    array_1.append(12);
    array_1.append(10);

    // println!("The content of array_1 is: {}", array_1);

    // Removing Elements
    // let first_value = array_1.pop_front().unwrap();
    // println!("The first value is: {}", first_value);

    // Reading Elements from an Array
    // To access array elements, you can use `get()` or `at()` array methods that return different types.
    // Using `arr.at(index)` is equivalent to using the subscripting operator `arr[index]`.

    // get() Method
    // array_1.append(100);
    // array_1.append(22);

    // Using the `at()` method
    // let first = *array_1.at(0);
    // assert!(first == 12);
    // println!("The value of first is: {}", first);

    // let second = *array_1[1];
    // assert!(second == 12);
    // print!("The value of second is: {}", second);

    // Storing Multiple Types with Enums
    // #[derive(Copy, Drop)]
    // enum Data {
    //     Integer: u128,
    //     Felt: felt252,
    //     Tuple: (u32, u32),
    // }

    // let mut messages: Array<Data> = array![];
    // messages.append(Data::Integer(100));
    // messages.append(Data::Felt('Hello World!'));
    // messages.append(Data::Tuple((10, 30)));

    // array_1.span();

    // // 3.2 Dictionaries
    // let mut balances: Felt252Dict<u64> = Default::default();

    // balances.insert("Alex", 100);
    // balances.insert("Maria", 200);

    // let alex_balance = balances.get("Alex");
    // // Check that Alex balance indeed has 100 associated with him
    // assert!(alex_balance == 100, "Balance is not 100");
    // print!("Alex balance is: {}", alex_balance);

    // balances.insert("Alex", 200);
    // assert!(alex_balance == 100, "Balance is not 100");
    // print!("Alex balance is: {}", alex_balance);

    // balances.insert("Alex", 200);
    // let alex_balance_2 = balances.get("Alex");
    // // Check if the new balance is correct
    // assert!(alex_balance_2 == 200, "Balance is not 200");
    // print!("Maria balance is: {}", alex_balance_2);

    // fn entry(self: Felt252Dict<T>, key: felt252) -> (Felt252DictEntry<T>, T) nopanic
    // fn finalize(self: Felt252DictEntry<T>, new_value: T) -> Felt252Dict<T>

    // Create the dictionary
    // let mut d: Felt252Dict<Nullable<Span<felt252>>> = Default::default();

    // // Create the array to insert
    // let array_inser = array![8, 9, 10];

    // // Inser it as a `Span`
    // d.insert(0, NullableTrait::new(array_inser.span()));

    // Get value back
    // let val = d.get(0);

    // // Search the value and assert it is not null
    // let span = match match_nullable(val) {
    //     FromNullableResult::Null => panic!("No value found"),
    //     FromNullableResult::NotNull(val) => val.unbox(),
    // };

    // // Verify we are having the right values
    // assert!(*span.at(0) == 8, "Expecting 8");
    // assert!(*span.at(1) == 9, "Expecting 9");
    // assert!(*span.at(2) == 10, "Expecting 10");

    let arr = array![20, 19, 26];
    let mut dict: Felt252Dict<Nullable<Array<u8>>> = Default::default();
    dict.insert(0, NullableTrait::new(arr));
    println!("Before insertion: {:?}", get_array_entry(ref dict, 0));

    append_value(ref dict, 0, 30);

    println!("After insertion: {:?}", get_array_entry(ref dict, 0));


    
}

