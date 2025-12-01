run day part:
    cargo fmt --manifest-path day-{{day}}/Cargo.toml
    cargo run --manifest-path day-{{day}}/Cargo.toml --bin part{{part}}
