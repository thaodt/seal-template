
// Read the Cargo.toml file
let cargo_toml_path = "Cargo.toml";
let cargo_toml_content = read_file(cargo_toml_path);

// Get the user input from placeholders
let authors = variable::get("project_authors");
let tokio_features = variable::get("tokio_features");

// Format the authors array
let authors_array = "";
let author_list = authors.split(",");
for (i, author) in author_list.enumerate() {
    authors_array += "    \"" + author.trim() + "\"";
    if i < author_list.len() - 1 {
        authors_array += ",\n";
    }
}

// Format the tokio features
let features_array = "";
let feature_list = tokio_features.split(",");
for (i, feature) in feature_list.enumerate() {
    features_array += "\"" + feature.trim() + "\"";
    if i < feature_list.len() - 1 {
        features_array += ", ";
    }
}

// Replace the placeholders in Cargo.toml
let modified_content = cargo_toml_content
    .replace("{{project_authors}}", authors_array)
    .replace("\"{{tokio_features}}\"", features_array);

// Write the modified content back to Cargo.toml
write_file(cargo_toml_path, modified_content);
