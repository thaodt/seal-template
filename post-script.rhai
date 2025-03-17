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

// Update the Cargo.toml file directly
let cargo_toml = file::read_to_string("Cargo.toml");
let updated_cargo_toml = cargo_toml
    .replace("{{project_authors}}", authors_array)
    .replace("\"{{tokio_features}}\"", features_array);
file::write("Cargo.toml", updated_cargo_toml);

