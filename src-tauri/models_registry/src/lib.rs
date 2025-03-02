extern crate proc_macro;
use proc_macro::TokenStream;
use quote::quote;
use syn::{parse_macro_input, ItemStruct};

#[proc_macro_derive(Model)]
pub fn model_derive(input: TokenStream) -> TokenStream {
    let input = parse_macro_input!(input as ItemStruct);
    let struct_name = &input.ident;

    let register_fn_model = syn::Ident::new(
        &format!("_register_{}", struct_name.to_string().to_lowercase()),
        struct_name.span(),
    );

    let expanded = quote! {
        impl langres_core::Model for #struct_name {
            fn name() -> &'static str {
                stringify!(#struct_name)
            }

            fn path() -> &'static str {
                module_path!()
            }
        }

        #[::ctor::ctor]
        fn #register_fn_model() {
            langres_core::MODEL_REGISTRY.lock().unwrap().push(
                langres_core::Import {
                    name: [stringify!(#struct_name).to_string()].to_vec(),
                    path: module_path!().to_string(),
                }
            );
        }
    };

    TokenStream::from(expanded)
}
