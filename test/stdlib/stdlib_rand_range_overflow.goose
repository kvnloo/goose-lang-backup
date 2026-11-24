import std;

fn main() {
    var r = rng { 1 };
    let largest = 9223372036854775807;
    let smallest = -9223372036854775808;
    print(r.rand_range(largest, 1) == largest);
    print(r.rand_range(smallest, 1) == smallest);
    let boundary = r.rand_range(largest - 1, 2);
    print(boundary == largest - 1 || boundary == largest);
    // The first draw with this state used to wrap to i64.min.
    r.s = 1;
    print(r.rand_range(largest, 2));
}
