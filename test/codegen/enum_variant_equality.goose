enum Mode { Off, Level { value: i64 } }
enum Message { Empty, Text { value: u8[] } }
enum Box<T> { Empty, Value { value: T } }

fn level(value: i64) -> Mode.Level { Mode.Level { value: value } }
fn read_enum() -> Mode { print("enum"); Mode.Level { value: 7 } }
fn read_variant() -> Mode.Level { print("variant"); Mode.Level { value: 7 } }

fn main() {
    let fixed: Mode = Mode.Level { value: 7 };
    let variant = Mode.Level { value: 7 };
    print(fixed == variant, " ", variant == fixed);
    print(fixed != level(8), " ", level(8) != fixed);
    print(fixed == Mode.Off {}, " ", Mode.Off {} != fixed);

    let empty: Mode = Mode.Off;
    print(empty == Mode.Off {}, " ", Mode.Off {} == empty);

    let message: Message.. = Message.Text { value: "hello" };
    let text = Message.Text { value: "hello" };
    print(message == text, " ", text != message);
    print(Message.Text { value: "other" } == message, " ", message != Message.Empty {});

    let boxed: Box<i64> = Box<i64>.Value { value: 8 };
    print(Box<i64>.Value { value: 8 } == boxed);
    print(read_enum() == read_variant());
    print(read_variant() == read_enum());
}
