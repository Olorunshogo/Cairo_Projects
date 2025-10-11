

pub mod garden;

pub mod front_of_house {
   pub mod hosting {
        pub fn add_to_waitlist() {}
        pub fn seat_at_table() {}
    }

    // pub mod serving {
    //     fn take_order() {}
    //     fn serve_order() {}
    //     fn take_payment() {}
    // }
}

use crate::backyard::front_of_house::hosting;
use core::num::traits::BitSize;
use core::array::ArrayTrait as Arr;


pub fn eat_at_restaurant() {
   hosting::add_to_waitlist();
   hosting::seat_at_table();
}

fn deliver_order() {}

mod back_of_house {
    fn fix_incorrect_order() {
        cook_order();
        super::deliver_order();
    }

    fn cook_order() {}
}

// Assuming we have a module called `shapes` with the structures `Square`
mod shapes {
    #[derive(Drop)]
    pub struct Square {
        pub side: u32,
    }

    #[derive(Drop)]
    pub struct Circle {
        pub radius: u32,
    }

    #[derive(Drop)]
    pub struct Triangle {
        pub base: u32,
        pub height: u32,
    }
}

// We can import the structures `Square`, `Circle`, and `Triangle` from this:
use shapes::{Circle, Square, Triangle};



#[executable]
fn main() {
    // 7.0 - Managing Cairo Projects with Packages, Crates and Modules
    println!("7.0 - MANAGING CAIRO PROJECTS WITH PACKAGES, CRATES AND MODULES");

    // Ciaro uses features called MODULE SYSTEM that allows us to manage our code organization. 
    // They include: 
        // + Packages: A scarb feature that lets you build, test, and share crates.
        // + Crates: A tree of modules that corresponds to a single compilation unit. 
        //      It has a root directory, and a root module defined at the lib.cairp file under this directory.
        // + Modules and Use: Let you control the organization and scope of items.
        // + Paths: a way of naming an item, such a struct , function, or module.

    // // 7.1 - Packages and Crates
    println!("7.1 - Packages and Crates");
    // A crate is a subset of a package that is used in the actual Cairo compilation. 
    // Crates can contain modules, and the modules may be defined in other files that get compiled with the crate, as will be discussed in the subsequent sections.

    // The crate root is the `lib.cairo` source file that the Cairo compiler starts from and makes up the root module of the crate.
    // A Cairo package is a directory (or equivalent) containing:
        // A Scarb.toml manifest file with a `[package]` section:  This is a package manifest file, which contains metadata configuration options for the package, such as dependencies, package name, version, and authors. 
        // Associated source code.
        
    // // 7.2 - Defining Modules to Control Scope
    println!("7.2 - Defining Modules to Control Scope");

    // // 7.3 - Paths for Referring to an item in the Module Tree
    println!("7.3 - Paths for Referring to an item in the Module Tree");

    // // 7.4 - Bringing Paths into Scope with the use Keyword
    println!("7.4 - Bringing Paths into Scope with the use Keyword");

    let u8_size: usize = BitSize::<u8>::bits();
    println!("A u8 variable has {} bits", u8_size);

    let mut arr = Arr::new(); // ArrayTrait was renamed to Arr
    arr.append(1);

    // Now, we can directly use `Square`, `Circle`, and `Triangle`
    let sq = Square { side: 5 };
    println!("The value of the shape is: {}", sq);
    let cr = Circle { radius: 3 };
    println!("The value of the shape is: {}", cr);
    let tr = Triangle { base: 5, height: 2 };
    println!("The value of the shape is: {}", tr);

    // // 7.5 - Separating Modules into Different Files
    println!("7.5 - Separating Modules into Different Files");



}