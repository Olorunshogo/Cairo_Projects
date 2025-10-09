
#[derive(Drop)]
struct User {
    active: bool,
    username: ByteArray,
    email: ByteArray,
    sign_in_count: u64,
}


#[derive(Copy, Drop, PartialEq)]
struct Rectangle {
    width: u64,
    height: u64,
}

fn area(rectangle: Rectangle) -> u64 {
   rectangle.width * rectangle.height
}

#[derive(Drop)]
struct Square {
    side_length: u64,
}

impl SquareIntoRectangle of Into<Square, Rectangle> {
    fn into(self: Square) -> Rectangle {
        Rectangle { width: self.side_length, height: self.side_length }
    }
}

impl RectangleIntoSquare of TryInto<Rectangle, Square> {
    fn try_into(self: Rectangle) -> Option<Square> {
        if self.height == self.width {
            Some(Square { side_length: self.height })
        } else {
            None
        }
    }
}

// trait RectangleTrait {
//     fn area(self: @Rectangle) -> u64;
// }

#[generate_trait] // Do this instead of explicitly defining it above.
impl RectangleImpl of RectangleTrait {
    fn area(self: @Rectangle) -> u64 {
        (*self.width) * (*self.height)
    }

    fn multiply(ref self: Rectangle, multiple: u64) {
        self.width *= multiple;
        self.height *= multiple;
    }

    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool {
        *self.width > *other.width && *self.height > *other.height
    }

    fn new(width: u64, height: u64) -> Rectangle {
        Rectangle { width, height }
    }

    fn square(size: u64) -> Rectangle {
        Rectangle { width: size, height: size }
    }

    fn avg(lhs: @Rectangle, rhs: @Rectangle) -> Rectangle {
        Rectangle {
            width: ((*lhs.width) + (*rhs.width)) / 2,
            height: ((*lhs.height) + (*rhs.height)) / 2,
        }
    }
}




#[executable]
fn main() {
    println!("5.0 - USING STRUCTS TO STRUCTURE RELATED DATA");

    // // 5.1 - Defining and Instantiating structs
    println!("5.1 - Defining and Instantiating structs");

    // A struct, or structure, is a custom data type that lets you package together and name multiple related values that make up a meaningful group.
    let user_1 = User {
        active: true,
        username: "someusername123",
        email: "someone@example.com",
        sign_in_count: 1,
    };
    println!("User 1's username is: {}", user_1.username);
    // let mut user_2 = User {
    //     active: user_1.active,
    //     username: user_1.username,
    //     email: "secondemail@example.com",
    //     sign_in_count: user_1.sign_in_count, 
    // };
    let mut user_2 = User { email: "secondemail@example.com", ..user_1 };
    println!("User 2's email is: {}", user_2.email);
    user_2.email = "anotheremail@example.com";
    println!("User 2's email is: {}", user_2.email);

    // // 5.2 - An Example Program Using Structs
    println!("5.2 - An Example Program Using Structs");
    // let rectangle = (30, 10);
    // let area = area(rectangle);
    // println!("Area is: {}", area);

    let rectangle = Rectangle { width: 30, height: 10 };
    let area = area(rectangle);
    println!("Area of the rectangle is: {}", area);

    // Converting a square to a rectangle
    let square = Square { side_length: 5 };
    // Compiler will complain if you remove the type annotation
    let square_result: Rectangle = square.into();
    let square_expected = Rectangle { width: 5, height: 5 };
    assert!(
        square_result == square_expected,
        "A square is always convertible to a rectangle with the same width and height!"
    );

    // Converting a rectangle to a square
    // let rectangle_square = Rectangle { width: 8, height: 8 };
    // let rectangle_result: Square = rectangle_square.try_into().unwrap();
    // let rectangle_expected = Square { side_length: 8 };
    // assert!(
    //     rectangle_result == rectangle_expected,
    //     "Rectangle width equal width and height should be convertible to a square.",
    // );
    let rectangle_square = Rectangle { width: 5, height: 8 };
    let rectangle_result: Option<Square> = rectangle_square.try_into();
    assert!(
        rectangle_result.is_none(),
        "Rectangle with different width and height should not be convertible to a square.",
    );

    // // 5.3 - Method Syntax
    println!("5.3 - Method Syntax");

    // Mthods are similar to function: we declare them with the `fn` keyword and a name, they can have parameters and a return value, and they contain some code that's run when the method is called from somewhere else.
    // Unlike functions, methods are defined within the context of a struct (or an enum), and their first parameter is always `self`, which represents the instance of the type the method is being called on.

    let rectangle_1 = Rectangle { width: 30, height: 50 };
    println!("Area of rectangle_1 is: {}", rectangle_1.area());

    let mut rectangle_2 = Rectangle { width: 10, height: 20 };
    rectangle_2.multiply(3);
    println!("The new size is (width: {}, height: {})", rectangle_2.width, rectangle_2.height);

    let rectangle_3 = Rectangle { width: 60, height: 45 };
    println!("Can rectangle_1 hold rectangle_2? {}", rectangle_1.can_hold(@rectangle_2));
    println!("Can rectangle_1 hold rectangle_3? {}", rectangle_1.can_hold(@rectangle_3));




}

