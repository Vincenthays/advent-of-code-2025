fn main() {
    let res = include_str!("input.txt")
        .lines()
        .fold((50, 0), |(cur, mut count), line| {
            let delta = {
                let n: i32 = line[1..].parse().unwrap();
                if line.starts_with('L') { -n } else { n }
            };

            let mut cur = cur + delta;
            while cur < 0 {
                cur += 100;
            }
            while cur > 100 {
                cur -= 100;
            }
            if cur == 100 {
                cur = 0;
            }
            if cur == 0 {
                count += 1
            }
            (cur, count)
        });

    dbg!(res);
}
