// Get the tokio features from the placeholder
let tokio_features = variable::get("tokio_features");

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

// Use sed to replace the tokio features placeholder in Cargo.toml
let sed_command = `s/\"{{tokio_features}}\"/${features_array}/g`;
system::command("sed", ["-i", sed_command, "Cargo.toml"]);
