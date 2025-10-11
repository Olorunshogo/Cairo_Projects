
/// Checks if a number is prime
/// 
/// # Arguments
/// 
/// * `n` - The number to check
/// 
/// # Return
/// 
/// * `true` if the number is prime
/// 
/// * `false` if the number is not prime

fn is_prime(n: u128) -> bool {
    // u32: an unsigned 32 bit integer
    if n <= 1 {
        return false;
    }
    if n == 2 {
        return true;
    }
    if n % 2 == 0 {
        return false;
    }
    let mut i = 3;
    loop {
        if i * i > n {
            return true;
        }
        if n % i == 0 {
            return false;
        }
        i += 2;
    }

    // SHA256:brPoDTRKC5ZGhBLcLvHegA91j9aq7b/Xq5smDqcRI/E 
    // ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII6n/KcSAFzUL6VGi+pJKIXKj28nxT32GlGMWu2+3pxE shownzy001@gmail.com
}

// Executable entry point
#[executable]
fn main(input: u128) -> bool {
    println!("2.0 - COMMON PROGRAMMING CONCEPTS");
    
    if input > 1000000 { // Arbitrary limit for demo purposes
        panic!("Input too large, must be <= 1,000,000");
        println!("Input too large now. You self check am.");
        println!("Hello, World!");
    }
    is_prime(input)
}
