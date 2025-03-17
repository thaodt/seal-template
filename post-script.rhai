
use std::fs::File;
use std::io::Write;

// Load the Cargo.toml file
let cargo_toml_path = "Cargo.toml";
let cargo_toml_content = std::fs::read_to_string(cargo_toml_path).unwrap();

// Read the user input from placeholders
let authors = env::var("CARGO_GENERATE_AUTHORS").unwrap();
let tokio_features = env::var("CARGO_GENERATE_TOKIO_FEATURES").unwrap();

// Split the authors into an array
let authors_array = authors.split(',').map(|a| format!("\"{}\"", a.trim())).collect::<Vec<_>>().join(",\n    ");

// Split the features into an array
let features_array = tokio_features.split(',').map(|f| format!("\"{}\"", f.trim())).collect::<Vec<_>>().join(", ");

// Replace the authors and Tokio features in Cargo.toml with the formatted arrays
let modified_content = cargo_toml_content
    .replace(&format!("authors = [\n    {{authors}}\n]", authors), &format!("authors = [\n    {}\n]", authors_array))
    .replace(&format!("features = [\"{}\"]", tokio_features), &format!("features = [{}]", features_array));

// Write the modified Cargo.toml
let mut file = File::create(cargo_toml_path).unwrap();
file.write_all(modified_content.as_bytes()).unwrap();
