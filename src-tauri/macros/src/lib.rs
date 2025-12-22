use std::fs;
use std::path::PathBuf;

use proc_macro::TokenStream;
use quote::quote;
use serde_yaml::Value;

const PARSE_ERROR: &str = "Failed to parse script";
const FILE_ERROR: &str = "Failed to read script";
const SERIALIZE_ERROR: &str = "Failed to serialize script";
const RUNTIME_PARSE_ERROR: &str = "Failed to parse script as value";

fn script_parser(module: &str, model: &str) -> TokenStream {
    let script_path = PathBuf::from(&format!("./initial_datas/{}.yml", module));

    let content = fs::read_to_string(&script_path).expect(FILE_ERROR);

    let script: Value = serde_yaml::from_str(&content).expect(PARSE_ERROR);

    let script_yaml_string = serde_yaml::to_string(&script).expect(SERIALIZE_ERROR);

    let module_path =
        syn::parse_str::<syn::Path>(&format!("crate::{}::models::{}", module, model)).unwrap();

    let expanded = quote! {
        #module_path::from_value(
            serde_yaml::from_str(#script_yaml_string).expect(#RUNTIME_PARSE_ERROR),
        )
    };

    TokenStream::from(expanded)
}

#[proc_macro]
pub fn settings_initial_datas(_input: TokenStream) -> TokenStream {
    script_parser("application", "ApplicationSettings")
}

#[proc_macro]
pub fn storyline_initial_datas(_input: TokenStream) -> TokenStream {
    script_parser("storyline", "Story")
}

#[proc_macro]
pub fn objects_initial_datas(_input: TokenStream) -> TokenStream {
    script_parser("objects", "Object")
}

#[proc_macro]
pub fn loot_initial_datas(_input: TokenStream) -> TokenStream {
    script_parser("loot", "Loot")
}

#[proc_macro]
pub fn functions_initial_datas(_input: TokenStream) -> TokenStream {
    script_parser("functions", "Function")
}

#[proc_macro]
pub fn quests_initial_datas(_input: TokenStream) -> TokenStream {
    script_parser("quests", "Quest")
}

#[proc_macro]
pub fn npcs_initial_datas(_input: TokenStream) -> TokenStream {
    script_parser("npcs", "Npc")
}
