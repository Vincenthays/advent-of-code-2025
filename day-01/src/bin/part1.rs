fn main() {
    let res = include_str!("input.txt")
        .lines()
        .fold((50, 0), |(cur, mut count), line| {
            let delta = {
                let n: i32 = line[1..].parse().unwrap();
                if line.starts_with('L') { -n } else { n }
            };

            let cur = (cur + delta).rem_euclid(100);
            let count = if cur == 0 { count + 1 } else { count };
            (cur, count)
        });

    dbg!(res);
}
