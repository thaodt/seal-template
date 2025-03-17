// Get the user input from placeholders
let project_authors = variable::get("project_authors");
let tokio_features = variable::get("tokio_features");

// Format the authors array
let authors_array = "";
let author_list = project_authors.split(",");
for i in range(0, author_list.len()) {
    let author = author_list[i].trim();
    authors_array += `    "${author}"`;
    if i < author_list.len() - 1 {
        authors_array += ",\n";
    }
}

// Format the tokio features
let features_array = "";
let feature_list = tokio_features.split(",");
for i in range(0, feature_list.len()) {
    let feature = feature_list[i].trim();
    features_array += `"${feature}"`;
    if i < feature_list.len() - 1 {
        features_array += ", ";
    }
}

// Read the Cargo.toml file using system command
let cargo_toml_path = "Cargo.toml";
let cargo_toml_content = system::command("cat", [cargo_toml_path]);

// Replace the placeholders in Cargo.toml
let updated_cargo_toml = cargo_toml_content
    .replace("{{project_authors}}", authors_array)
    .replace("\"{{tokio_features}}\"", features_array);

// Write the modified content back to Cargo.toml
file::write(cargo_toml_path, updated_cargo_toml);
