fn main() {
    let res =
        include_str!("input.txt")
            .lines()
            .into_iter()
            .fold((50, 0), |(mut cur, mut count), l| {
                let mut number: i32 = l[1..].parse().unwrap();
                if l.starts_with("L") {
                    number = -number
                }
                cur = (cur + number) % 100;

                if number < 0 {
                    cur += 100;
                }
                if cur == 100 {
                    cur = 0;
                }
                if cur == 0 {
                    count += 1;
                }

                dbg!(cur);
                (cur, count)
            });

    dbg!(res);
}
