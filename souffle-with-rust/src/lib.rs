#[no_mangle]
pub extern "C" fn double(number: usize) -> usize {
    number + number
}
